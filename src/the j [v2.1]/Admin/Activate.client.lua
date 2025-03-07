local player = game.Players.LocalPlayer
local mainMenuFrame = player.PlayerGui.Admin.MainMenuFrame
local playerLogFrame = player.PlayerGui.Admin.PlayerLogFrame
local toolGiverFrame = player.PlayerGui.Admin.ToolGiverFrame

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.J then
		if script.Open.Value == 0 then
			script.Open.Value = 1
		end
		
		if script.Open.Value == 2 then
			mainMenuFrame.Visible = false
			playerLogFrame.Visible = false
			toolGiverFrame.Visible = false
			script.Open.Value = 0
		end
		
		if script.Open.Value == 1 then
			mainMenuFrame.Visible = true
			script.Open.Value = 2
		end
    end
end)