-- Menu
include("menu/menu.lua")
include("menu/webui.lua")

local script = ScriptHook.CurrentScript()
script.Entities = {}

function script:OnLoad()
	print("Script trainer loaded!")
end

function script:OnUpdate()
end

function script:OnRender()
end