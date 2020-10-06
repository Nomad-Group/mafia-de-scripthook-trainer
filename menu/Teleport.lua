-- Teleport
local function TeleportMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Teleport")
    
    menu:AddButton("Print position to console", function()
        local obj = game.game:GetActivePlayer()
        
        if obj == nil then
            return false
        end

        if (obj:GetOwner() ~= nil) then
            obj = obj:GetOwner()
        end

        local pos = obj:GetPos()
        print("Math:newVector(" .. tostring(pos.x) .. ", " .. tostring(pos.y) .. ", " .. tostring(pos.z) .. ")")
    end)
    
	for _,v in pairs(TeleportSpots) do
		local name, pos = unpack(v)

		menu:AddButton(name, function(menu, text, hint, index) 
            local obj = game.game:GetActivePlayer()
        
            if obj == nil then
                return false
            end

            if (obj:GetOwner() ~= nil) then
                obj = obj:GetOwner()
            end

            obj:SetPos(pos)
		end)
    end
    
	return menu
end

table.insert(SimpleTrainerMenuItems, { "Teleport", "Teleport to anywhere within the world", ScriptHook.CurrentScript():CacheMenu(TeleportMenu) })