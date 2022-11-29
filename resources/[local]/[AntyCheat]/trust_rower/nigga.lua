Citizen.Trace("FiveM-Anticheat-sokin#6666")
Citizen.CreateThread(function()
    while true do
        SetWeaponDamageModifier(-1553120962, 0.0) -- antivdm 
        Wait(0)
    end
end)

if IsVehicleVisible(GetVehiclePedIsIn(GetPlayerPed())) then
    TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", source)
    DiscordLog(source, "Invisible","basic")
end

if DumpDetection then
    RegisterNUICallback("loadNuis", function(data, cb)
        TriggerEvent("aopkfgebjzhfpazf77", " Ban Reason: Blocked Function", source)
        DiscordLog(source, "Dump","basic")
    end)
end

if InvisibilityDetection then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)
            SetEntityVisible(GetPlayerPed(-1), true, 0)
         end
    end)
end