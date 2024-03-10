local PlayerPedId = PlayerPedId
local playerPed = PlayerPedId()
local IsAnimated = false
local level					 = -1




RegisterNetEvent('lean_anim')                         ----If anim doesn't work, restart the script
AddEventHandler('lean_anim', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_plastic_cup_02'
		IsAnimated = true

		CreateThread(function()
			local playerPed = playerPed
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 57005)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.105, -0.07, -0.045, -80.0, 0.0, -20.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('amb@world_human_drinking@coffee@male@idle_a', function()
				TaskPlayAnim(playerPed, 'amb@world_human_drinking@coffee@male@idle_a', 'idle_a', 8.0, 3.0, -1, 51, 1, 0, 0, 0)
				Wait(5500)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


RegisterNetEvent('lean_drink') 
AddEventHandler('lean_drink', function()
	level = level + 1

	if level == 0 then
		local playerPed = GetPlayerPed(-1)
		AddArmourToPed(playerPed, 50)
		SetPedArmour(playerPed, 50)
		anim = "move_m@drunk@slightlydrunk"
		shake = 1.0
		ESX.ShowNotification('~r~You start feeling lean effect')
		setPlayerOnLean(anim, shake)
		Wait(Config.dose1)
		ESX.ShowNotification('~r~You stop feeling the lean effect')
		ResetPedMovementClipset(playerPed, 0)
		SetPedIsDrunk(playerPed, false)
		SetPedMotionBlur(playerPed, false)
		ShakeGameplayCam("DRUNK_SHAKE", 0.0)
		ClearTimecycleModifier()
		ResetScenarioTypesEnabled()
		ClearPedSecondaryTask(playerPed)

	elseif level == 1 then
		local playerPed = GetPlayerPed(-1)
		AddArmourToPed(playerPed, 100)
		anim = "move_m@drunk@moderatedrunk"
		shake = 2.0
		ESX.ShowNotification('~r~You start to feel the lean effect in double dose')
		setPlayerOnLean(anim, shake)
		Wait(Config.dose2)
		ESX.ShowNotification('~r~You stop feeling the lean effect')
		ResetPedMovementClipset(playerPed, 0)
		SetPedIsDrunk(playerPed, false)
		SetPedMotionBlur(playerPed, false)
		ShakeGameplayCam("DRUNK_SHAKE", 0.0)
		ClearTimecycleModifier()
		ResetScenarioTypesEnabled()
		ClearPedSecondaryTask(playerPed)
    
	elseif level == 2 then
		local playerPed = GetPlayerPed(-1)
		SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
		anim = "move_m@drunk@verydrunk"
		shake = 2.0
		ESX.ShowNotification('~r~You start to feel, ~b~lean ~p~in triple dose')
		setPlayerOnLean(anim, shake)
		Wait(Config.dose3)
		ESX.ShowNotification('~r~You stop feeling the lean effect')
		ResetPedMovementClipset(playerPed, 0)
		SetPedIsDrunk(playerPed, false)
		SetPedMotionBlur(playerPed, false)
		ShakeGameplayCam("DRUNK_SHAKE", 0.0)
		ClearPedSecondaryTask(playerPed)
		ResetScenarioTypesEnabled()
		ClearTimecycleModifier()
	elseif level >= 3 then

		local ped = PlayerPedId()
		SetEntityHealth(ped, 0)
		ESX.ShowNotification('~b~You overdosed')
		

end
end)

function setPlayerOnLean(anim, shake)
	local PlayerPed = PlayerPedId()

	RequestAnimSet(anim)
      
	while not HasAnimSetLoaded(anim) do
		Citizen.Wait(100)
	end

	SetPedMovementClipset(PlayerPed, anim, true)
	ShakeGameplayCam("DRUNK_SHAKE", shake)
	SetPedIsDrunk(PlayerPed, true)
	ClearPedTasksImmediately(playerPed)
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
	
end



RegisterNetEvent('lean_sober') 
AddEventHandler('lean_sober', function()
		local playerPed = PlayerPedId()
		level = -1
		timing = false
		drunk = false
		ESX.ShowNotification('~r~You stop feeling the lean effect')
		SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
		ClearTimecycleModifier()
		Citizen.Wait(5000)                                   ---Time for ends effects (in ms)
		ResetScenarioTypesEnabled()
		Citizen.Wait(5000)                                   
		ResetPedMovementClipset(playerPed, 0)
		Citizen.Wait(5000)                                   
		SetPedIsDrunk(playerPed, false)
		Citizen.Wait(5000)                                   
		SetPedMotionBlur(playerPed, false)
		Citizen.Wait(5000)                                    
		ClearPedSecondaryTask(playerPed)
		Citizen.Wait(5000)
		ShakeGameplayCam("DRUNK_SHAKE", 0.0)
	end)

	RegisterNetEvent('coughsyrup')                               
	AddEventHandler('coughsyrup', function()
			local playerPed = PlayerPedId()
			SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
			anim = "move_m@drunk@slightlydrunk"
			shake = 1.0
			ESX.ShowNotification('~r~You, drink Cough Syrup')
			setPlayerOnLean(anim, shake)
			Wait(Config.dose4)                             
			ResetPedMovementClipset(playerPed, 0)
			ResetScenarioTypesEnabled()
			ClearTimecycleModifier()
			SetPedIsDrunk(playerPed, false)
			ClearPedSecondaryTask(playerPed)
			SetPedMotionBlur(playerPed, false)
			ShakeGameplayCam("DRUNK_SHAKE", 0.0)
			ESX.ShowNotification('~r~You, stop feeling Cough Syrup')
			
		end)