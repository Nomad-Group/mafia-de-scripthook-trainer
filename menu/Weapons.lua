-- Give Weapons
local function GiveWeapon(menu, text, name)
	ammo_ammount = 500
	active_weapon  = game.game:GetActivePlayer():InventoryGetSelected()
	if active_weapon == "empty" then
		game.game:GetActivePlayer():InventoryAddWeapon(name, ammo_ammount)
		game.game:GetActivePlayer():InventorySelect(name, true)
	else
		game.game:GetActivePlayer():InventoryRemoveWeapon(active_weapon)
		game.game:GetActivePlayer():InventoryAddWeapon(name, ammo_ammount)
		game.game:GetActivePlayer():InventorySelect(name, true)
	end
end

local function GiveWeaponsMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Give Weapon")
	menu:AddSearch("Search", "Start typing to filter")

	for k,v in pairsByKeys(WeaponIDs) do
		menu:AddButton(k, v, GiveWeapon)
	end

	return menu
end

-- Unlimited ammo
local unlimitedAmmo = false
local function ToggleUnlimitedAmmo()
  unlimitedAmmo = not unlimitedAmmo
  game.game:GetActivePlayer():InventorySetUnlimitedAmmo(unlimitedAmmo)
end

-- Weapons
local function WeaponsMenu()
	local menu = UI.SimpleMenu()
  menu:SetTitle("Weapons")

  menu:AddButton("Give weapon", ScriptHook.CurrentScript():CacheMenu(GiveWeaponsMenu))

  menu:AddButton("Give max ammo", "Max ammo to all weapons", function()
    game.game:GetActivePlayer():InventoryLoadWeapons()
  end)

  menu:AddButton("Give grenades", "Give you 2 grenades", function()
    game.game:GetActivePlayer():InventoryAddGrenades(2)
  end)

  menu:AddButton("Toggle unlimited ammo", "Unlimited ammo to all weapons", ToggleUnlimitedAmmo)

	return menu
end

table.insert(SimpleTrainerMenuItems, { "Weapons", "Giving weapons, grenades, ammo...", ScriptHook.CurrentScript():CacheMenu(WeaponsMenu) })