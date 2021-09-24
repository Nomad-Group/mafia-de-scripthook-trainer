-- Menu
include("menu/menu.lua")

-- Settings
include("settings/noclip.lua")

-- WebUI (Nomad + Changelog)
include("webui.lua")

-- Main
local script = ScriptHook.CurrentScript()
script.Entities = {}

function script:OnLoad()
	print("Script trainer loaded!")
	self:ApplyCameraSpeeds()

	if self:GetConfigOption("disableNomadWebFrames") ~= true then
		self:CreateWebFrames()
	end
end