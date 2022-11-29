PlayerData = {}
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
  refreshBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
  deleteBlip()
  refreshBlips()
end)

local isProcessingWelna, isProcessingUbrania, isProcessingWlokno = false, false, false
local KrawiecBlip = {}
local Clothes = {
	Male = {
		['tshirt_1'] = 6,  ['tshirt_2'] = 11,
		['torso_1'] = 120,   ['torso_2'] = 9,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 11,
		['pants_1'] = 10,   ['pants_2'] = 5,
		['shoes_1'] = 10,   ['shoes_2'] = 0,
		['helmet_1'] = 21,      ['helmet_2'] = 5,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = 0,      ['mask_2'] = 0,
		['ears_1'] = 5,     ['ears_2'] = 5,
		['bags_1'] = 0,     ['bags_2'] = 0
	},
	Female = {
		['tshirt_1'] = 14,  ['tshirt_2'] = 0,
		['torso_1'] = 130,   ['torso_2'] = 0,
		['decals_1'] = 13,   ['decals_2'] = 0,
		['arms'] = 9,
		['pants_1'] = 77,   ['pants_2'] = 0,
		['shoes_1'] = 3,   ['shoes_2'] = 0,
		['helmet_1'] = 0,  ['helmet_2'] = 0,
		['mask_1'] = 0,      ['mask_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 14,     ['ears_2'] = 0
	}
}
local blips = {{title="#1 Siedziba", colour=1, id=478, coords = ConfigBlips.Main[1].coords},{title="#2 Punkt odbioru wełny", colour=3, id=478, coords = ConfigBlips.Welna[1].coords},{title="#3 Punkt przeróbki wełny", colour=3, id=478, coords = ConfigBlips.PrzeWelna[1].coords},{title="#4 Punkt przeróbki włókna", colour=3, id=478, coords = ConfigBlips.Wlokna[1].coords},{title="#5 Punkt dostawy ubrań", colour=3, id=478, coords = ConfigBlips.Ubrania[1].coords},}

function deleteBlip()
	if KrawiecBlip[1] ~= nil then
		for i=1, #KrawiecBlip, 1 do
			RemoveBlip(KrawiecBlip[i])
			KrawiecBlip[i] = nil
		end
	end
end

function refreshBlips()
	if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
		for i=1, #blips, 1 do
			local blip = AddBlipForCoord(blips[i].coords)
			SetBlipSprite(blip, blips[i].id)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, 0.9)
			SetBlipColour(blip, blips[i].colour)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(blips[i].title)
			EndTextCommandSetBlipName(blip)

			table.insert(KrawiecBlip, blip)
		end
	end
end

CreateThread(function()
	while PlayerData.job == nil do
		Citizen.Wait(300)
	end
	while true do
		Citizen.Wait(1)
		if PlayerData.job.name == 'krawiec' then
				local coords = GetEntityCoords(GetPlayerPed(-1))
				for i=1, #Config.MainMenu, 1 do
					if(GetDistanceBetweenCoords(coords, Config.MainMenu[i].x, Config.MainMenu[i].y, Config.MainMenu[i].z, true) < 10)  then
						sleep = false
						if not IsPedInAnyVehicle(PlayerPedId(-1), true) then
							DrawMarker(22, Config.MainMenu[i].x, Config.MainMenu[i].y, Config.MainMenu[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 500, false, true, 10, false, false, false, false)
						end
					end
				end
				for i=1, #Config.Welna, 1 do
					if(GetDistanceBetweenCoords(coords, Config.Welna[i].x, Config.Welna[i].y, Config.Welna[i].z, true) < 10)  then
						sleep = false
						if not IsPedInAnyVehicle(PlayerPedId(-1), true) then
							DrawMarker(1, Config.Welna[i].x, Config.Welna[i].y, Config.Welna[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 6.0, 6.0, 1.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 500, false, true, 10, false, false, false, false)
						end
					end
				end
				for i=1, #Config.Wlokno, 1 do
					if(GetDistanceBetweenCoords(coords, Config.Wlokno[i].x, Config.Wlokno[i].y, Config.Wlokno[i].z, true) < 10)  then
						sleep = false
						if not IsPedInAnyVehicle(PlayerPedId(-1), true) then
							DrawMarker(1, Config.Wlokno[i].x, Config.Wlokno[i].y, Config.Wlokno[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.8, 5.8, 1.2, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 500, false, true, 10, false, false, false, false)
						end
					end
				end
				for i=1, #Config.Ubrania, 1 do
					if(GetDistanceBetweenCoords(coords, Config.Ubrania[i].x, Config.Ubrania[i].y, Config.Ubrania[i].z, true) < 10)  then
						sleep = false
						if not IsPedInAnyVehicle(PlayerPedId(-1), true) then
							DrawMarker(1, Config.Ubrania[i].x, Config.Ubrania[i].y, Config.Ubrania[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.8, 5.8, 1.2, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 500, false, true, 10, false, false, false, false)
						end
					end
				end
				for i=1, #Config.Sell, 1 do
					if(GetDistanceBetweenCoords(coords, Config.Sell[i].x, Config.Sell[i].y, Config.Sell[i].z, true) < 10) then
						sleep = false
						if not IsPedInAnyVehicle(PlayerPedId(-1), true) then
							DrawMarker(22, Config.Sell[i].x, Config.Sell[i].y, Config.Sell[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 500, false, true, 10, false, false, false, false)
						end
					end
				end
				for i=1, #Config.StoreVehicle, 1 do
					if(GetDistanceBetweenCoords(coords, Config.StoreVehicle[i].x, Config.StoreVehicle[i].y, Config.StoreVehicle[i].z, true) < 60) then
						sleep = false
						if IsPedInAnyVehicle(GetPlayerPed(-1)) then
							DrawMarker(1, Config.StoreVehicle[i].x, Config.StoreVehicle[i].y, Config.StoreVehicle[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 5.5, 5.5, 2.5, 247, 187, 60, 500, false, true, 2, false, false, false, false)
						end
					end
				end
				for i=1, #Config.GetVehicle, 1 do
					if(GetDistanceBetweenCoords(coords, Config.GetVehicle[i].x, Config.GetVehicle[i].y, Config.GetVehicle[i].z, true) < 10) then
						sleep = false
						if not IsPedInAnyVehicle(PlayerPedId(-1), true) then
							DrawMarker(22, Config.GetVehicle[i].x, Config.GetVehicle[i].y, Config.GetVehicle[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 247, 187, 60, 500, false, true, 2, false, false, false, false)
						end
					end
				end
			if sleep then
				Citizen.Wait(3000)
			end
		end
	end
end)

RegisterNetEvent('krawiec:freeze')
AddEventHandler('krawiec:freeze', function(source)
	FreezeEntityPosition(PlayerPedId(), false)
	ClearPedTasksImmediately(PlayerPedId())
end)

function welnaconfig()
	isProcessingWelna = true
	TriggerServerEvent('krawiec:welna')
end
function ubraniaconfig()
	isProcessingUbrania = true
	TriggerServerEvent('krawiec:ubranaa')
end
function wloknoconfig()
	isProcessingWlokno = true
	TriggerServerEvent('krawiec:wlokno')
end

CreateThread(function()
	while PlayerData.job == nil do
		Citizen.Wait(300)
	end
	while true do
		Citizen.Wait(1)
		if PlayerData.job.name == 'krawiec' and not IsPedInAnyVehicle(PlayerPedId(-1), true) then
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local currentZone = nil
		for i=1, #Config.MainMenu, 1 do
				if(GetDistanceBetweenCoords(coords, Config.MainMenu[i].x, Config.MainMenu[i].y, Config.MainMenu[i].z, true) < Config.MarkerSize.x) then
						SetTextComponentFormat('STRING')
						AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby otworzyć menu krawca.")
						DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(0, 38) and not menuIsShowed then
						--giga funckja
						Openubrania()
					end

				end
		end
		local currentZone = nil
		for i=1, #Config.Welna, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Welna[i].x, Config.Welna[i].y, Config.Welna[i].z, true) < 4) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby zacząć zbierać wełnę.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and not isProcessingWelna then
					--giga funckja
					TaskStartScenarioInPlace(GetPlayerPed(-1), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
					FreezeEntityPosition(PlayerPedId(), true)
					welnaconfig()
				elseif IsControlJustReleased(0, 73) and isProcessingWelna then
					TriggerServerEvent('krawiec:stop')
					FreezeEntityPosition(PlayerPedId(), false)
					isProcessingWelna = false
				end
			end
		end
		for i=1, #Config.Ubrania, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Ubrania[i].x, Config.Ubrania[i].y, Config.Ubrania[i].z, true) < 4) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby zacząć przeróbkę włókna na ubrania.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and not isProcessingUbrania then
					--giga funckja
					TaskStartScenarioInPlace(GetPlayerPed(-1), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
					FreezeEntityPosition(PlayerPedId(), true)
					ubraniaconfig()
				elseif IsControlJustReleased(0, 73) and isProcessingUbrania then
					TriggerServerEvent('krawiec:stop')
					FreezeEntityPosition(PlayerPedId(), false)
					isProcessingUbrania = false
				end
			end
		end
		for i=1, #Config.Wlokno, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Wlokno[i].x, Config.Wlokno[i].y, Config.Wlokno[i].z, true) < 4) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby zacząć przeróbkę wełny na włókno.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and not isProcessingWlokno then
					--giga funckja
					TaskStartScenarioInPlace(GetPlayerPed(-1), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
					FreezeEntityPosition(PlayerPedId(), true)
					wloknoconfig()
				elseif IsControlJustReleased(0, 73) and isProcessingWlokno then
					TriggerServerEvent('krawiec:stop')
					FreezeEntityPosition(PlayerPedId(), false)
					isProcessingWlokno = false
				end
			end
		end
		for i=1, #Config.GetVehicle, 1 do
			if(GetDistanceBetweenCoords(coords, Config.GetVehicle[i].x, Config.GetVehicle[i].y, Config.GetVehicle[i].z, true) < Config.MarkerSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby otworzyć garaż.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and not menuIsShowed then
					--giga funckja
					OpenuGarage()
				end

			end
		end
		for i=1, #Config.Sell, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Sell[i].x, Config.Sell[i].y, Config.Sell[i].z, true) < Config.MarkerSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby sprzedać ubranie.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and not menuIsShowed then
					TriggerServerEvent('krawiec:sprzedaj')
				end

			end
		end
		for i=1, #Config.StoreVehicle, 1 do
			if(GetDistanceBetweenCoords(coords, Config.StoreVehicle[i].x, Config.StoreVehicle[i].y, Config.StoreVehicle[i].z, true) < 4.0) and IsPedInAnyVehicle(GetPlayerPed(-1)) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ schować pojazd do garażu.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) then
					--giga funckja
					local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
					if dist < 3 then
						DeleteEntity(veh)
						ESX.ShowNotification("~b~Pojazd zaparkowany")
					else
						ESX.ShowNotification("~r~Nie znajdujesz się w pojeździe.")
					end
					insideMarker = false
				end

			end
		end
		if sleep then
			Citizen.Wait(3000)
		end
	else
		Citizen.Wait(200)
	end
	end
end)

--[[CreateThread(function()
	while PlayerData.job == nil do
		Citizen.Wait(300)
	end
	while true do
		Citizen.Wait(1)
		if PlayerData.job.name == 'krawiec' then
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		isInkrawiecMainmenu  = false
		isInkrawiecwelna     = false
		isInkrawiecprzerobkaUbrania = false
		isInkrawiecwlokno = false
		isInkrawiecGetVehicle = false
		isInkrawiecSell = false
		isInkrawiecStorevehicle = false
		local currentZone = nil
		for i=1, #Config.MainMenu, 1 do
				if(GetDistanceBetweenCoords(coords, Config.MainMenu[i].x, Config.MainMenu[i].y, Config.MainMenu[i].z, true) < Config.MarkerSize.x) then
						isInkrawiecMainmenu = true
						SetTextComponentFormat('STRING')
						AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby otworzyć menu krawca.")
						DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(0, 38) and isInkrawiecMainmenu and not menuIsShowed then
						--giga funckja
						Openmainmenu()
					end

				end
		end
		for i=1, #Config.Welna, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Welna[i].x, Config.Welna[i].y, Config.Welna[i].z, true) < 4) then
				isInkrawiecwelna = true
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby zacząć zbierać wełnę.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and isInkrawiecwelna then
					--giga funckja
					FreezeEntityPosition(PlayerPedId(), true)
					TriggerServerEvent('krawiec:welna')
				end
			end
		end
		for i=1, #Config.Ubrania, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Ubrania[i].x, Config.Ubrania[i].y, Config.Ubrania[i].z, true) < 4) then
				isInkrawiecprzerobkaUbrania = true
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby zacząć przeróbkę włókna na ubrania.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and isInkrawiecprzerobkaUbrania then
					--giga funckja
					FreezeEntityPosition(PlayerPedId(), true)
					TriggerServerEvent('krawiec:ubranaa')
				end
			end
		end
		for i=1, #Config.Wlokno, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Wlokno[i].x, Config.Wlokno[i].y, Config.Wlokno[i].z, true) < 4) then
				isInkrawiecwlokno = true
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby zacząć przeróbkę wełny na włókno.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and isInkrawiecwlokno then
					--giga funckja
					FreezeEntityPosition(PlayerPedId(), true)
					TriggerServerEvent('krawiec:wlokno')
				end
			end
		end
		for i=1, #Config.GetVehicle, 1 do
			if(GetDistanceBetweenCoords(coords, Config.GetVehicle[i].x, Config.GetVehicle[i].y, Config.GetVehicle[i].z, true) < Config.MarkerSize.x) then
					isInkrawiecGetVehicle = true
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby otworzyć garaż.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and isInkrawiecGetVehicle and not menuIsShowed then
					--giga funckja
					OpenuGarage()
				end

			end
		end
		for i=1, #Config.Sell, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Sell[i].x, Config.Sell[i].y, Config.Sell[i].z, true) < Config.MarkerSize.x) then
					isInkrawiecSell = true
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ aby sprzedać ubranie.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and isInkrawiecSell and not menuIsShowed then
					TriggerServerEvent('krawiec:sprzedaj')
				end

			end
		end
		for i=1, #Config.StoreVehicle, 1 do
			if(GetDistanceBetweenCoords(coords, Config.StoreVehicle[i].x, Config.StoreVehicle[i].y, Config.StoreVehicle[i].z, true) < 4.0) and IsPedInAnyVehicle(GetPlayerPed(-1)) then
					isInkrawiecStorevehicle = true
					SetTextComponentFormat('STRING')
					AddTextComponentString("Naciśnij ~INPUT_CONTEXT~ schować pojazd do garażu.")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustReleased(0, 38) and isInkrawiecStorevehicle and not menuIsShowed then
					--giga funckja
					local veh,dist = ESX.Game.GetClosestVehicle(playerCoords)
					if dist < 3 then
						DeleteEntity(veh)
						ESX.ShowNotification("~b~Pojazd zaparkowany")
					else
						ESX.ShowNotification("~r~Nie znajdujesz się w pojeździe.")
					end
					insideMarker = false
				end

			end
		end
		if isInkrawiecMainmenu and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			sleep = false
		end
		if isInkrawiecprzerobkaUbrania and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			sleep = false
		end
		if isInkrawiecwelna and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			sleep = false
		end
		if isInkrawiecGetVehicle and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			sleep = false
		end
		if isInkrawiecStorevehicle and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			sleep = false
		end
		if isInkrawiecSell and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			sleep = false
		end
		if sleep then
			Citizen.Wait(3000)
		end
	else
		Citizen.Wait(200)
	end
	end
end)]]

function reloadskin()
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    TriggerEvent('esx_tattooshop:refreshTattoos')
end

function GetPedData()
	return Ped
end

function Openubrania()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'szafka',
        {
			align    = 'center',
            title    = 'Krawiec',
            elements = {
				{label = 'Ubranie Robocze', value = 'ppal'},
				{label = 'Ubranie Cywilne', value = 'ggume'},
            }
        },
		function(data, menu)
			if data.current.value == 'ppal' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, Clothes.Male)
					else
						TriggerEvent('skinchanger:loadClothes', skin, Clothes.Female)
					end
				end)
			elseif data.current.value == 'ggume' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
						GetPedData()
						reloadskin()
						TriggerEvent('esx_tattooshop:refreshTattoos')
				  end)
			end
        end,
        function(data, menu)
			menu.close()
        end
	)
end

function OpenuGarage()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'szafka',
        {
			align    = 'center',
            title    = 'Krawiec',
            elements = {
				{label = 'Wyciągnij pojazd', value = 'fajnepojazdyziom'},
            }
        },
		function(data, menu)
			if data.current.value == 'fajnepojazdyziom' then
				menu.close()
				RequestModel("burrito3")
				Citizen.Wait(100)
				local buritto3 = CreateVehicle("burrito3", 711.24, -980.14, 24.11, 42.26, true, true)
				SetPedIntoVehicle(GetPlayerPed(-1), buritto3, -1)
			end
        end,
        function(data, menu)
			menu.close()
        end
	)
end