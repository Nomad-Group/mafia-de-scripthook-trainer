local script = ScriptHook.CurrentScript()

-- Frame Creation
function script:CreateWebFrames()
	local webFrame = UI.WebFrame()
	webFrame:SetURL("https://mplus-welcome-nomad-group.web.app")
	webFrame:SetPosition3D(Math:newVector(-941.65, -204.1, 15.7655172))
	webFrame:SetSize3D(Math:newVector(11, 6.4, 1))
	webFrame:SetRotation3D(Math:newVector(-90, 0, 0))
	webFrame:SetSize2D(1280, 720)
	webFrame:SetRenderDistance3D(75)

	self.Frame_Welcome = webFrame

	-- Changelog Screen
	local webFrame2 = UI.WebFrame()
	webFrame2:SetURL("https://mplus-welcome-nomad-group.web.app/changelog_1_1.html")
	webFrame2:SetPosition3D(Math:newVector(-928.8, -204.75, 6.45))
	webFrame2:SetSize3D(Math:newVector(2.5, 3.4375, 1))
	webFrame2:SetRotation3D(Math:newVector(-90, 0, 0))
	webFrame2:SetSize2D(1600, 1795)
	webFrame2:SetRenderDistance3D(25)

	self.Frame_Changelog = webFrame2
end

-- Frame Destruction
function script:DestroyWebFrames()
	if self.Frame_Welcome then
		self.Frame_Welcome:Destroy()
		self.Frame_Welcome = nil
	end

	if self.Frame_Changelog then
		self.Frame_Changelog:Destroy()
		self.Frame_Changelog = nil
	end
end

-- Toggle method
function script:ToggleWebFrames()
	if self.Frame_Welcome or self.Frame_Changelog then
		self:DestroyWebFrames()
		self:SetConfigOption("disableNomadWebFrames", true)
	else
		self:CreateWebFrames()
		self:SetConfigOption("disableNomadWebFrames", false)
	end
end