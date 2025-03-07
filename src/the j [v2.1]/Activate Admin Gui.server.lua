-- Adds the gui if player is admin

local ListedUserIds = {"74079319"}
local players = game:GetService("Players")

players.PlayerAdded:Connect(function(player)

	if table.find(ListedUserIds, tostring(player.UserId)) then
		local adminGui = game:GetService("ServerStorage").Admin:Clone()
		adminGui.Parent = player.PlayerGui

		print(player.Name.. " is an admin. Giving admin GUI...")
	end

end)