ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local currentPed = nil
local loaded = false
local setped = true

RegisterNetEvent('worotox:SetPedToUser')
AddEventHandler('worotox:SetPedToUser', function(model)

	local ped = model
	local hash = GetHashKey(ped)

	RequestModel(hash)

	while not HasModelLoaded(hash) do 
		RequestModel(hash)
		Citizen.Wait(0)
	end
	SetPlayerModel(PlayerId(), hash)
end)

function OpenPedMenu(currentLabel)

	if currentLabel == nil then
		currentLabel = 'Brak'
	end

	local elements = {
		{label = 'Kobieta Zwykła', model = 'mp_m_freemode_01'},
		{label = 'Mężczyzna Zwykła', model = 'mp_f_freemode_01'},
		{label = 'Gruby Glina', model = 'a_m_m_fatlatin_01'},
		{label = 'Dziecko 1', model = 'archie'},
		{label = 'Dziecko 2', model = 'Dante'},
		{label = 'Dziecko 3', model = 'ig_groom'},
		{label = 'Dziecko 4', model = 'Jodie'},
		{label = 'Dziecko 5', model = 'Kyle'},
		{label = 'Dziecko 6', model = 'Luke'},
		{label = 'SPEJSON', model = 'lukecage'},
		{label = 'Szmata', model = 'Mai_Nude'},
		{label = 'Pies Policyjny', model = 'a_c_retriever'},
		{label = 'Dziadek W Garniturku', model = 'a_m_o_tramp_01'},
		{label = 'EMS', model = 'mp_m_meth_01'},
		{label = 'Dzik', model = 'a_c_boar'},
		{label = 'Biznes', model = 'a_m_m_business_01'},
		{label = 'Putan', model = 'a_m_m_tourist_01'},
		{label = 'Steryd', model = 'u_m_y_babyd'},
		{label = 'Factory', model = 's_m_y_factory_01'},
		{label = 'FBI', model = 's_m_m_ciasec_01'},
		{label = 'Chicold', model = 'g_m_m_chicold_01'},
		{label = 'Jeleń', model = 'a_c_deer'},
		{label = 'Kot', model = 'a_c_cat_01'},
		{label = 'Kormoran', model = 'a_c_cormorant'},
		{label = 'Rottweiler', model = 'a_c_rottweiler'},
		{label = 'Families 1', model = 'csb_ramp_gang'},
		{label = 'Ballas OG', model = 'csb_ballasog'},
		{label = 'Złomowoisko - Januszek', model = 'a_m_m_genfat_01'},
		{label = 'Złomowoisko - Edek', model = 'u_m_m_filmdirector'},
		{label = 'Złomowoisko - Farmer', model = 'a_m_m_farmer_01'},
		{label = 'Złomowoisko - Mareczek', model = 'a_m_m_fatlatin_01'},
		{label = 'Kidos mały', model = 'skin_baby'},
		{label = 'pelerynka', model = 'pelerynka'},
		{label = 'u_m_y_antonb', model = 'u_m_y_antonb'},
		{label = 'Husky', model = 'a_c_husky'},
		{label = 'Benny', model = 'ig_benny'},
		{label = 'blackops', model = 's_m_y_blackops_01'},
		{label = 'Więzień', model = 's_m_y_prismuscl_01'},
		{label = 'Więzień2', model = 'ig_rashcosvki'},
		{label = '|----------------------------|', model = nil},
		{label = 'Wybierz: ' ..currentLabel, model = 'wybierz'},
		
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ped_menu', {
		title    = "Menu Pedów",
		align    = 'right',
		elements = elements
	}, function(data, menu)
		if data.current.model == 'wybierz' then
			menu.close()
			TriggerServerEvent('worotox:SavePed', currentPed)
		else
			TriggerEvent('worotox:SetPedToUser', data.current.model)
			OpenPedMenu(data.current.label)
			currentPed = data.current.model
		end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('worotox:OpenPedMenu')
AddEventHandler('worotox:OpenPedMenu', function()
	OpenPedMenu(nil)
end)

AddEventHandler('skinchanger:modelLoaded', function()
	Wait(5000)
	TriggerServerEvent('worotox:CheckPed')
end)