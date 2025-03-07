local DSS = game:GetService("DataStoreService")
local dataStore = DSS:GetDataStore("Player_Log")

local logEvent = script.Parent:WaitForChild("Player First Join").Log

logEvent.Event:Connect(function (player)
	
	-- Time and log message
	local date = os.date("!*t")
	local currentDate = date.month.. "/".. date.day.. "/".. date.year
	
	local playerLog = player.Name.. " (UserId ".. player.UserId.. ") first joined on ".. currentDate
	
	-- Loading and setting table
	local data
	local success, errormessage = pcall(function()
		data = dataStore:GetAsync("Log")
		if data == nil then
			data = {}
		end

		table.insert(data, playerLog)
	end)
	
	-- Saving
	local success, errormessage = pcall(function()
		dataStore:SetAsync("Log", data)
	end)
	if not success then
		warn("[DATASTORE] SAVING ERROR")
		warn(errormessage)
	end
end)