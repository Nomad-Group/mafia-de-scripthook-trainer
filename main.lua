-- Menu
include("menu/menu.lua")

-- WebUI (Nomad + Changelog)
include("webui.lua")

-- Main
local script = ScriptHook.CurrentScript()
script.Entities = {}

function script:OnLoad()
	print("Script trainer loaded!")

	if self:GetConfigOption("disableNomadWebFrames") ~= true then
		self:CreateWebFrames()
	end
end

function script:OnUpdate()
end

function script:OnRender()
end