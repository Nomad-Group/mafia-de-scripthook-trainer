local function ToggleHudElement(name, state)
    if name == "Hud" then
        game.hud:Show(state)
    end

    if name == "Radar" then
        game.hud:RadarShow(state)
    end

    if name == "Speedometer" then
        game.hud:SpeedometerShow(state)
    end
end

local function ToggleHudElementMenu(name)
    local menu = UI.SimpleMenu()
    menu:SetTitle("Modify " .. name)
    
    local name = name

    menu:AddButton("Show HUD element", function() 
        ToggleHudElement(name, true)
    end)

    menu:AddButton("Hide HUD element", function() 
        ToggleHudElement(name, false)
    end)

	return menu
end

-- HUD
local function HUDMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("HUD")
	
    menu:AddButton("Toggle All", "Hud", ScriptHook.CurrentScript():CacheMenu(function()
        return ToggleHudElementMenu("Hud")
    end))
    menu:AddButton("Toggle Radar", "Radar", ScriptHook.CurrentScript():CacheMenu(function()
        return ToggleHudElementMenu("Radar")
    end))
    menu:AddButton("Toggle Speedometer", "Speedometer", ScriptHook.CurrentScript():CacheMenu(function()
        return ToggleHudElementMenu("Speedometer")
	end))
	local shScreens = menu:AddCheckbox("ScriptHook Screens", "Welcome & Changelog Screens", function()
		ScriptHook.CurrentScript():ToggleWebFrames()
	end)

	menu:OnUpdate(function()
		menu:SetChecked(shScreens, ScriptHook.CurrentScript():GetConfigOption("disableNomadWebFrames") ~= true)
	end)
    
	return menu
end

table.insert(SimpleTrainerMenuItems, { "HUD", "Modify the HUD displays", ScriptHook.CurrentScript():CacheMenu(HUDMenu) })