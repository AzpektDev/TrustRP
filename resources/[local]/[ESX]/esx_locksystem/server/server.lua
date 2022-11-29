----------------------
-- Author : Deediezi
-- Version 3.0
--
-- Contributors : No contributors at the moment.
--
-- Github link : https://github.com/Deediezi/FiveM_LockSystem
-- You can contribute to the project. All the information is on Github.

--  Server side

owners = {} -- owners[plate] = identifier
secondOwners = {} -- secondOwners[plate] = {identifier, identifier, ...}

RegisterServerEvent("ls:retrieveVehiclesOnconnect")
AddEventHandler("ls:retrieveVehiclesOnconnect", function()
    local src = source
    local srcIdentifier = GetPlayerIdentifiers(src)[2]

    for plate, plyIdentifier in pairs(owners) do
        if(plyIdentifier == srcIdentifier)then
            TriggerClientEvent("ls:newVehicle", src, nil, plate, nil)
        end
    end

    for plate, identifiers in pairs(secondOwners) do
        for _, plyIdentifier in ipairs(identifiers) do
            if(plyIdentifier == srcIdentifier)then
                TriggerClientEvent("ls:newVehicle", src, nil, plate, nil)
            end
        end
    end
end)

RegisterServerEvent("ls:addOwner")
AddEventHandler("ls:addOwner", function(plate)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local plate = string.lower(plate)

    owners[plate] = identifier
end)

RegisterServerEvent("ls:addSecondOwner")
AddEventHandler("ls:addSecondOwner", function(targetIdentifier, plate)
    local plate = string.lower(plate)

    if(secondOwners[plate])then
        table.insert(secondOwners[plate], targetIdentifier)
    else
        secondOwners[plate] = {targetIdentifier}
    end
end)

RegisterNetEvent("ls:checkOwner")
AddEventHandler("ls:checkOwner", function(localVehId, plate, lockStatus)
    local plate = string.lower(plate)
    local src = source
    local hasOwner = false

    if(not owners[plate])then
        TriggerClientEvent("ls:getHasOwner", src, nil, localVehId, plate, lockStatus)
    else
        if(owners[plate] == "locked")then
            --TriggerClientEvent("esx:showNotification", src, "The keys aren't inside")
        else
            TriggerClientEvent("ls:getHasOwner", src, true, localVehId, plate, lockStatus)
        end
    end
end)

RegisterServerEvent("ls:lockTheVehicle")
AddEventHandler("ls:lockTheVehicle", function(plate)
    owners[plate] = "locked"
end)

RegisterServerEvent("ls:haveKeys")
AddEventHandler("ls:haveKeys", function(target, vehPlate, cb)
    targetIdentifier = GetPlayerIdentifiers(target)[1]
    hasKey = false

    for plate, identifier in pairs(owners) do
        if(plate == vehPlate and identifier == targetIdentifier)then
            hasKey = true
            break
        end
    end
    for plate, identifiers in pairs(secondOwners) do
        if(plate == vehPlate)then
            for _, plyIdentifier in ipairs(identifiers) do
                if(plyIdentifier == targetIdentifier)then
                    hasKey = true
                    break
                end
            end
        end
    end

    if(hasKey)then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent("ls:updateServerVehiclePlate")
AddEventHandler("ls:updateServerVehiclePlate", function(oldPlate, newPlate)
    local oldPlate = string.lower(oldPlate)
    local newPlate = string.lower(newPlate)

    if(owners[oldPlate] and not owners[newPlate])then
        owners[newPlate] = owners[oldPlate]
        owners[oldPlate] = nil
    end
    if(secondOwners[oldPlate] and not secondOwners[newPlate])then
        secondOwners[newPlate] = secondOwners[oldPlate]
        secondOwners[oldPlate] = nil
    end
end)
