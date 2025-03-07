local player = game:GetService("Players").LocalPlayer
local playerLogFrame = player.PlayerGui.Admin.PlayerLogFrame
local mainMenuFrame = player.PlayerGui.Admin.MainMenuFrame

script.Parent.MouseButton1Click:Connect(function()
	playerLogFrame.Visible = true
	mainMenuFrame.Visible = false
end)