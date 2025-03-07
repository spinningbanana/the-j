local giveEvent = script.RemoteEvent
local toolStorage = game:GetService("ReplicatedStorage").Tools

function give(player, gear, folder)
	if folder then
		local newTool = toolStorage[folder][gear]:Clone()
		newTool.Parent = workspace[player.Name]
	else
		local newTool = toolStorage[gear]:Clone()
		newTool.Parent = workspace[player.Name]
	end
end
giveEvent.OnServerEvent:Connect(give)