-- Store Noclip Speed
local script = ScriptHook.CurrentScript()
local SpeedSettings = {
	normal = 10,
	shift = 40,

	ready = false
}

function script:ReadCameraSpeeds()
	local normal = self:GetConfigOption("noclip.speed.normal")
	if normal then
		SpeedSettings.normal = tonumber(normal)
	end

	local shift = self:GetConfigOption("noclip.speed.shift")
	if shift then
		SpeedSettings.shift = tonumber(shift)
	end

	return SpeedSettings
end

function script:ApplyCameraSpeed(type, speed)
	if not SpeedSettings.ready then
		return
	end
	
	if type and speed then
		SpeedSettings[type] = tonumber(speed)
	end

	ScriptHook.SetNoclipSpeeds(SpeedSettings.normal, SpeedSettings.shift)

	if type and speed then
		self:SetConfigOption("noclip.speed." .. type, tonumber(speed))
	end
end

function script:ApplyCameraSpeeds()
	self:ReadCameraSpeeds()
	self:ApplyCameraSpeed()
end

-- Bind
ScriptHook.RegisterKeyHandler("noclip", function()
	ScriptHook.SetLocalPlayerNoclip(not ScriptHook.HasLocalPlayerNoclip())
end)