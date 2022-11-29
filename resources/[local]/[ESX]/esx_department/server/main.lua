ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_department:getJobsList', function(source, cb)
	MySQL.Async.fetchAll(
		'SELECT * FROM jobs WHERE whitelisted = false',
		{},
		function(result)
			local data = {}
			for i=1, #result, 1 do
				table.insert(data, {
					value   = result[i].name,
					label   = result[i].label
				})
			end
			cb(data)
		end
	)
end)

RegisterServerEvent('esx_department:setJob')
AddEventHandler('esx_department:setJob', function(job)
        print('[FoxRP] Fineeaszek szefitek jakis cwel dal se joba '.. job ..'')
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
     if job == 'police' or job == 'ambulance' or job == 'mecano' then SativkaLody() return end
      xPlayer.setJob(job, 0)
end)

local Log = 'https://discordapp.com/api/webhooks/860226809282428929/-FLEp0Qj5ayOQ0vj_ymzBHsFqhzURncUp2zcSBPdNAtLVHxY1wrBGVfptNLGDya_Aox1' 

function SativkaLody ()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)

    local embed = {
        {
            ["color"] = 15358494,
            ["title"] = "Gracz jest pedalem z sativki",
            ["description"] = "Nick: **"..name.."**\n ID:**".. source .."**\nHex: **"..steamhex.."**\nIp: **".. ip .."**",
            ["footer"] = {
                ["text"] = "FoxRP",
            },
        }
    }

    PerformHttpRequest(Log, function(err, headers) end, 'POST', json.encode({username = 'FoxRP', embeds = embed, content = '@everyone'}), { ['Content-Type'] = 'application/json' })   
end
