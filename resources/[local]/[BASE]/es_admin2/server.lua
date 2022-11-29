TriggerEvent("es:addGroup", "mod", "user", function(group) end)

-- Modify if you want, btw the _admin_ needs to be able to target the group and it will work
local groupsRequired = {
	slay = "mod",
	noclip = "mod",
	crash = "superadmin",
	freeze = "mod",
	bring = "mod",
	["goto"] = "mod",
	slap = "mod",
	slay = "mod",
	kick = "mod",
	ban = "admin"
}

local banned = ""
local bannedTable = {}

function loadBans()
	banned = LoadResourceFile("es_admin2", "data/bans.txt") or ""
	if banned then
		local b = stringsplit(banned, "\n")
		for k,v in ipairs(b) do
			bannedTable[v] = true
		end
	end

	if GetConvar("es_admin2_globalbans", "0") == "1" then
		PerformHttpRequest("http://essentialmode.com/bans.txt", function(err, rText, headers)
			local b = stringsplit(rText, "\n")
			for k,v in pairs(b)do
				bannedTable[v] = true
			end
		end)
	end
end

function isBanned(id)
	return bannedTable[id]
end

function banUser(id)
	banned = banned .. id .. "\n"
	SaveResourceFile("es_admin2", "data/bans.txt", banned, -1)
	bannedTable[id] = true
end

AddEventHandler('playerConnecting', function(user, set)
	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if isBanned(v) then
			set(GetConvar("es_admin_banreason", "Zostałeś permamentnie zbanowany na naszym serwerze."))
			CancelEvent()
			break
		end
	end
end)

RegisterServerEvent('es_admin:all')
AddEventHandler('es_admin:all', function(type)
	local Source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:canGroupTarget', user.getGroup(), "admin", function(available)
			if available or user.getGroup() == "superadmin" then
				if type == "slay_all" then TriggerClientEvent('es_admin:quick', -1, 'slay') end
				if type == "bring_all" then TriggerClientEvent('es_admin:quick', -1, 'bring', Source) end
				if type == "slap_all" then TriggerClientEvent('es_admin:quick', -1, 'slap') end
			else
				TriggerClientEvent('chatMessage', Source, "^3DREAM:", {255, 0, 0}, " ^7Nie posiadasz permisji.")
			end
		end)
	end)
end)

RegisterServerEvent('es_admin:quick')
AddEventHandler('es_admin:quick', function(id, type)
	local Source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:getPlayerFromId', id, function(target)
			TriggerEvent('es:canGroupTarget', user.getGroup(), groupsRequired[type], function(available)
				print('Available?: ' .. tostring(available))
				TriggerEvent('es:canGroupTarget', user.getGroup(), target.getGroup(), function(canTarget)
					if canTarget and available then
						if type == "slay" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "noclip" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "freeze" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "crash" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "bring" then TriggerClientEvent('es_admin:quick', id, type, Source) end
						if type == "goto" then TriggerClientEvent('es_admin:quick', Source, type, id) end
						if type == "slap" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "slay" then TriggerClientEvent('es_admin:quick', id, type) end
						if type == "kick" then DropPlayer(id, 'Kicked by es_admin GUI') end
					
						if type == "ban" then
							for k,v in ipairs(GetPlayerIdentifiers(id))do
								banUser(v)
							end
							DropPlayer(id, GetConvar("es_admin_banreason", "Zostałeś permamentnie zbanowany na naszym serwerze."))
						end
					else
						if not available then
							TriggerClientEvent('chatMessage', Source, '^3DREAM:', {255, 0, 0}, " ^7Twoja grupa nie jest wystarczająca do użycia tego")
						else
							TriggerClientEvent('chatMessage', Source, '^3DREAM:', {255, 0, 0}, " ^7Nie posiadasz permisji.")
						end
					end
				end)
			end)
		end)
	end)
end)

AddEventHandler('es:playerLoaded', function(Source, user)
	TriggerClientEvent('es_admin:setGroup', Source, user.getGroup())
end)

RegisterServerEvent('es_admin:set')
AddEventHandler('es_admin:set', function(t, USER, GROUP)
	local Source = source
	local typ = GetPlayerName(source)
	local idtypa = GetPlayerIdentifier(source)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		TriggerEvent('es:canGroupTarget', user.getGroup(), "admin", function(available)
			if available then
			if t == "group" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, " Nie znaleziono gracza.")
				else
					TriggerEvent("es:getAllGroups", function(groups)
						if(groups[GROUP])then
							TriggerEvent("es:setPlayerData", USER, "group", GROUP, function(response, success)
								TriggerClientEvent('es_admin:setGroup', USER, GROUP)
								--TriggerClientEvent('chatMessage', -1, "CONSOLE", {0, 0, 0}, "Group of ^2^*" .. GetPlayerName(tonumber(USER)) .. "^r^0 has been set to ^2^*" .. GROUP)
								sendToDiscord('DREAM','[ES_ADMIN2] '.. idtypa ..' | '.. typ ..' Zaktualizował grupę gracza '.. GetPlayerIdentifier(tonumber(USER)) ..' | ' .. GetPlayerName(tonumber(USER)) .. ' na: ' .. GROUP, 1752220)
								TriggerClientEvent('chat:addMessage', -1,{
									template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-user-lock"></i> {0} {1}</div>',
									args = {"^3DREAM:", "^7Grupa użytkownika ".. GetPlayerIdentifier(tonumber(USER)) .."  ".. GetPlayerName(tonumber(USER)) .." Została zaktualizowana na " .. GROUP}
								})
							end)
						else
							--TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, "Group not found")
							TriggerClientEvent('chat:addMessage', Source, {
								template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
								args = {" ^3DREAM:", "^7Nie ma takiej grupy"}
							})
						end
					end)
				end
			elseif t == "level" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, " Nie znaleziono gracza.")
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						TriggerEvent("es:setPlayerData", USER, "permission_level", GROUP, function(response, success)
							if(true)then
								TriggerClientEvent('chatMessage', -1, "CONSOLE", {0, 0, 0}, "Permission level of ^2" .. GetPlayerName(tonumber(USER)) .. "^0 has been set to ^2 " .. tostring(GROUP))
							end
						end)	
					else
						TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, " Nieprawidłowa wartość.")
					end
				end
			elseif t == "money" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, " Nie znaleziono gracza.")
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						TriggerEvent('es:getPlayerFromId', USER, function(target)
							target.setMoney(GROUP)
						end)
					else
						TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, "  Nieprawidłowa wartość.")
					end
				end
			elseif t == "bank" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, " Nie znaleziono gracza.")
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						TriggerEvent('es:getPlayerFromId', USER, function(target)
							target.setBankBalance(GROUP)
						end)
					else
						TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, " Nieprawidłowa wartość.")
					end
				end
			end
			else
				TriggerClientEvent('chatMessage', source, '^3DREAM:', {255, 0, 0}, " potrzebujesz superadmina by to zrobić.")
			end
		end)
	end)	
end)

-- Rcon commands
AddEventHandler('rconCommand', function(commandName, args)
	if commandName == 'setadmin' then
		if #args ~= 2 then
				RconPrint("Usage: setadmin [user-id] [permission-level]\n")
				CancelEvent()
				return
		end

		if(GetPlayerName(tonumber(args[1])) == nil)then
			RconPrint("Player not ingame\n")
			CancelEvent()
			return
		end

		TriggerEvent("es:setPlayerData", tonumber(args[1]), "permission_level", tonumber(args[2]), function(response, success)
			RconPrint(response)

			if(true)then
				print(args[1] .. " " .. args[2])
				TriggerClientEvent('es:setPlayerDecorator', tonumber(args[1]), 'rank', tonumber(args[2]), true)
				TriggerClientEvent('chatMessage', -1, "CONSOLE", {0, 0, 0}, "Permission level of ^2" .. GetPlayerName(tonumber(args[1])) .. "^0 has been set to ^2 " .. args[2])
			end
		end)

		CancelEvent()
	elseif commandName == 'setgroup' then
		if #args ~= 2 then
				RconPrint("Usage: setgroup [user-id] [group]\n")
				CancelEvent()
				return
		end

		if(GetPlayerName(tonumber(args[1])) == nil)then
			RconPrint("Player not ingame\n")
			CancelEvent()
			return
		end

		TriggerEvent("es:getAllGroups", function(groups)

			if(groups[args[2]])then
				TriggerEvent("es:setPlayerData", tonumber(args[1]), "group", args[2], function(response, success)

					if(true)then
						TriggerClientEvent('es:setPlayerDecorator', tonumber(args[1]), 'group', tonumber(args[2]), true)
						TriggerClientEvent('chatMessage', -1, "CONSOLE", {0, 0, 0}, "Group of ^2^*" .. GetPlayerName(tonumber(args[1])) .. "^r^0 has been set to ^2^*" .. args[2])
					end
				end)
			else
				RconPrint("This group does not exist.\n")
			end
		end)

		CancelEvent()
	elseif commandName == 'giverole' then
		if #args < 2 then
				RconPrint("Usage: giverole [user-id] [role]\n")
				CancelEvent()
				return
		end

		if(GetPlayerName(tonumber(args[1])) == nil)then
			RconPrint("Player not ingame\n")
			CancelEvent()
			return
		end

			TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
				table.remove(args, 1)
				user.giveRole(table.concat(args, " "))
				TriggerClientEvent("chatMessage", user.get('source'), "^3DREAM:", {255, 0, 0}, "You've been given a role: ^2" .. table.concat(args, " "))
			end)

		CancelEvent()
	elseif commandName == 'removerole' then
		if #args < 2 then
				RconPrint("Usage: removerole [user-id] [role]\n")
				CancelEvent()
				return
		end

		if(GetPlayerName(tonumber(args[1])) == nil)then
			RconPrint("Player not ingame\n")
			CancelEvent()
			return
		end

			TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
				table.remove(args, 1)
				user.removeRole(table.concat(args, " "))
				TriggerClientEvent("chatMessage", user.get('source'), "^3DREAM:", {255, 0, 0}, "A role was removed: ^2" .. table.concat(args, " "))
			end)

		CancelEvent()
	elseif commandName == 'setmoney' then
			if #args ~= 2 then
					RconPrint("Poprawne użycie: /setmoney [ID] [ILOŚĆ]\n")
					CancelEvent()
					return
			end

			if(GetPlayerName(tonumber(args[1])) == nil)then
				RconPrint("Player not ingame\n")
				CancelEvent()
				return
			end

			TriggerEvent("es:getPlayerFromId", tonumber(args[1]), function(user)
				if(user)then
					user.setMoney(tonumber(args[2]))

					local typ = GetPlayerName(source)
					local idtypa = GetPlayerIdentifier(source)

					RconPrint("Money set")
					--TriggerClientEvent('chatMessage', tonumber(args[1]), "CONSOLE", {0, 0, 0}, "Your money has been set to: ^2^*$" .. tonumber(args[2]))
				--	sendToDiscordMONEY('DREAM','[ES_ADMIN2] ID: ['..tonumber(args[1])..']  Nadał sobie $'.. tonumber(args[2]), 2899536)
					TriggerClientEvent('chat:addMessage', source, {
						template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
						args = {" ^3DREAM:", "^7Nie posiadasz permisji."}
					})
				end
			end)

			CancelEvent()
		end
end)

-- Default commands
TriggerEvent('es:addCommand', 'admin', function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " ^7Level: ^*^3 " .. tostring(user.get('permission_level')))
	TriggerClientEvent('chat:addMessage', source, {
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7Level: ^*^3 " ..tostring(user.get('permission_level'))}
	})
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " ^7Grupa: ^*^3 " .. user.getGroup())
	TriggerClientEvent('chat:addMessage', source, {
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7Grupa: ^*^3 " ..user.getGroup()}
	})
end, {help = "Pokaż swoją grupę."})

--[[ Default commands
TriggerEvent('es:addCommand', 'report', function(source, args, user)
	TriggerClientEvent('chatMessage', source, "REPORT", {255, 0, 0}, " (^2" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " "))

	TriggerEvent("es:getPlayers", function(pl)
		for k,v in pairs(pl) do
			TriggerEvent("es:getPlayerFromId", k, function(user)
				if(user.getPermissions() > 0 and k ~= source)then
					TriggerClientEvent('chatMessage', k, "REPORT", {255, 0, 0}, " (^2" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " "))
				end
			end)
		end
	end)
end, {help = "Report a player or an issue", params = {{name = "report", help = "What you want to report"}}})

-- Noclip]]
TriggerEvent('es:addGroupCommand', 'noclip', "admin", function(source, args, user)
	local typ = GetPlayerName(source)
	local idtypa = GetPlayerIdentifier(source)
	TriggerClientEvent("es_admin:noclip", source)
	sendToDiscord('DREAM','[ES_ADMIN2] '.. idtypa ..' | '.. typ ..' Włączył/wyłączył Noclipa ', 1752220)
end, function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Insufficienct permissions!")
	TriggerClientEvent('chat:addMessage', source, {
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7Nie posiadasz permisji."}
	})
end, {help = "Włącz lub wyłącz noclipa."})

-- Kicking
TriggerEvent('es:addGroupCommand', 'kick', "mod", function(source, args, user)
	if args[1] then
		if(GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])
			local typ = GetPlayerName(source)

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				local reason = args
				table.remove(reason, 1)
				if(#reason == 0)then
					reason = "Kicked: You have been kicked from the server"
				else
					reason = "Kicked: " .. table.concat(reason, " ")
				end

				TriggerClientEvent('chatMessage', -1, "^3DREAM:", {255, 0, 0}, "Player ^2" .. GetPlayerName(player) .. "^0 has been kicked(^2" .. reason .. "^0)")
				DropPlayer(player, reason)
				--sendToDiscord('DREAM','[ES_ADMIN2] '.. typ ..' Wyrzucił '.. GetPlayerName(player) ..' z powodu:' ..reason, 1752220)
			end)
		else
			--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Incorrect player ID!")
			TriggerClientEvent('chat:addMessage', source, {
				template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
				args = {" ^3DREAM:", "^7Nie poprawne ID!"}
			})
		end
	else
		--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Incorrect player ID!")
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
			args = {" ^3DREAM:", "^7Nie poprawne ID!"}
		})
	end
end, function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Insufficienct permissions!")
	TriggerClientEvent('chat:addMessage', source, {
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7Nie poprawne ID!"}
	})
end, {help = "Wyrzucanie gracza", params = {{name = "ID", help = "ID Gracza"}, {name = "POWÓD", help = "Powód wyrzucenia"}}})


TriggerEvent('es:addGroupCommand', 'adm', "mod", function(source, args, user)
	--TriggerClientEvent('chatMessage', -1, "ANNOUNCEMENT", {255, 0, 0}, "" .. table.concat(args, " "))

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(255, 186, 130, 0.4); border-radius: 10px;"><i class="fas fa-user-shield"></i>&nbsp; {0}: {1}</div>',
		args = { "ADMIN - "..  GetPlayerName(source) .."", "" .. table.concat(args, " ") }
	})

	sendToDiscordADM('DREAM - Chat','[ADMIN] [' .. source .. '] ' .. GetPlayerName(source) .. ' Hex: ' .. GetPlayerIdentifier(source) .. ': ' ..  table.concat(args, " "), 1752220)
end, function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Insufficienct permissions!")
	TriggerClientEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7 Brak permisji"}
	})
end, {help = "", params = {{name = "ogłoszenie", help = "Treść ogłoszenia"}}})




-- Freezing
local frozen = {}
TriggerEvent('es:addGroupCommand', 'freeze', "mod", function(source, args, user)
	if args[1] then
		if(GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				if(frozen[player])then
					frozen[player] = false
				else
					frozen[player] = true
				end

				TriggerClientEvent('es_admin:freezePlayer', player, frozen[player])

				local state = "odmrożony"
				if(frozen[player])then
					state = "zamrożony"
				end

				--TriggerClientEvent('chatMessage', player, "^3DREAM:", {255, 0, 0}, " Zostałeś " .. state .. " przez ^2" .. GetPlayerName(source))
				TriggerClientEvent('chat:addMessage', player,{
					template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
					args = {" ^3DREAM:", "^7 Zostałeś "..state.." przez ^2" .. GetPlayerName(source)}
				})
				--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Gracz ^2" .. GetPlayerName(player) .. "^0 został " .. state)
				TriggerClientEvent('chat:addMessage', source,{
					template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
					args = {" ^3DREAM:", "^7 Gracz ^2" .. GetPlayerName(player) .. "^0 został " .. state}
				})
			end)
		else
			--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
			TriggerEvent('chat:addMessage', source,{
				template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
				args = {" ^3DREAM:", "^7 Błędne ID!"}
			})
		end
	else
		--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
		TriggerEvent('chat:addMessage', source,{
			template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
			args = {" ^3DREAM:", "^7 Błędne ID!"}
		})
	end
end, function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Brak permisji!")
	TriggerClientEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7 Brak permisji"}
	})
end, {help = "Zamróź lub odmróź gracza.", params = {{name = "ID", help = "ID Gracza"}}})

-- Bring
local frozen = {}
TriggerEvent('es:addGroupCommand', 'bring', "mod", function(source, args, user)
	if args[1] then
		if(GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:teleportUser', target.get('source'), user.getCoords().x, user.getCoords().y, user.getCoords().z)
				sendToDiscordBRINGGOTO('DREAM - GOTO','[ES_ADMIN2] ['..source..'] '..GetPlayerName(source)..' | '..GetPlayerIdentifier(source)..' Przeteleportował do siebie ['..player..'] '..GetPlayerName(player)..' | '..GetPlayerIdentifier(player), 2899536)

				--TriggerClientEvent('chatMessage', player, "^3DREAM:", {255, 0, 0}, " Zostałeś przeteleportowany do: ^2" .. GetPlayerName(source))
				TriggerClientEvent('chat:addMessage', player, {
					template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
					args = {" ^3DREAM:", "^7Zostałeś przeteleportowany do: ^2" .. GetPlayerName(source)}
				})
				--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Gracz ^2" .. GetPlayerName(player) .. "^0 został przeteleportowany do ciebie.")
				TriggerClientEvent('chat:addMessage', source, {
					template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
					args = {" ^3DREAM:", " ^7Gracz ^2" .. GetPlayerName(player) .. "^0 został przeteleportowany do ciebie."}
				})

			end)
		else
		--	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
		TriggerEvent('chat:addMessage', source,{
			template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
			args = {" ^3DREAM:", "^7 Błędne ID!"}
		})
		end
	else
	--	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
	TriggerEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7 Błędne ID!"}
	})
	end
end, function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Brak permisji!")
	TriggerClientEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7 Brak permisji"}
	})
end, {help = "Teleport gracza do siebie", params = {{name = "ID", help = "ID Gracza"}}})

-- Bring
local frozen = {}
TriggerEvent('es:addGroupCommand', 'slap', "admin", function(source, args, user)
	if args[1] then
		if(GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:slap', player)

				TriggerClientEvent('chatMessage', player, "^3DREAM:", {255, 0, 0}, "Dostałeś liścia od^2" .. GetPlayerName(source))
				TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Gracz ^2" .. GetPlayerName(player) .. "^0 dostał liścia")
			end)
		else
			TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
		end
	else
		TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Brak permisji!")
end, {help = "Walnij gracza", params = {{name = "ID", help = "ID Gracza"}}})

-- Freezing
local frozen = {}
TriggerEvent('es:addGroupCommand', 'goto', "mod", function(source, args, user)
	if args[1] then
		if(GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)
				if(target)then

					TriggerClientEvent('es_admin:teleportUser', source, target.getCoords().x, target.getCoords().y, target.getCoords().z)
					sendToDiscordBRINGGOTO('DREAM - GOTO','['..source..'] '..GetPlayerName(source)..' | '..GetPlayerIdentifier(source)..' Przeteleportował się do ['..player..'] '..GetPlayerName(player)..' | '..GetPlayerIdentifier(player), 3426654)

				--TriggerClientEvent('chatMessage', player, "^3DREAM:", {255, 0, 0}, "Przeteleportował się do ciebie: ^2" .. GetPlayerName(source))
				TriggerClientEvent('chat:addMessage', player,{
					template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
					args = {" ^3DREAM:", "^7 Przeteleportował się do ciebie: ^2" ..GetPlayerName(source)}
				})
				--	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Przeteleportowałeś się do: ^2" .. GetPlayerName(player) .. "")
				TriggerClientEvent('chat:addMessage', source,{
					template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
					args = {" ^3DREAM:", "^7 Przeteleportowałeś się do: ^2" .. GetPlayerName(player)}
				})
				end
			end)
		else
			--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
			TriggerClientEvent('chat:addMessage', source,{
				template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
				args = {" ^3DREAM:", "^7  Błędne ID!"}
			})
		end
	else
		TriggerClientEvent('chat:addMessage', source,{
			template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
			args = {" ^3DREAM:", "^7  Błędne ID!"}
		})
	end
end, function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Brak permisji!")
	TriggerClientEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7 Brak permisji!"}
	})
end, {help = "Teleport do gracza", params = {{name = "ID", help = "ID Gracza"}}})

-- Kill yourself
TriggerEvent('es:addCommand', 'die', function(source, args, user)
	TriggerClientEvent('es_admin:kill', source)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {0,0,0}, "^7^*Zabiłeś samego siebie!")
	TriggerClientEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7 Zabiłeś samego siebie!"}
	})
end, {help = "zabij samego siebie"})

-- Killing
TriggerEvent('es:addGroupCommand', 'slay', "admin", function(source, args, user)
	if args[1] then
		if(GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:kill', player)

				--TriggerClientEvent('chatMessage', player, "^3DREAM:", {255, 0, 0}, "Zostałeś zabity przez^2" .. GetPlayerName(source))
				TriggerClientEvent('chat:addMessage', player,{
					template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
					args = {" ^3DREAM:", "^7 Zostałeś zabity przez^2" ..GetPlayerName(source)}
				})
				--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Gracz ^2" .. GetPlayerName(player) .. "^0 został zabity.")
				TriggerClientEvent('chat:addMessage', source,{
					template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
					args = {" ^3DREAM:", "^7 Gracz ^2" ..GetPlayerName(player).. "^0 został zabity."}
				})
			end)
		else
		--	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
		TriggerClientEvent('chat:addMessage', source,{
			template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
			args = {" ^3DREAM:", "^7  Błędne ID!"}
		})
		end
	else
		--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
		TriggerClientEvent('chat:addMessage', source,{
			template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
			args = {" ^3DREAM:", "^7  Błędne ID!"}
		})
	end
end, function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Brak permisji!")
	TriggerClientEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7 Brak permisji!"}
	})
end, {help = "Zabij gracza", params = {{name = "ID", help = "ID Gracza"}}})

-- Crashing
TriggerEvent('es:addGroupCommand', 'crash', "superadmin", function(source, args, user)
	if args[1] then
		if(GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:crash', player)

			--	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "Gracz ^2" .. GetPlayerName(player) .. " ^0 został wyjebany pod przykrywką.")
			TriggerClientEvent('chat:addMessage', source,{
				template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
				args = {" ^3DREAM:", "^7 Gracz ^2" .. GetPlayerName(player) .. " ^0 został wyjebany pod przykrywką."}
			})
			end)
		else
		--	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
		TriggerClientEvent('chat:addMessage', source,{
			template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
			args = {" ^3DREAM:", "^7  Błędne ID!"}
		})
		end
	else
	--	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Błędne ID!")
	TriggerClientEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7  Błędne ID!"}
	})
	end
end, function(source, args, user)
	--TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, " Brak permisji!")
	TriggerClientEvent('chat:addMessage', source,{
		template = '<div style="padding: 0.4vw; margin: 0.3vw; background-color: rgba(0, 0, 0, 0.3); border-radius: 10px;"><i class="fas fa-exclamation-triangle"></i> {0} {1}</div>',
		args = {" ^3DREAM:", "^7 Brak permisji!"}
	})
end, {help = "wywal gracza pod przykrywką", params = {{name = "ID", help = "ID Gracza"}}})

--[[ Position
TriggerEvent('es:addGroupCommand', 'pos', "owner", function(source, args, user)
	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "This command was removed")
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "^3DREAM:", {255, 0, 0}, "This command was removed")
end, {help = "Save position to file"})]]

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

loadBans()


function sendToDiscord (name,message,color)
	local DiscordWebHook = 'https://discordapp.com/api/webhooks/793091768786223125/ceuE-QsuQhyLXHYPNy_ymvbZHD5qG4Aju1uD819xgwat2grU4RsaXHs5K-Ws1-_UWLN0'
	local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
  
  local embeds = {
	{
		  ["title"]=message,
		  ["type"]="rich",
		  ["color"] =color,
		  ["footer"]=  {
			  ["text"]= "Wysłano o: " ..date.."",
		 },
	}
}
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


function sendToDiscordBRINGGOTO (name,message,color)
	local DiscordWebHook = 'https://discordapp.com/api/webhooks/793091536928636948/tRNTQ993s0dLn6AGyz7dPCofv-KraalxhgdXIhM_D-eBQAhYkqM7q6yNaatqraex1spT'
	local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
  
  local embeds = {
	{
		["description"]=message,
		["type"]="rich",
		["color"] =color,
		["footer"]=  {
			["text"]= "" ..date.."",
		 },
	}
}
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscordADM (name,message,color)
	local DiscordWebHook = 'https://discordapp.com/api/webhooks/793091657774923776/bDile2KYE4EVM5gzVJw_DO7T-9ida9VsIBtcYfEVe2wD-tOcOmlh_aw9Ufi4lXtf-9os'
	local date = os.date('*t')
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
  
  local embeds = {
	{
		["description"]=message,
		["type"]="rich",
		["color"] =color,
		["footer"]=  {
			["text"]= "" ..date.."",
		 },
	}
}
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end