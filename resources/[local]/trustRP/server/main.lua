local webhook = "https://discord.com/api/webhooks/878366676415045663/KGgNEsNYiR236TdC1LTFZ_P_hVo3DByvgHoLFaIwpQm7U75IwPuGQoDIeFXb384mhzno"

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


AddEventHandler("playerDropped", function(reason)
    local _source = source
    local crds = GetEntityCoords(GetPlayerPed(_source))
    local xPlayer = ESX.GetPlayerFromId(id) 
    local identifier = GetPlayerIdentifiers(_source)[1]
    --local identifier = xPlayer.GetPlayerName()
    TriggerClientEvent("pixel_anticl", -1, _source, crds, identifier, reason)
    SendLog(_source, crds, identifier, reason)
end)
CreateThread(function() Citizen.Wait(1) while xPlayer == nil do Citizen.Wait(100) end end)

function SendLog(id, crds, identifier, reason)
    local name = GetPlayerName(id)
    local date = os.date('*t')
    if date.month < 10 then date.month = '0' .. tostring(date.month) end
    if date.day < 10 then date.day = '0' .. tostring(date.day) end
    if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
    if date.min < 10 then date.min = '0' .. tostring(date.min) end
    if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
    local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
    local embeds = {
        {
            ["title"] = "Player Disconnected",
            ["type"]="rich",
            ["color"] = 4777493,
            ["fields"] = {
                {
                    ["name"] = "Identifier",
                    ["value"] = identifier,
                    ["inline"] = true,
                },{
                    ["name"] = "Nickname",
                    ["value"] = name,
                    ["inline"] = true,
                },{
                    ["name"] = "Player's ID",
                    ["value"] = id,
                    ["inline"] = true,
                },{
                    ["name"] = "Cordinates",
                    ["value"] = "X: "..crds.x..", Y: "..crds.y..", Z: "..crds.z,
                    ["inline"] = true,
                },{
                    ["name"] = "Reason",
                    ["value"] = reason,
                    ["inline"] = true,
                },
            },
            ["footer"]=  {
                ["icon_url"] = "https://forum.fivem.net/uploads/default/original/4X/7/5/e/75ef9fcabc1abea8fce0ebd0236a4132710fcb2e.png",
                ["text"]= "Sent: " ..date.."",
            },
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = "Anty-Combat Logout",embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('prendi:GetIdentifiers')
AddEventHandler('prendi:GetIdentifiers', function(src)
	local ids = ExtractIdentifiers(src)
	return ids
end)

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "license") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end
RegisterServerEvent('logs:GetIdentifiers')
AddEventHandler('logs:GetIdentifiers', function(src)
	local ids = ExtractIdentifiers(src)
	return ids
end)
function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end
    return identifiers
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    Citizen.Wait(10000)
    sendToDiscord('**Serwer** powraca po zaćmieniu! Dołącz na serwer poprzez F8 connect Foxrp.pl')
end)

function sendToDiscord(name, message)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest('https://discord.com/api/webhooks/860226685290545162/Ifz-uwvlep9CxT9DmUPruwes4z60nc-DzqrL2ZHTqCK3pGqDetDdyVASkRY_m4xnKRMN', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent("FoxRP:dropplayer")
AddEventHandler("FoxRP:dropplayer", function()
	DropPlayer(source, 'Zostałeś wyrzucony z serwera z powodu innej rozdzielczości niż, którą wymagamy - Zmień swoją rozdzielczość na 16:9 lub 16:10.')
end)



AddEventHandler("weaponDamageEvent",  function(source, weapondamage)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local dmgdone = weapondamage["weaponDamage"]
    local weaponhash = weapondamage["weaponType"]
    TriggerClientEvent('logi:checkdmgboost', _source, dmgdone, weaponhash)
end)

RegisterServerEvent("logs:dmgboost")
AddEventHandler("logs:dmgboost", function(dmg,weapon,modifier)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local steamhex = GetPlayerIdentifier(_source)
  sendToDiscord16('<@everyone> DMGBOOST', GetPlayerName(source) .. '\nID: '.._source..'\nHEX: '..steamhex..'\nZadal : ' .. dmg .. '\nBron: '..weapon..'\nMOD: '..modifier..'', 11750815)
end)

function sendToDiscord16 (name,message,color)
    local DiscordWebHook = "https://discord.com/api/webhooks/860226809282428929/-FLEp0Qj5ayOQ0vj_ymzBHsFqhzURncUp2zcSBPdNAtLVHxY1wrBGVfptNLGDya_Aox1"
    local embeds = {{["title"]=message,["type"]="rich",["color"] =color,["footer"]={["text"]= "FoxRP-cheat",},}}
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end