-- Nomad Screen
local webFrame = UI.WebFrame()
webFrame:SetURL("https://mplus-welcome-nomad-group.web.app")
webFrame:SetPosition3D(Math:newVector(-930.65, -204.1, 8.7655172))
webFrame:SetSize3D(Math:newVector(11, 6.4, 1))
webFrame:SetRotation3D(Math:newVector(0, 0, 180))
webFrame:SetSize2D(1280, 720)
webFrame:SetRenderDistance3D(75)

-- Changelog Screen
local webFrame2 = UI.WebFrame()
webFrame2:SetURL("https://mplus-welcome-nomad-group.web.app/changelog_1_2.html")
webFrame2:SetPosition3D(Math:newVector(-926.8, -204.75, 3.45))
webFrame2:SetSize3D(Math:newVector(2.5, 3.4375, 1))
webFrame2:SetRotation3D(Math:newVector(0, 0, 180))
webFrame2:SetSize2D(1600, 1795)
webFrame2:SetRenderDistance3D(25)