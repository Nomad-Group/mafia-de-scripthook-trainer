-- God
local function PlayerHasGod()
    local player = game.game:GetActivePlayer()

    if player ~= nil then
        return player.invulnerability
    end

    return false
end

local function PlayerSetGod(on)
	local player = game.game:GetActivePlayer()

	if on then
        player:SetDemigod(true)
        player:EnableInjury(false)
        player.invulnerability = true
	else
		player:SetDemigod(false)
        player:EnableInjury(true)
        player.invulnerability = false
	end
end


-- Player Model
local function ChangeModel(menu, text, name)
    local player = game.game:GetActivePlayer()

    if player == nil then
        return false
    end

    player:SwitchDefaultPlayerSpawnProfile(name)
end

local function ChangeModelMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Change Model")
	menu:AddSearch("Search", "Start typing to filter")

	for k,v in pairsByKeys(PlayerModelIDs) do
		menu:AddButton(k, v, ChangeModel)
	end

	return menu
end

-- Player Model Visiblity
local function ToggleModelVisibilityMenu()
	local menu = UI.SimpleMenu()
    menu:SetTitle("Change Model Visibility")

    menu:AddButton("Set Visible", function()
        local player = game.game:GetActivePlayer()

        if player then
            player:ShowModel(true)
        end
    end)

    menu:AddButton("Set Hidden", function()
        local player = game.game:GetActivePlayer()

        if player then
            player:ShowModel(false)
        end
    end)

	return menu
end

-- Player Physics Visiblity
local function TogglePhysicsMenu()
	local menu = UI.SimpleMenu()
    menu:SetTitle("Change Model Physics")

    menu:AddButton("Set Dynamic", function()
        local player = game.game:GetActivePlayer()

        if player then
            player:SetPhysState(enums.PhysicsState.DYNAMIC)
        end
    end)

    menu:AddButton("Set Disabled", function()
        local player = game.game:GetActivePlayer()

        if player then
            player:SetPhysState(enums.PhysicsState.DISABLED)
        end
    end)

	return menu
end

-- Player
local function PlayerMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Player")

	-- Items
	local godIdx = menu:AddCheckbox("God Mode", "Toggle invincibility", function()
		PlayerSetGod(not PlayerHasGod())
	end)

	local noclipIdx = menu:AddCheckbox("No Clip", "Fly like a bird", function()
		ScriptHook.SetLocalPlayerNoclip(not ScriptHook.HasLocalPlayerNoclip())
	end)

	menu:AddButton("Change Model", ScriptHook.CurrentScript():CacheMenu(ChangeModelMenu))
	menu:AddButton("Toggle Model Visibility", ScriptHook.CurrentScript():CacheMenu(ToggleModelVisibilityMenu))
	menu:AddButton("Toggle Physics", ScriptHook.CurrentScript():CacheMenu(TogglePhysicsMenu))

	-- Update
	menu:OnUpdate(function()
		menu:SetChecked(godIdx, PlayerHasGod())
		menu:SetChecked(noclipIdx, ScriptHook.HasLocalPlayerNoclip())
	end)

	return menu
end

table.insert(SimpleTrainerMenuItems, { "Player", "Change clothes, Set god mode", ScriptHook.CurrentScript():CacheMenu(PlayerMenu) })