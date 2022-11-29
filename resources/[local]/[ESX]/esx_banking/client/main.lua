ESX = nil
inMenu = false
local atbank = false
local bankMenu = true
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


function IsNearBank()
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)

    for _, search in pairs(Config.Bank) do
        local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
        if distance <= 3 then
            return true
        end
    end
end

function IsNearTeller()
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)

    for _, search in pairs(Config.ATM) do
        local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
        if distance <= 2 then
            return true
        end
    end
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function bankMenuLoop()
    sleep = 1000
    local letSleep = true
        if bankMenu then
            if IsNearBank() or IsNearTeller() then
                letSleep = false
                sleep = 0
                DisplayHelpText(_U('atm_open'))

                if IsControlJustPressed(1, 38) then
                    sleep = 0
                    ESX.Streaming.RequestAnimDict('mp_common', function()
                        TaskPlayAnim(GetPlayerPed(-1), 'mp_common', 'givetake1_a', 1.0, -1.0, 2500, 49, 1, false, false, false)
                    end)
                    Citizen.Wait(2500)
                    inMenu = true
                    SetNuiFocus(true, true)
                    SendNUIMessage({type = 'openGeneral'})
                    TriggerServerEvent('bank:balance')
                end

                if IsControlJustPressed(1, 322) then
                    sleep = 0
                    inMenu = false
                    SetNuiFocus(false, false)
                    ClearPedTasks(GetPlayerPed(-1))
                    SendNUIMessage({type = 'close'})
                end
            end
            SetTimeout(sleep, bankMenuLoop)
        end
    end
bankMenuLoop()

Citizen.CreateThread(function()
    if Config.ShowBlips then
        for k,v in ipairs(Config.Bank)do
            local blip = AddBlipForCoord(v)
            SetBlipSprite (blip, Config.BlipBank)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 0.9)
            SetBlipColour (blip, 2)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(_U('bank_blip'))
            EndTextCommandSetBlipName(blip)
        end
    end
end)

Citizen.CreateThread(function()
    if Config.ShowBlips and Config.OnlyBank == false then
        for k,v in ipairs(Config.ATM)do
            local blip = AddBlipForCoord(v)
            SetBlipSprite (blip, Config.BlipATM)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 0.9)
            SetBlipColour (blip, 2)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(_U('atm_blip'))
            EndTextCommandSetBlipName(blip)
        end
    end
end)

RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance, name)
    SendNUIMessage({
        type = "balanceHUD",
        balance = balance,
        player = name
    })
end)

RegisterNUICallback('deposit', function(data)
    TriggerServerEvent('bank:deposit', tonumber(data.amount))
    TriggerServerEvent('bank:balance')
end)

RegisterNUICallback('withdrawl', function(data)
    TriggerServerEvent('bank:withdraw', tonumber(data.amountw))
    TriggerServerEvent('bank:balance')
end)

RegisterNUICallback('balance', function()
    TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
    SendNUIMessage({type = 'balanceReturn', bal = balance})
end)

RegisterNUICallback('transfer', function(data)
    TriggerServerEvent('bank:transfer', data.to, data.amountt)
    TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
    SendNUIMessage({type = 'result', m = message, t = type})
end)

RegisterNUICallback('NUIFocusOff', function()
    inMenu = false
    SetNuiFocus(false, false)

    ESX.Streaming.RequestAnimDict('mp_common', function()
		TaskPlayAnim(PlayerPedId(), 'mp_common', 'givetake1_a', 1.0, -1.0, 2500, 49, 1, false, false, false)
    end)
    
    Citizen.Wait(2500)
    ClearPedTasks(GetPlayerPed(-1))
    SendNUIMessage({type = 'closeAll'})
end)