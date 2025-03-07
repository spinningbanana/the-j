local player = game:GetService("Players").LocalPlayer
local giveEvent = player.PlayerGui.Admin.ToolGiverFrame.ToolGiver.Give.RemoteEvent

script.Parent.MouseButton1Click:Connect(function()
	giveEvent:FireServer(script.Parent.Tool.Value, script.Parent.Folder.Value)
end)