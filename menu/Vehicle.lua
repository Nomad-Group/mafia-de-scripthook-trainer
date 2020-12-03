-- Utility
local function IsPlayerInVehicle()
    local player = game.game:GetActivePlayer()
    
    if player == nil then
        return false
    end

    if player:GetOwner() == nil then
        return false
    end

    return true
end

local function GetPlayerVehicle()
    local player = game.game:GetActivePlayer()
    
    if player == nil then
        return false
    end

    if player:GetOwner() == nil then
        return false
    end

    return player:GetOwner()
end

local function IsPlayerVehicleEngineRunning()
	local veh = GetPlayerVehicle()
	if veh == nil then
		return false
	end

	return veh:IsEngineOn()
end

local function IsPlayerVehicleExplosiveDisabled()
	local veh = GetPlayerVehicle()
	if veh == nil then
		return false
	end

	return veh:IsDisableExplosion()
end

--Gets Player Position 
local function GetPlayerPos()
	local obj = game.game:GetActivePlayer()
        
	if obj == nil then
		return false
	end

	if (obj:GetOwner() ~= nil) then
		obj = obj:GetOwner()
	end

	local pos = obj:GetPos()
	return pos
end

--Spawn Boat Function
local function SpawnBoat(boatModel)
	--Spawns boat close to the player
	StartThread(function ()
		local so, id = game.traffic:ObtainSpecificBoat(boatModel)
		Wait(so)
		local playerPos= GetPlayerPos()
		local positionX = playerPos.x + 10
		game.traffic:SpawnBoat(id, Math:newVector(positionX , playerPos.y, playerPos.z), Math:newVector(-0.372481, 0.928002, -0.008343))
	end)
end

-- Spawn Vehicle
local function SpawnVehicle(menu, text, name)
	if text== "small_motorboat" or text =="offshore_boat" or text == "bc_boat_fishing" then
	-- If user attempts to spawn a boat invoke exclusive method for spawning boats
		SpawnBoat(name)
	else
		package.loaded.common.base.game_structure_console.carpls(name)
	end
end

local function SpawnVehicleMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Spawn Vehicle")
	menu:AddSearch("Search", "Start typing to filter")

	for k,v in pairsByKeys(VehicleModelIDs) do
		menu:AddButton(k, v, SpawnVehicle)
	end

	return menu
end

-- Local Vehicle
local function VehiclePartChangeMenu(text)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle Part " .. text)

	local veh = GetPlayerVehicle()
	if veh == nil then
		return
	end

	menu:AddButton("Open " .. text, "Open the " .. text, function()
		if text == "Hood" then
			veh:OpenHood()
		end

		if text == "Trunk" then
			veh:OpenTrunk()
		end
	end)
	menu:AddButton("Close " .. text, "Close the " .. text, function()
		if text == "Hood" then
			veh:CloseHood()
		end

		if text == "Trunk" then
			veh:CloseTrunk()
		end
	end)

	return menu
end


local function VehiclePartsMenu(menu, text, name)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle Parts")

	menu:AddButton("Hood", "Modify the hood", ScriptHook.CurrentScript():CacheMenu(function()
        return VehiclePartChangeMenu("Hood")
    end))
	menu:AddButton("Trunk", "Modify the trunk", ScriptHook.CurrentScript():CacheMenu(function()
        return VehiclePartChangeMenu("Trunk")
    end))

	return menu
end

local function VehicleColorChange(menu, text, name)
	local veh = GetPlayerVehicle()
	if veh == nil then
		return
	end

	veh:SetColor(tonumber(name), tonumber(name));
end

local function VehicleTireColorChange(menu, text, name)
	local veh = GetPlayerVehicle()
	if veh == nil then
		return
	end

	veh:SetWheelColor(tonumber(name), tonumber(name));
end

local function VehicleWindowTintChange(menu, text, name)
	local veh = GetPlayerVehicle()
	if veh == nil then
		return
	end

	veh:SetWindowTint(tonumber(name));
end

local function VehicleColorMenu(menu, text, name)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle Color")

	menu:AddButton("Color 1", "1", VehicleColorChange)
	menu:AddButton("Color 2", "2", VehicleColorChange)
	menu:AddButton("Color 3", "3", VehicleColorChange)
	menu:AddButton("Color 4", "4", VehicleColorChange)
	menu:AddButton("Color 5", "5", VehicleColorChange)
	menu:AddButton("Color 6", "6", VehicleColorChange)
	menu:AddButton("Color 7", "7", VehicleColorChange)
	menu:AddButton("Color 8", "8", VehicleColorChange)
	menu:AddButton("Color 9", "9", VehicleColorChange)
	menu:AddButton("Color 10", "10", VehicleColorChange)
	menu:AddButton("Color 11", "11", VehicleColorChange)
	menu:AddButton("Color 12", "12", VehicleColorChange)
	menu:AddButton("Color 13", "13", VehicleColorChange)
	menu:AddButton("Color 14", "14", VehicleColorChange)
	menu:AddButton("Color 15", "15", VehicleColorChange)
	menu:AddButton("Color 16", "16", VehicleColorChange)
	menu:AddButton("Color 17", "17", VehicleColorChange)
	menu:AddButton("Color 18", "18", VehicleColorChange)
	menu:AddButton("Color 19", "19", VehicleColorChange)
	menu:AddButton("Color 20", "20", VehicleColorChange)
	menu:AddButton("Color 21", "21", VehicleColorChange)
	menu:AddButton("Color 22", "22", VehicleColorChange)
	menu:AddButton("Color 23", "23", VehicleColorChange)
	menu:AddButton("Color 24", "24", VehicleColorChange)
	menu:AddButton("Color 25", "25", VehicleColorChange)
	menu:AddButton("Color 26", "26", VehicleColorChange)
	menu:AddButton("Color 27", "27", VehicleColorChange)
	menu:AddButton("Color 28", "28", VehicleColorChange)
	menu:AddButton("Color 29", "29", VehicleColorChange)
	menu:AddButton("Color 30", "30", VehicleColorChange)
	menu:AddButton("Color 31", "31", VehicleColorChange)
	menu:AddButton("Color 32", "32", VehicleColorChange)
	menu:AddButton("Color 33", "33", VehicleColorChange)
	menu:AddButton("Color 34", "34", VehicleColorChange)
	menu:AddButton("Color 35", "35", VehicleColorChange)
	menu:AddButton("Color 36", "36", VehicleColorChange)
	menu:AddButton("Color 37", "37", VehicleColorChange)
	menu:AddButton("Color 38", "38", VehicleColorChange)
	menu:AddButton("Color 39", "39", VehicleColorChange)
	menu:AddButton("Color 40", "40", VehicleColorChange)
	menu:AddButton("Color 41", "41", VehicleColorChange)
	menu:AddButton("Color 42", "42", VehicleColorChange)

	return menu
end

local function VehicleTireColorMenu(menu, text, name)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle Tire Color")

	menu:AddButton("Color 1", "1", VehicleTireColorChange)
	menu:AddButton("Color 2", "2", VehicleTireColorChange)
	menu:AddButton("Color 3", "3", VehicleTireColorChange)
	menu:AddButton("Color 4", "4", VehicleTireColorChange)
	menu:AddButton("Color 5", "5", VehicleTireColorChange)
	menu:AddButton("Color 6", "6", VehicleTireColorChange)
	menu:AddButton("Color 7", "7", VehicleTireColorChange)
	menu:AddButton("Color 8", "8", VehicleTireColorChange)
	menu:AddButton("Color 9", "9", VehicleTireColorChange)
	menu:AddButton("Color 10", "10", VehicleTireColorChange)
	menu:AddButton("Color 11", "11", VehicleTireColorChange)
	menu:AddButton("Color 12", "12", VehicleTireColorChange)
	menu:AddButton("Color 13", "13", VehicleTireColorChange)
	menu:AddButton("Color 14", "14", VehicleTireColorChange)
	menu:AddButton("Color 15", "15", VehicleTireColorChange)
	menu:AddButton("Color 16", "16", VehicleTireColorChange)
	menu:AddButton("Color 17", "17", VehicleTireColorChange)
	menu:AddButton("Color 18", "18", VehicleTireColorChange)
	menu:AddButton("Color 19", "19", VehicleTireColorChange)
	menu:AddButton("Color 20", "20", VehicleTireColorChange)
	menu:AddButton("Color 21", "21", VehicleTireColorChange)
	menu:AddButton("Color 22", "22", VehicleTireColorChange)
	menu:AddButton("Color 23", "23", VehicleTireColorChange)
	menu:AddButton("Color 24", "24", VehicleTireColorChange)
	menu:AddButton("Color 25", "25", VehicleTireColorChange)
	menu:AddButton("Color 26", "26", VehicleTireColorChange)
	menu:AddButton("Color 27", "27", VehicleTireColorChange)
	menu:AddButton("Color 28", "28", VehicleTireColorChange)
	menu:AddButton("Color 29", "29", VehicleTireColorChange)
	menu:AddButton("Color 30", "30", VehicleTireColorChange)
	menu:AddButton("Color 31", "31", VehicleTireColorChange)
	menu:AddButton("Color 32", "32", VehicleTireColorChange)
	menu:AddButton("Color 33", "33", VehicleTireColorChange)
	menu:AddButton("Color 34", "34", VehicleTireColorChange)
	menu:AddButton("Color 35", "35", VehicleTireColorChange)
	menu:AddButton("Color 36", "36", VehicleTireColorChange)
	menu:AddButton("Color 37", "37", VehicleTireColorChange)
	menu:AddButton("Color 38", "38", VehicleTireColorChange)
	menu:AddButton("Color 39", "39", VehicleTireColorChange)
	menu:AddButton("Color 40", "40", VehicleTireColorChange)
	menu:AddButton("Color 41", "41", VehicleTireColorChange)
	menu:AddButton("Color 42", "42", VehicleTireColorChange)

	return menu
end


local function VehicleWindowTintMenu(menu, text, name)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle Window Tint")

	menu:AddButton("Color 1", "1", VehicleWindowTintChange)
	menu:AddButton("Color 2", "2", VehicleWindowTintChange)
	menu:AddButton("Color 3", "3", VehicleWindowTintChange)
	menu:AddButton("Color 4", "4", VehicleWindowTintChange)
	menu:AddButton("Color 5", "5", VehicleWindowTintChange)
	menu:AddButton("Color 6", "6", VehicleWindowTintChange)
	menu:AddButton("Color 7", "7", VehicleWindowTintChange)
	menu:AddButton("Color 8", "8", VehicleWindowTintChange)
	menu:AddButton("Color 9", "9", VehicleWindowTintChange)
	menu:AddButton("Color 10", "10", VehicleWindowTintChange)

	return menu
end

local function VehicleLightsMenu(menu, text, name)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle Lights")

	menu:AddButton("Turn on", function() 
        local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetLightState(true, true)
    end)

    menu:AddButton("Turn off", function() 
        local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetLightState(true, false)
    end)

	return menu
end

local function VehicleSirenMenu(menu, text, name)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle Siren")

	menu:AddButton("Turn on", function() 
        local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetSirenOn(true)
    end)

    menu:AddButton("Turn off", function() 
        local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetSirenOn(false)
    end)

	return menu
end

local function VehicleHandlingChange(menu, text, name)
	local veh = GetPlayerVehicle()
	if veh == nil then
		return
	end

	veh:SetSlowMotionAssist(tonumber(name));
end

local function VehicleHandlingMenu(menu, text, name)
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle Handling")

	menu:AddButton("Default Handling", "0", VehicleHandlingChange)
	menu:AddButton("Handling multiplier x1", "1", VehicleHandlingChange)
	menu:AddButton("Handling multiplier x2", "2", VehicleHandlingChange)
	menu:AddButton("Handling multiplier x3", "3", VehicleHandlingChange)
	menu:AddButton("Handling multiplier x5", "5", VehicleHandlingChange)
	menu:AddButton("Handling multiplier x10", "10", VehicleHandlingChange)
	menu:AddButton("Handling multiplier x20", "20", VehicleHandlingChange)

	return menu
end

local function LocalVehicleMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Local Vehicle")

	local engineIdx = menu:AddCheckbox("Engine", "Toggle Engine", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		local state = veh:IsEngineOn() == false
		veh:SetEngineOn(state, state)
	end)

	local explosionIdx = menu:AddCheckbox("Explosion Disabled", "Toggle Explosions", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:DisableExplosion(not veh:IsDisableExplosion())
	end)

	menu:AddButton("Nitro Boost", "Give yourself some nice boost", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetSpeed(50)
	end)

	menu:AddButton("Extreme Nitro Boost", "Give yourself some extreme boost", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetSpeed(500)
	end)

	menu:AddButton("Reset Dirt", "Make your car looking nice", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetDirty(0)
		veh:SetRust(0)
	end)
	menu:AddButton("Reset Motor Damage", "Get full power back again", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetMotorDamage(0)
	end)
	menu:AddButton("Reset Damage", "Like no one seen the damage", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:Repair(true)
	end)
	menu:AddButton("Refuel", "Free gas for everyone", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetActualFuel(100)
	end)
	menu:AddButton("License Plate", "Set your custom license plate", function()
		UI.SimpleTextInput("License Plate", function(success, text)
			if success then
				local veh = GetPlayerVehicle()
				if veh == nil then
					return
				end

				veh:SetSPZText(text, true)
			end
		end, "Maximum 6 Characters", 6)
	end)
	menu:AddButton("Set Despawn Immunity", "Never loose your car again", function()
		local veh = GetPlayerVehicle()
		if veh == nil then
			return
		end

		veh:SetDespawnImmunity(true)
	end)

	menu:AddButton("Handling", "Modify Handling", ScriptHook.CurrentScript():CacheMenu(VehicleHandlingMenu))
	menu:AddButton("Parts", "Modify Parts", ScriptHook.CurrentScript():CacheMenu(VehiclePartsMenu))
	menu:AddButton("Lights", "Modify Lights", ScriptHook.CurrentScript():CacheMenu(VehicleLightsMenu))
	menu:AddButton("Siren", "Modify Siren", ScriptHook.CurrentScript():CacheMenu(VehicleSirenMenu))
	menu:AddButton("Color", "Modify Color", ScriptHook.CurrentScript():CacheMenu(VehicleColorMenu))
	menu:AddButton("Tire Color", "Modify Tire Color", ScriptHook.CurrentScript():CacheMenu(VehicleTireColorMenu))
	menu:AddButton("Window Tint", "Modify Window Tint", ScriptHook.CurrentScript():CacheMenu(VehicleWindowTintMenu))

	-- Update
	menu:OnUpdate(function()
		menu:SetChecked(engineIdx, IsPlayerVehicleEngineRunning())
		menu:SetChecked(explosionIdx, IsPlayerVehicleExplosiveDisabled())
	end)

	return menu
end

-- Vehicle
local function VehicleMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Vehicle")
	
	menu:AddButton("Spawn", "Spawn vehicle", ScriptHook.CurrentScript():CacheMenu(SpawnVehicleMenu))
	
	local localVehicleIdx = menu:AddButton("Local Vehicle", "Control the vehicle you're in", ScriptHook.CurrentScript():CacheMenu(LocalVehicleMenu))

	menu:OnUpdate(function()
		menu:SetEntryEnabled(localVehicleIdx, IsPlayerInVehicle())
	end)

	return menu
end

table.insert(SimpleTrainerMenuItems, { "Vehicle", "Spawn vehicles, modify them ..", ScriptHook.CurrentScript():CacheMenu(VehicleMenu) })
