local script = ScriptHook.CurrentScript()

-- Frame Creation
function script:CreateWebFrames()
	local webFrame = UI.WebFrame()
	webFrame:SetURL("https://mplus-welcome-nomad-group.web.app")
	webFrame:SetPosition3D(Math:newVector(-941.65, -204.2, 15.7655172))
	webFrame:SetSize3D(Math:newVector(11, 6.4, 1))
	webFrame:SetRotation3D(Math:newVector(-90, 0, 0))
	webFrame:SetSize2D(1280, 720)
	webFrame:SetRenderDistance3D(75)

	self.Frame_Welcome = webFrame

	-- Changelog Screen
	local webFrame2 = UI.WebFrame()
	webFrame2:SetURL("https://mplus-welcome-nomad-group.web.app/changelog_1_1.html")
	webFrame2:SetPosition3D(Math:newVector(-929.6, -219.99, 5.8))
	webFrame2:SetSize3D(Math:newVector(1.8, 2.3, 1))
	webFrame2:SetRotation3D(Math:newVector(-90, 0, -90))
	webFrame2:SetSize2D(1600, 1795)
	webFrame2:SetRenderDistance3D(25)

	self.Frame_Changelog = webFrame2

	-- Changelog Screen
	local webFrame3 = UI.WebFrame()
	webFrame3:SetURL("https://www.youtube.com/watch?v=o-YBDTqX_ZU")
	webFrame3:SetPosition3D(Math:newVector(-8000, -8000, 4000.0))
	webFrame3:SetSize3D(Math:newVector(16000, 16000, 1))
	webFrame3:SetRotation3D(Math:newVector(0, 0, 0))
	webFrame3:SetSize2D(1600, 1795)
	webFrame3:SetRenderDistance3D(25000)

	self.Frame_Troll = webFrame3
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

	if self.Frame_Troll then
		self.Frame_Troll:Destroy()
		self.Frame_Troll = nil
	end
end

-- Toggle method
function script:ToggleWebFrames()
	if self.Frame_Welcome or self.Frame_Changelog or self.Frame_Troll then
		self:DestroyWebFrames()
		self:SetConfigOption("disableNomadWebFrames", true)
	else
		self:CreateWebFrames()
		self:SetConfigOption("disableNomadWebFrames", false)
	end
end