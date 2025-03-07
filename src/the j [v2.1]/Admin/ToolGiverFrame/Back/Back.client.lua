local player = game:GetService("Players").LocalPlayer
local mainMenuFrame = player.PlayerGui.Admin.MainMenuFrame

script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent.Visible = false
	mainMenuFrame.Visible = true
end)