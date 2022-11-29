CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -60.03188, -1400.305, 31.46045, true ) < 80 then
      ClearAreaOfPeds(-60.03188, -1400.305, 31.46045, 58.0, 0)
    end
  end
end)