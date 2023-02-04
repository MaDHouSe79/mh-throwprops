--[[ ===================================================== ]]--
--[[            MH Trow Props Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()

local function GetItem(object)
    local item = nil
    for i = 1, #Config.List do
        if Config.List[i].hash == object then
            item = Config.List[i].item
        end
    end
    return item
end

RegisterNetEvent("mh-trowprops:server:deleteObjectNetID")
AddEventHandler("mh-trowprops:server:deleteObjectNetID", function(objectNetID)
    TriggerClientEvent("mh-trowprops:client:deleteprop", -1, objectNetID)
end)

RegisterNetEvent("mh-trowprops:server:touch")
AddEventHandler("mh-trowprops:server:touch", function(player, ped, velocity)
    TriggerClientEvent("mh-trowprops:client:touch", player, ped, velocity)
end)

RegisterNetEvent("mh-trowprops:server:pickup")
AddEventHandler("mh-trowprops:server:pickup", function(object)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = GetItem(object)
    if item ~= nil then
        Player.Functions.AddItem(item, 1, nil)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add', 1)
    end
end)

RegisterNetEvent("mh-trowprops:server:throw")
AddEventHandler("mh-trowprops:server:throw", function(object, objectNetID)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = GetItem(object)
    if item ~= nil then
        Player.Functions.RemoveItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove', 1)
        TriggerClientEvent('mh-trowprops:client:deleteprop', -1, objectNetID)
    end
end)

QBCore.Functions.CreateUseableItem('garbagebin', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, 'prop_bin_01a')
end)

QBCore.Functions.CreateUseableItem('garbagebag', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, 'prop_rub_binbag_04')
end)

QBCore.Functions.CreateUseableItem('roadcone', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, 'prop_roadcone02b')
end)

QBCore.Functions.CreateUseableItem('bowlingball', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, 'prop_bowling_ball')
end)

QBCore.Functions.CreateUseableItem('bowlingpin', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, 'prop_bowling_pin')
end)

QBCore.Functions.CreateUseableItem('luggage', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, "prop_luggage_01a")
end)

QBCore.Functions.CreateUseableItem('manshoe', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, "prop_ld_shoe_01")
end)

QBCore.Functions.CreateUseableItem('womanshoe', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, "prop_cs_amanda_shoe")
end)

QBCore.Functions.CreateUseableItem('boxpile', function(source)
    TriggerClientEvent('mh-trowprops:client:createprop', source, "prop_cardbordbox_03a")
end)
