-- Weather
local function SetWeather(menu, text, name)
	game.gfx:SetWeatherSet(name, 0, 0);
end

local function SetWeatherMenu()
	local menu = UI.SimpleMenu()
    menu:SetTitle("Set Weather")
	menu:AddSearch("Search", "Start typing to filter")

	for k,v in pairsByKeys(WeatherIDs) do
		menu:AddButton(k, v, SetWeather)
	end

	return menu
end

-- Spawner
local function SetSpawnerStateMenu()
	local menu = UI.SimpleMenu()
    menu:SetTitle("Set Spawner State")

    menu:AddButton("Enable Population", function() 
        game.traffic:SwitchGenerators(true)
        game.traffic:Populate(100)
    end)

    menu:AddButton("Disable Population", function() 
        game.traffic:SwitchGenerators(false)
    end)

	return menu
end

-- Water Visiblity
local function SetWaterVisibilityMenu()
	local menu = UI.SimpleMenu()
    menu:SetTitle("Set Water Visibility")

    menu:AddButton("Visible", function() 
        game.game:SetWaterVisibility(true)
    end)

    menu:AddButton("Hidden", function() 
        game.game:SetWaterVisibility(false)
    end)

	return menu
end

-- HUD
local function EnvironmentMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Environment - World")
	
    menu:AddButton("Set Spawner State", ScriptHook.CurrentScript():CacheMenu(SetSpawnerStateMenu))
    menu:AddButton("Set Weather", ScriptHook.CurrentScript():CacheMenu(SetWeatherMenu))
    menu:AddButton("Set Water Visibility", ScriptHook.CurrentScript():CacheMenu(SetWaterVisibilityMenu))

    
	return menu
end

table.insert(SimpleTrainerMenuItems, { "Environment", "Modify the world", ScriptHook.CurrentScript():CacheMenu(EnvironmentMenu) })