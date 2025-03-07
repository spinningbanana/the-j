local DSS = game:GetService("DataStoreService")
local dataStore = DSS:GetDataStore("Player_Join")

local logEvent = script.Log

game.Players.PlayerAdded:Connect(function (player)
	
	local playerUserId = "Player_".. player.UserId
	
	local firstJoin = Instance.new('IntValue', player)
	firstJoin.Name = "FirstJoin"
	
	-- Load Data
	local data
	local success, errormessage = pcall(function()
		data = dataStore:GetAsync(playerUserId)
	end)
	
	if success then
		firstJoin.Value = data
		
		-- NOT FIRST JOIN
		if firstJoin.Value == 1 then
			print(playerUserId.. " (".. player.Name.. ") has joined before.")
		end

		-- FIRST JOIN
		if firstJoin.Value ~= 1 then
			firstJoin.Value = 1
			logEvent:Fire(player)

			-- Save Data
			data = player.FirstJoin.Value
			local success, errormessage = pcall(function()
				dataStore:SetAsync(playerUserId, data)
			end)

			if success then
				print(player.Name.. "(UserId ".. player.UserId.. ") join data saved")
			end
		end
	else
		warn("[DATASTORE] SAVING ERROR")
		warn(errormessage)
	end
	
end)