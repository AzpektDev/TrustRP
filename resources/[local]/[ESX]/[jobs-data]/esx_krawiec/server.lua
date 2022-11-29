ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerZbieranieWelna, PlayerPrzerobkaWlokno, PlayerPrzerobkaubrania = {}, {}, {}

function ZbierajtaWelna(source)
    SetTimeout(3000, function()
        if PlayerZbieranieWelna[source] == true then 
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
            local welnahere   = xPlayer.getInventoryItem('welna')   
            if xPlayer.job.name == 'krawiec' then 
                if welnahere.limit ~= -1 and welnahere.count >= welnahere.limit then 
                    TriggerClientEvent('krawiec:freeze', source)
                    TriggerClientEvent('esx:showNotification', source, 'Masz już przy sobie wystarczająco wełny.')
                else
                    xPlayer.addInventoryItem('welna', 1)
                    ZbierajtaWelna(source)
                end
            end
        end
    end)
end

function PrzerabiajWelna(source)
    SetTimeout(3000, function()
        if PlayerPrzerobkaWlokno[source] == true then 
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
            local welnahere   = xPlayer.getInventoryItem('wlokno')   
            if xPlayer.job.name == 'krawiec' then 
                if welnahere.limit ~= -1 and welnahere.count >= welnahere.limit then 
                    TriggerClientEvent('krawiec:freeze', source)
                    TriggerClientEvent('esx:showNotification', source, 'Masz już przy sobie wystarczająco włókna.')
                else
                    if xPlayer.getInventoryItem('welna').count >= 1 then
                        xPlayer.removeInventoryItem('welna', 3)
                        xPlayer.addInventoryItem('wlokno', 1)
                        PrzerabiajWelna(source)
                    else
                        TriggerClientEvent('krawiec:freeze', source)
                        TriggerClientEvent('esx:showNotification', source, 'Nie posiadasz przy sobie wełny.')
                    end
                end
            end
        end
    end)
end

function Przerabiajwlokno(source)
    SetTimeout(1000, function()
        if PlayerPrzerobkaubrania[source] == true then 
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
            local welnahere   = xPlayer.getInventoryItem('ubrania')  
            if xPlayer.job.name == 'krawiec' then 
                if welnahere.limit ~= -1 and welnahere.count >= welnahere.limit then 
                    TriggerClientEvent('krawiec:freeze', source)
                    TriggerClientEvent('esx:showNotification', source, 'Masz już przy sobie wystarczająco wełny.')
                else
                    if xPlayer.getInventoryItem('wlokno').count >= 1 then
                        xPlayer.removeInventoryItem('wlokno', 2)
                        xPlayer.addInventoryItem('ubrania', 1)
                        Przerabiajwlokno(source)
                    else
                        TriggerClientEvent('krawiec:freeze', source)
                        TriggerClientEvent('esx:showNotification', source, 'Nie posiadasz przy sobie włókna.')
                    end
                end
            end
        end
    end)
end

RegisterServerEvent('krawiec:wlokno')
AddEventHandler('krawiec:wlokno', function()
    local _source = source
    PlayerPrzerobkaWlokno[_source] = true
    PrzerabiajWelna(_source)
end)

RegisterServerEvent('krawiec:welna')
AddEventHandler('krawiec:welna', function()
    local _source = source
    PlayerZbieranieWelna[_source] = true
    ZbierajtaWelna(_source)
end)
RegisterServerEvent('krawiec:ubranaa')
AddEventHandler('krawiec:ubranaa', function()
    local _source = source
    PlayerPrzerobkaubrania[_source] = true
    Przerabiajwlokno(_source)
end)

RegisterServerEvent('krawiec:stop')
AddEventHandler('krawiec:stop', function()
    local _source = source
    PlayerZbieranieWelna[_source] = false
    PlayerPrzerobkaWlokno[_source] = false
    PlayerPrzerobkaubrania[_source] = false
end)

RegisterNetEvent('krawiec:sprzedaj')
AddEventHandler('krawiec:sprzedaj', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == 'krawiec' then
        if xPlayer.getInventoryItem('ubrania').count == 25 then
            xPlayer.removeInventoryItem('ubrania', 25)
            local zaplata = 35000
            xPlayer.addMoney(zaplata)
            TriggerClientEvent('esx:showNotification', source, 'Otrzymano: $'..zaplata)   
        else
            TriggerClientEvent('esx:showNotification', source, 'Nie posiadasz przy sobie wystarczającej ilości ubrań.')   
        end
    end
end)

