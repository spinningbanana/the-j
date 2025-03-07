local player = game:GetService("Players").LocalPlayer
local toolGiverFrame = player.PlayerGui.Admin.ToolGiverFrame
local mainMenuFrame = player.PlayerGui.Admin.MainMenuFrame

script.Parent.MouseButton1Click:Connect(function()
	toolGiverFrame.Visible = true
	mainMenuFrame.Visible = false
end)