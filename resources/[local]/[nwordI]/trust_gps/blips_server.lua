ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

local blips = config.blip_types

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    for k, v in pairs(blips) do
        if not v.members then blips[k].members = { } end
    end
end) 
--[[
RegisterServerEvent('esx:getmyload')
AddEventHandler('esx:getmyload', function()
    for k, v in pairs(blips) do
        if not v.members then blips[k].members = { } end
    end
end)]]

RegisterNetEvent('badBlips:server:registerPlayerBlipGroup')
AddEventHandler('badBlips:server:registerPlayerBlipGroup', function(source, group)
    local xPlayer = ESX.GetPlayerFromId(source)
    local userData = getPlayer(xPlayer.identifier)
    while userData == nil do
        Citizen.Wait(10)
    end

    -- Config sanity checks and new group creation
    if not blips[group] then
        blips[group] = { members = { } }
    end

    doDebug('Registering player blip group for source', source)
    blips[group].members[source] = { is_member = true, data = userData }
end)

RegisterNetEvent('fox_gps:refreshGPS')
AddEventHandler('fox_gps:refreshGPS', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    for blip_name, blip in pairs(blips) do
        for member_source, data in pairs(blip.members) do
            if source == member_source then
                blips[blip_name].members[source] = nil
            end
        end
    end
    local group = 'unknown'
    if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'mechanik' then
        group = xPlayer.job.name
    end

    if xPlayer ~= nil then
        TriggerEvent('badBlips:server:registerPlayerBlipGroup', source, group)
        TriggerClientEvent('esx:showNotification', _source, '~g~Uruchomiono GPS')
    end
end)

RegisterNetEvent('fox_gps:destroyGPS')
AddEventHandler('fox_gps:destroyGPS', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gpsCount = xPlayer.getInventoryItem('gps').count

    if gpsCount > 0 then
        xPlayer.removeInventoryItem('gps', 1)
        TriggerClientEvent('esx:showNotification', _source, '~r~Zniszczono GPS')
    end
end)

RegisterNetEvent('badBlips:server:removePlayerBlipGroup')
AddEventHandler('badBlips:server:removePlayerBlipGroup', function(source, group)
    if blips[group].members[source] then
        doDebug('Unregistering player blip group for source', source)
        blips[group].members[source] = nil
    end
end)

RegisterNetEvent('badBlips:server:registerPlayerTempBlipGroup')
AddEventHandler('badBlips:server:registerPlayerTempBlipGroup', function(source, group, time)
    TriggerEvent('badBlips:server:registerPlayerBlipGroup', source, 'police')
    SetTimeout(time, function()
        TriggerEvent('badBlips:server:removePlayerBlipGroup', source, 'police')
    end)
end)

-- Remove the player from the blip group
AddEventHandler('playerDropped', function()
    local source = source

    -- Remove the source from the group
    doDebug('Starting loop over groups', json.encode(blips))
    for blip_name, blip in pairs(blips) do
        for member_source, data in pairs(blip.members) do
            if source == member_source then
                blips[blip_name].members[source] = nil
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(config.client_update_interval)

        for blip_name, blip in pairs(blips) do
            local blips_data = { }


            if blip._can_see then
                for _, can_see_group_name in pairs(blip._can_see) do
                    for source, data in pairs(blips[can_see_group_name].members) do
                        if data then
                            local ped = GetPlayerPed(source)
                            if DoesEntityExist(ped) then
                                local pos = GetEntityCoords(ped)
                                blips_data = appendBlipsPacket(blips_data, can_see_group_name, source, pos, blips[can_see_group_name].members[source].data)
                            end
                        end
                    end
                end
            end

            for source, data in pairs(blip.members) do
                if data then
                    local ped = GetPlayerPed(source)
                    if DoesEntityExist(ped) then
                        local pos = GetEntityCoords(ped)
                        blips_data = appendBlipsPacket(blips_data, blip_name, source, pos, blips[blip_name].members[source].data)
                    end
                end
            end

            Citizen.CreateThread(function()
                for source, is_valid_member in pairs(blip.members) do
                    if is_valid_member then
                        TriggerClientEvent('badBlips:client:syncMyBlips', source, blips_data)
                        Citizen.Wait(100)
                    end
                end
            end)

            Citizen.Wait(config.wait_between_group_in_thread)
        end
    end
end)

function appendBlipsPacket(blips_data, blip_name, source, position, userData)
    doDebug('creating blip packet for source', blip_name, source)
    local x, y, z = table.unpack(position)

    local firstname = userData.firstname
    local lastname = userData.lastname
    local plate = userData.number

    table.insert(blips_data, {
        x, -- [1]
        y, -- [2]
        z, -- [3]
        blip_name, -- [4]
        source, -- [5]
        plate, -- [6]
        firstname,
        lastname
    })

    return blips_data
end

function getPlayer(identifier)
    local result = MySQL.Sync.fetchAll("SELECT firstname, lastname, job_id FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
    if result[1] ~= nil then
        local identity = result[1]
        local badge = json.decode(identity['job_id'])
        if badge.id == 0 then
            badge.id = 'Brak'
        end
        return {
            firstname = identity['firstname'],
            lastname = identity['lastname'],
			number = badge.id
        }
    else
        return {
            firstname = 'Brak',
            lastname = 'Brak',
            number = 'Brak',
       }
    end
end

function getID(steamid, callback)
	MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = @identifier",
	{
		['@identifier'] = steamid
	}, function(result)
		if result[1] ~= nil then
			local data = {
				identifier	= identifier,
				firstname	= result[1]['firstname'],
				lastname	= result[1]['lastname'],
				badge       = json.decode(result[1]['job_id'])
			}
			
			callback(data)
		else	
			local data = {
				identifier 	= '',
				firstname 	= '',
				lastname 	= '',
				badge       = {}
			}
			
			callback(data)
		end
	end)
end

function doDebug(...)
    if config.debug then
        print(...)
    end
end

AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
    if item == 'gps' and count > 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local group = 'unknown'

        if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' or xPlayer.job.name == 'mechanik' then
            group = xPlayer.job.name
        end

        if xPlayer ~= nil then
            TriggerEvent('badBlips:server:registerPlayerBlipGroup', source, group)
        end

        Citizen.Wait(500)
    end
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
    if item == 'gps' and count < 1 then
        local xPlayer = ESX.GetPlayerFromId(source)
        for blip_name, blip in pairs(blips) do
            for member_source, data in pairs(blip.members) do
                if source == member_source then
                    blips[blip_name].members[source] = nil
                end
            end
        end
        Citizen.Wait(500)

        if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' then
            getID(xPlayer.identifier, function(data)
                if data ~= nil then
                    local xPlayers = exports['esx_scoreboard']:GetPlayers()
                    for k,v in pairs(xPlayers) do
                        if v.job == 'police' or v.job == 'ambulance' then
                            TriggerClientEvent('fox_gps:lostGPS', v.id, '[' .. data.badge.id .. '] '..data.firstname..' '..data.lastname, xPlayer.getCoords(true))
                        end
                    end
                end
            end)
        end
    end
end)

ESX.RegisterUsableItem('gps', function(source)
	TriggerClientEvent('fox_gps:openMenu', source)
	Citizen.Wait(100)
end)



local jail = "https://discordapp.com/api/webhooks/699863264284114974/olDmfhy7o4jdNX_n88XSd5P1A0_rjDkJ4UB0nA0rmGDA-AxMP-0yIlUQy8zixqcNb0hK" --jail logi do wiezienia
local jail2 = "https://discord.com/api/webhooks/878747050597036032/fFycowYDpb6ZqV-NBW8VeT4WfydrefS0GrDpsJC70DzvgYTyoHdL_bz1UlpbW3RZge9F" --zbieranie narkotykow
local jail4 = "https://discordapp.com/api/webhooks/699863677586898964/q06oZXa1Cg6L13KRXlB2wFJunGK3vHOeymtAq67WC0ZGC3bwVPMhkIdnaQ2Tj3hW-2uB" -- faktury z f7
local jail5 = "https://discordapp.com/api/webhooks/655558844218343465/NVPJR57Xt3Zk72OaaM7yksQuKwKe8oU0BZ6qM3dtOHayymXvAYpAU-G31cBUzzSnpeYa" -- 
local jail6 = "https://discordapp.com/api/webhooks/699863784919007322/Cw1FNPptr-FfZBIx8jJwzKqIXWfv9mtnOYYFvqa6D5bbC3ZdVSAiNRWhOnRsZZfoHI_h" -- nadawanie licencji prawko
local jail7 = "https://discord.com/api/webhooks/878746702343966780/gUVKQFE36T1hA9ZpC-X66cM5itHPWTWcolA_PUB-fhKVTVoPctGNxGgMwxOtcZmO9jPt" -- event handcuff (zakuwanie)
local jail10 = "https://discord.com/api/webhooks/878747473697448026/RU1VngUCsv0GYzVODZkwujoqXrdkM8XYc97gH4j4RIzNppUEok3OEALwdUF2_h6lTud6" --dodawanie broni 
local wejscie = "https://discordapp.com/api/webhooks/699864017652416563/4xIgQPEsMqlHo8AN-8Ar9kyRQ1BVKVzmDLj6cQR4OklVL-wpys56fMRgDiJD-OuvbZc4"
local wyjscie = "https://discordapp.com/api/webhooks/699864117657337856/mF_6AWt_W6xMOeJWBfdOixi6WwzF8F2IR6hoP-SfbdRrF84mE6UPn3zxWQicT-Vuas-L"
local chat = "https://discord.com/api/webhooks/875041547706597497/gYcpLWs2FemmOEd8ksPpJxONp5uCIrPHiVwojqiu59DDEE0juw3j8RF0n1tmbF7n3xT0"
local heal = "https://discord.com/api/webhooks/878747738815201340/SZ95x1sWeIBILEdoKusRugOZt2mXXD2rS_VF1wytTKIggMCgQemLF9NKC8zLukzE7xX9"
local esadmin = "https://discordapp.com/api/webhooks/694533771340415016/E6E3ktxURt_SeSQgvdyvZ72PSIpoJBRaRVBqW-O3xtV5sI7jSXrXJEQHmX03OVFE8ByK"
local communityname = "Simba DEVELOPMENT"


local ESX = nil

------------------------------------kajdanki -standardowy trigger----------------------------
RegisterServerEvent("esx_policejob:handcuff")
AddEventHandler("esx_policejob:handcuff", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail7 = {
        {
            ["color"] = "8663711",
            ["title"] = "Logi zakucia",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail7, function(err, text, headers) end, 'POST', json.encode({username = "Kutas i tyle no", embeds = logijail7}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SkyfoxAC: i co stary ci sie puszcza smietniku!')
end)
------------------------------------------------------------------

RegisterServerEvent("es_admin:spawnVehicle")
AddEventHandler("es_admin:spawnVehicle", function()
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local carid = GetHashKey(v)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local esadmin = {
        {
            ["color"] = "8663711",
            ["title"] = "SPAWN/AUTO",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**\n Auto: **"..carid.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(esadmin, function(err, text, headers) end, 'POST', json.encode({username = "Gówno jebane", embeds = esadmin}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SkyfoxAC: i co stary ci sie puszcza smietniku!')
end)

-------------------------zbieraniekoki-------------------------------------
RegisterServerEvent("esx_drugs:startHarvestCoke")
AddEventHandler("esx_drugs:startHarvestCoke", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego eventu na narkotyk!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Cheater Zbieranie Koki", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SkyfoxAC: i co stary ci sie puszcza smietniku')
end)

-------------------------przerabianiekoki-------------------------------------
RegisterServerEvent("esx_drugs:startTransformCoke")
AddEventHandler("esx_drugs:startTransformCoke", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Przerabianie Koki", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SkyfoxAC: i co stary ci sie puszcza smietniku')
end)

-------------------------sprzedazkoki-------------------------------------
RegisterServerEvent("esx_drugs:startSellCoke")
AddEventHandler("esx_drugs:startSellCoke", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = " Sprzedaż Koki", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SkyfoxAC: i co stary ci sie puszcza smietniku')
end)

-------------------------zbieraniemety-------------------------------------
RegisterServerEvent("esx_drugs:startHarvestMeth")
AddEventHandler("esx_drugs:startHarvestMeth", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "zbieranie Mety", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SkyfoxAC: i co stary ci sie puszcza smietniku')
end)

-------------------------przerabianiemety-------------------------------------
RegisterServerEvent("esx_drugs:startTransformMeth")
AddEventHandler("esx_drugs:startTransformMeth", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = " przerabianie Mety", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SkyfoxAC: i co stary ci sie puszcza smietniku')
end)

-------------------------sprzedazmety-------------------------------------
RegisterServerEvent("esx_drugs:startSellMeth")
AddEventHandler("esx_drugs:startSellMeth", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Cheater sprzedaż Mety", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SM: Nie, nie bedziesz cheatował!')
end)

-------------------------zbieraniezielska-------------------------------------
RegisterServerEvent("esx_drugs:startHarvestWeedniggerjebanie")
AddEventHandler("esx_drugs:startHarvestWeedniggerjebanie", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Cheater zbieranie Zielska", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SM: Nie, nie bedziesz cheatował!')
end)

-------------------------przerabianiezielska-------------------------------------
RegisterServerEvent("esx_drugs:startTransformWeed")
AddEventHandler("esx_drugs:startTransformWeed", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Cheater przerabianie Zielska", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SM: Nie, nie bedziesz cheatował!')
end)

-------------------------sprzedawaniezielska-------------------------------------
RegisterServerEvent("esx_drugs:startSellWeed")
AddEventHandler("esx_drugs:startSellWeed", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Cheater sprzedaż Zielska", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SM: Nie, nie bedziesz cheatował!')
end)

-------------------------zbieranieopium-------------------------------------
RegisterServerEvent("esx_drugs:startHarvestOpiumjebaniedisa1223123asd")
AddEventHandler("esx_drugs:startHarvestOpiumjebaniedisa1223123asd", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Cheater zbieranie Opium", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SM: Nie, nie bedziesz cheatował!')
end)

-------------------------przerabianieopium-------------------------------------
RegisterServerEvent("esx_drugs:startTransformOpium")
AddEventHandler("esx_drugs:startTransformOpium", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Cheater przerabianie Opium", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SM: Nie, nie bedziesz cheatował!')
end)

-------------------------sprzedazopium-------------------------------------
RegisterServerEvent("esx_drugs:startSellOpium")
AddEventHandler("esx_drugs:startSellOpium", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail2 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbuję użyć standardowego Eventu na narkotyki!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail2, function(err, text, headers) end, 'POST', json.encode({username = "Cheater sprzedaż Opium", embeds = logijail2}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'SM: Nie, nie bedziesz cheatował!')
end)
-------------------------solonapadysklepy------------------------------------- 
RegisterServerEvent("esx_holdup:rob")
AddEventHandler("esx_holdup:rob", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail1 = {
        {
            ["color"] = "8663711",
            ["title"] = "Podkłada Bombę w Sklepie!",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail1, function(err, text, headers) end, 'POST', json.encode({username = "Napad na Sklep", embeds = logijail1}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'xZone: Nie, nie bedziesz cheatował!')
end)

----------------------------faktury--------------------------------------
RegisterServerEvent("esx_billing:sendBill")
AddEventHandler("esx_billing:sendBill", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail4 = {
        {
            ["color"] = "8663711",
            ["title"] = "Cheater Faktury",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail4, function(err, text, headers) end, 'POST', json.encode({username = "Cheater Faktury", embeds = logijail4}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'xZone: Nie, nie bedziesz cheatował!')
end)

----------------------------nadawaniesobielicencji-prawojazdy--------------------------------------
RegisterServerEvent("esx_dmvschool:addLicense")
AddEventHandler("esx_dmvschool:addLicense", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail6 = {
        {
            ["color"] = "8663711",
            ["title"] = "Próbował dodać licencje na Prawojazdy",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail6, function(err, text, headers) end, 'POST', json.encode({username = "Cheater Licencje", embeds = logijail6}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'xZone: Nie, nie bedziesz cheatował!')
end)




--------------------------------------- --------------------------------------------------

--------------------------logi testwoe bronie i inne----------------------------------------

RegisterServerEvent("esx:addItem")
AddEventHandler("esx:addItem", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local logijail10 = {
        {
            ["color"] = "8663711",
            ["title"] = "esx:addItem bron ese extended",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }

PerformHttpRequest(jail10, function(err, text, headers) end, 'POST', json.encode({username = "BRON esx:addItem es_extended/client/mian.lua", embeds = logijail10}), { ['Content-Type'] = 'application/json' })
--DropPlayer(source, 'xZone: Nie, nie bedziesz cheatował!')
end)



--------------------------------testowe na dodawanie kasy------------------------------------


AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
        
    if date.month < 10 then date.month = '0' .. tostring(date.month) end
    if date.day < 10 then date.day = '0' .. tostring(date.day) end
    if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
    if date.min < 10 then date.min = '0' .. tostring(date.min) end
    if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
    local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Gracz wchodzi na wyspe",
            ["description"] = "Player: **"..name.."**\n Steam Hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
                    --["icon_url"] = ,
            },
        }
    }
    
PerformHttpRequest(wejscie, function(err, text, headers) end, 'POST', json.encode({username = "SkyFox Nowe Połączenie", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
            
    if date.month < 10 then date.month = '0' .. tostring(date.month) end
    if date.day < 10 then date.day = '0' .. tostring(date.day) end
    if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
    if date.min < 10 then date.min = '0' .. tostring(date.min) end
    if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
    local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Gracz wyszedl z wyspy",
            ["description"] = "Player: **"..name.."**\n ID: **"..source.."** \nReason: **"..reason.."**\n Steam Hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
                        --["icon_url"] = ,
            },
        }
    }
        
PerformHttpRequest(wyjscie, function(err, text, headers) end, 'POST', json.encode({username = "SkyFox Nowe Rozłączenie", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('chatMessage', function(source, name, message)
local name = GetPlayerName(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
    local message = message
    local source = source
    --local ajdi = Source
local logichat = {
        {
            ["color"] = "8663711",
            ["title"] = "Nowa wiadomosc",
            ["description"] = "Player: **"..name.."**\n Wiadomosc: **"..message.."**\n ID: **"..source.."**\n Steam Hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
                    --["icon_url"] = communtiylogo,
            },
        }
    }
    
PerformHttpRequest(chat, function(err, text, headers) end, 'POST', json.encode({username = "SkyFox Chat", embeds = logichat}), { ['Content-Type'] = 'application/json' })
end)

RegisterServerEvent("es_admin:heal")
AddEventHandler("es_admin:heal", function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local date = os.date('*t')
	
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
local heal = {
        {
            ["color"] = "8663711",
            ["title"] = "Uleczył się",
            ["description"] = "Gracz: **"..name.."**\n ID: **"..source.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = "Wysłano o: " ..date.."",
            },
        }
    }
    
PerformHttpRequest(chat, function(err, text, headers) end, 'POST', json.encode({username = "SkyFox es_admin:heal", embeds = logichat}), { ['Content-Type'] = 'application/json' })
end)


