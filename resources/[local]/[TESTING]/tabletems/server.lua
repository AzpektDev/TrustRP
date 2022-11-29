ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('uzihoneyrp:faktura')
AddEventHandler('uzihoneyrp:faktura', function(target, fine, powod)
	local _source = source
	local xPlayersrc = ESX.GetPlayerFromId(_source)
	if xPlayersrc.job.name == "ambulance" or xPlayersrc.job.name == "offambulance" or xPlayersrc.job.name == "police" or xPlayersrc.job.name == "offpolice" then 
		local xPlayer = ESX.GetPlayerFromId(target)
		xPlayer.removeAccountMoney('bank', fine)


		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ambulance', function(account)
			account.addMoney(fine)
		end)
		
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do

			local xPlayerX = ESX.GetPlayerFromId(xPlayers[i])
			TriggerClientEvent('uzihoneyrp:fakturanotify', xPlayerX.source, fine, target, powod, "^2FAKTURA")

		end
	else
		--log na _source 
		DropPlayer(_source, "HEHE co ty chciałeś zrobić pozderki od UZI")
	end
end)


RegisterServerEvent('uzihoneyrp:fakturahajs')
AddEventHandler('uzihoneyrp:fakturahajs', function(amount)

  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addAccountMoney('bank', 5000)
  
end)



RegisterServerEvent('insertKarto1')
AddEventHandler('insertKarto1', function(data)
	MySQL.Async.execute('INSERT INTO kartoteka_ems (firstname, lastname, dateofbirth, reason, cop) VALUES (@firstname, @lastname, @dateofbirth, @reason, @cop)', 
	{
		['@firstname'] = data.firstname,
		['@lastname'] = data.lastname,
		['@dateofbirth'] = data.dob,
		['@reason'] = data.reason,
		['@cop'] = data.cop
	}, function (rowsChanged)
		print('KARTO INSERTED')
	end)
end)  

ESX.RegisterServerCallback('findKarto1', function(source, cb, data)
	MySQL.Async.fetchAll('SELECT * FROM kartoteka_ems WHERE firstname = @firstname AND lastname = @lastname', {
		['@firstname'] = data.firstname,
		['@lastname'] = data.lastname
	}, function(results)
		cb(results)
	end)
end)

ESX.RegisterServerCallback('openKarto2', function(source, cb, data)
	MySQL.Async.fetchAll('SELECT * FROM kartoteka_ems WHERE id = @id', {
		['@id'] = data.id
	}, function(result)
		cb(result[1])
	end)
end)
