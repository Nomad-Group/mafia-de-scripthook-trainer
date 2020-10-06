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

-- Spawn Vehicle
local function SpawnVehicle(menu, text, name)
    package.loaded.common.base.game_structure_console.carpls(name)
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

local function LocalVehicleMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Local Vehicle")

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

	menu:AddButton("Parts", "Modify Parts", ScriptHook.CurrentScript():CacheMenu(VehiclePartsMenu))
	menu:AddButton("Color", "Modify Color", ScriptHook.CurrentScript():CacheMenu(VehicleColorMenu))
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