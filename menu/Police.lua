-- Player
local function PoliceMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Police")
	
    menu:AddButton("Enable", function()
        game.police:Enable()
    end)
    
    menu:AddButton("Disable", function()
        game.police:Disable()
    end)
    

	return menu
end

table.insert(SimpleTrainerMenuItems, { "Police", "Mess with the police", ScriptHook.CurrentScript():CacheMenu(PoliceMenu) })