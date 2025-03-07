local DSS = game:GetService("DataStoreService")
local dataStore = DSS:GetDataStore("Player_JoinLeave")

game.Players.PlayerAdded:Connect(function (player)
	
	-- Time
	local date = os.date("!*t")
	local hour = (date.hour) % 24
	local ampm = hour < 12 and "AM" or "PM"

	local currentDate = date.month.. "/".. date.day.. "/".. date.year
	local currentTime = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, ampm)
	
	-- Log message
	local playerLog = player.Name.. " (UserId ".. player.UserId.. ") joined at ".. currentTime.. " UTC , ".. currentDate
	print(playerLog)
	-- Loading and setting table
	local joinLeave
	local success, errormessage = pcall(function()
		joinLeave = dataStore:GetAsync("Log")
		if joinLeave == nil then
			joinLeave = {}
		end

		table.insert(joinLeave, playerLog)
	end)

	-- Saving
	local success, errormessage = pcall(function()
		dataStore:SetAsync("Log", joinLeave)
	end)
	if not success then
		warn("[DATASTORE] SAVING ERROR")
		warn(errormessage)
	end
	
end)

game.Players.PlayerRemoving:Connect(function(player)
	
	-- Time
	local date = os.date("!*t")
	local hour = (date.hour) % 24
	local ampm = hour < 12 and "AM" or "PM"

	local currentDate = date.month.. "/".. date.day.. "/".. date.year
	local currentTime = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, ampm)
	
	-- Log message
	local playerLog = player.Name.. " (UserId ".. player.UserId.. ") left at ".. currentTime.. " UTC, ".. currentDate
	
	-- Loading and setting table
	local joinLeave
	local success, errormessage = pcall(function()
		joinLeave = dataStore:GetAsync("Log")
		if joinLeave == nil then
			joinLeave = {}
		end

		table.insert(joinLeave, playerLog)
	end)

	-- Saving
	local success, errormessage = pcall(function()
		dataStore:SetAsync("Log", joinLeave)
	end)
	if not success then
		warn("[DATASTORE] SAVING ERROR")
		warn(errormessage)
	end
	
end)