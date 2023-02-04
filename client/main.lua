--[[ ===================================================== ]]--
--[[            MH Trow Props Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local lastGrab = nil
local CurrentAnimation = nil
local hasPropInHand = false
local grabed = nil
local isDrop = false
local isCooldown = false
local canPickup = true

local function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(500)
	end
end

local function loadModel(model)
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end
    end
end

local function RunCoolDown()
    isCooldown = true
    SetTimeout(Config.CooldownTimer, function()
        isCooldown = false
    end)
end

local function PickupCoolDown()
    canPickup = false
    SetTimeout(Config.pickupCoolDownTimer, function()
        canPickup = true
    end)
end

local function LoadTargetProps()
    if not Config.BuyPropFromStore then
        for k, v in pairs(Config.List) do
            exports['qb-target']:AddTargetModel(v.hash, {
                options = {
                    { 
                        type = "client",
                        icon = "fas fa-hand",
                        label = Lang:t('target.pickup_prop'),
                        action = function(entity)
                            if canPickup then
                                PickupCoolDown()
                                TriggerServerEvent('mh-trowprops:server:pickup', GetEntityModel(entity))
                                SetEntityAsMissionEntity(entity, true, true)
                                DeleteObject(entity) 
                                PlayAnimation(playerPed, "weapons@first_person@aim_rng@generic@projectile@sticky_bomb@", "plant_floor", 1)
                                Wait(800)
                                ClearPedTasksImmediately(playerPed)
                            end
                        end,
                        canInteract = function(entity, distance, data)
                            if not canPickup then return false end
                            return true
                        end
                    },
                },
                distance = 15.0 
            })
        end
    end
end

local function DrawTxt(x, y, width, height, scale, text, r, g, b, a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.005)
end

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

local function getDistance(a, b) 
    local x, y, z = a.x - b.x, a.y - b.y, a.z - b.z
    return math.sqrt(x * x + y * y + z * z)
end

local function EnumerateEntities(firstFunc, nextFunc, endFunc)
	return coroutine.wrap(function()
		local iter, id = firstFunc()
		if not id or id == 0 then
			endFunc(iter)
			return
		end
		local enum = {handle = iter, destructor = endFunc}
		setmetatable(enum, entityEnumerator)
		local next = true
		repeat
			coroutine.yield(id)
			next, id = nextFunc(iter)
		until not next
		enum.destructor, enum.handle = nil, nil
		endFunc(iter)
	end)
end

local function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

local function PlayAnimation(ped, animDict, animName, animFlag)
	if not DoesAnimDictExist(animDict) then
		print("Invalid animation dictionry: " .. animDict)
		return
	end
	loadAnimDict(animDict)
	TaskPlayAnim(ped, animDict, animName, 4.0, 4.0, -1, animFlag, 0, false, false, false, "", false)
	RemoveAnimDict(animDict)
end

local function CanThrowProp(ped)
	return not (IsPedRagdoll(ped) or IsPedClimbing(ped) or IsPlayerDead(ped))
end

local function SetPedRagdoll(ped, velocity)
	SetPedToRagdoll(ped, 3000, 3000, 0, 0, 0, 0)
	SetEntityVelocity(ped, velocity / 6.0)
end

local function GetPlayerFromPed(ped)
	for _, player in ipairs(GetActivePlayers()) do
		if GetPlayerPed(player) == ped then
			return player
		end
	end
end

local function AddLongString(txt)
    for i = 100, string.len(txt), 99 do
        local sub = string.sub(txt, i, i + 99)
        AddTextComponentSubstringPlayerName(sub)
    end
end

local function GetZAngle(rotation, timePressed)
    local zangle
    if rotation.x < -20.0 then
        if timePressed > 1000 then
            CurrentAnimation = Config.Animations.aimingFullLow
        else
            CurrentAnimation = Config.Animations.aimingLow
        end
        zangle = 5.0
    elseif rotation.x < 20.0 then
        if timePressed > 1000 then
            CurrentAnimation = Config.Animations.aimingFullMed
        else
            CurrentAnimation = Config.Animations.aimingMed
        end
        zangle = 10.0
    else
        if timePressed > 1000 then
            CurrentAnimation = Config.Animations.aimingFullHigh
        else
            CurrentAnimation = Config.Animations.aimingHigh
        end
        zangle = 15.0
    end
    return zangle
end

local function GetThrowAnimation(timePressed)
    local velocity
    local throwingAnim
    if timePressed > 1000 then
        velocity = Config.BaseVelocity * 5
        throwingAnim = Config.Animations.throwingHigh
    elseif timePressed > 200 then
        velocity = Config.BaseVelocity * 3
        throwingAnim = Config.Animations.throwingMed
    else
        velocity = Config.BaseVelocity
        throwingAnim = Config.Animations.throwingLow
    end
    return velocity, throwingAnim
end

local function GetThrowAxes(velocity, rotation, zangle)
    local r = math.rad(-rotation.z)
    local x = velocity * math.sin(r)
    local y = velocity * math.cos(r)
    local z = rotation.x + zangle
    return x, y, z
end

local function ShowText(text, sound, loop)
    BeginTextCommandDisplayHelp("jamyfafi")
    AddTextComponentSubstringPlayerName(text)
    if string.len(text) > 99 then AddLongString(text) end
    EndTextCommandDisplayHelp(0, loop or 0, sound or false, -1)
end

RegisterNetEvent("mh-trowprops:client:deleteprop")
AddEventHandler("mh-trowprops:client:deleteprop", function(objectNetID)
    local object = NetToObj(objectNetID)
    if DoesEntityExist(object) then
        SetEntityAsMissionEntity(object, true, true)
        Wait(5000)
        DeleteObject(object) 
    end
end)

RegisterNetEvent("mh-trowprops:client:touch")
AddEventHandler("mh-trowprops:client:touch", function(ped, velocity)
	if (ped == -1) then
		SetPedRagdoll(PlayerPedId(), velocity)
	else
		SetPedRagdoll(NetToPed(ped), velocity)
	end
end)

RegisterNetEvent("mh-trowprops:client:createprop")
AddEventHandler("mh-trowprops:client:createprop", function(prop)
    loadModel(prop)
    local ped = PlayerPedId()
    PlayAnimation(ped, "weapons@first_person@aim_rng@generic@projectile@sticky_bomb@", "plant_floor", 1)
    Wait(800)
    ClearPedTasksImmediately(ped)
    local obj = CreateObject(prop, 0.0, 0.0, 0.0, true, false, true, false, false)
    NetworkRequestControlOfEntity(obj)
    local timeWaited = 0
    while not NetworkHasControlOfEntity(obj) and timeWaited <= 500 do
        Wait(1)
        timeWaited = timeWaited + 1
    end
    SetEntityAsMissionEntity(obj, true, true)
    SetEntityCollision(obj, true)
    AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, 0x6F06), 0.0, 0.0, 0.0, 0.0, 0.0,0.0, true, true, false, true, 1, true)
    hasPropInHand = true
    lastGrab = obj
    grabed = lastGrab
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    LoadTargetProps()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        LoadTargetProps()
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            local sleep = 1000
            if not isCooldown then
                sleep = 1000
                local playerPed = PlayerPedId()	
                local timeStartedPressing = nil
                if hasPropInHand then 
                    sleep = 0
                    SetPlayerLockon(PlayerId(), false)
                    if CanThrowProp(playerPed) then
                        ShowText(Lang:t('info.press_to_throw')) 
                        if IsControlPressed(0, 25) then -- right mouse
                            local timePressed = nil
                            if timeStartedPressing then timePressed = GetGameTimer() - timeStartedPressing else timePressed = 0 end
                            local rotation = GetGameplayCamRot(2)
                            local zangle = GetZAngle(rotation, timePressed)
                            if IsControlPressed(0, 24) then
                                if not timeStartedPressing then timeStartedPressing = GetGameTimer() end
                            elseif IsControlJustReleased(0, 24) then
                                local velocity, throwingAnim = GetThrowAnimation(timePressed)
                                timeStartedPressing = nil
                                ClearPedTasksImmediately(playerPed)
                                SetEntityHeading(playerPed, rotation.z)
                                PlayAnimation(playerPed, throwingAnim.dict, throwingAnim.name, 120)
                                Wait(500)
                                local x, y, z = GetThrowAxes(velocity, rotation, zangle)
                                ClearPedTasks(playerPed)
                                DetachEntity(lastGrab, true, true)
                                SetEntityCoords(lastGrab, GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.0, 0.2))
                                SetEntityVelocity(lastGrab, x, y, z)
                                TriggerServerEvent('mh-trowprops:server:throw', GetEntityModel(lastGrab), ObjToNet(lastGrab))
                                isDrop = true
                                grabed = lastGrab
                                local model = GetEntityModel(lastGrab)
                                SetObjectAsNoLongerNeeded(lastGrab)
                                SetPlayerLockon(PlayerId(), true)
                                lastGrab = 0
                                hasPropInHand = false
                                RunCoolDown()
                            end
                        end
                    end
                end
            end
            if HasEntityCollidedWithAnything(grabed) then
                local velocity = GetEntityVelocity(grabed)
                if isDrop then
                    for ped in EnumeratePeds() do
                        if IsEntityTouchingEntity(grabed, ped) then
                            if GetPlayerServerId(GetPlayerFromPed(ped)) ~= GetPlayerServerId(GetPlayerFromPed(PlayerPedId())) then
                                if IsPedAPlayer(ped) and not IsPedRagdoll(ped) then
                                    TriggerServerEvent("mh-trowprops:server:touch", GetPlayerServerId(GetPlayerFromPed(ped)), -1, velocity)
                                    TriggerServerEvent("mh-trowprops:server:deleteObjectNetID", ObjToNet(grabed))
                                    isDrop = false
                                    break
                                elseif NetworkGetEntityIsNetworked(ped) and not IsPedRagdoll(ped) then
                                    if NetworkHasControlOfEntity(ped) then
                                        SetPedRagdoll(ped, velocity)
                                        TriggerServerEvent("mh-trowprops:server:deleteObjectNetID", ObjToNet(grabed))
                                        isDrop = false
                                        break
                                    else
                                        TriggerServerEvent("mh-trowprops:server:touch", -1, PedToNet(ped), velocity)
                                        TriggerServerEvent("mh-trowprops:server:deleteObjectNetID", ObjToNet(grabed))
                                        isDrop = false
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end 
        end
        Wait(sleep)
    end
end)
