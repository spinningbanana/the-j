local DSS = game:GetService("DataStoreService")

local scrollingFrame = script.Parent
local refreshButton = scrollingFrame.Refresh

-- ===============================================================
-- DATA ADDING
-- ===============================================================

-- Load
local joinLeave
local success, errormessage = pcall(function()
	local dataStore = DSS:GetDataStore("Player_JoinLeaveTEST")
	joinLeave = dataStore:GetAsync("Log", joinLeave)
	if joinLeave == nil then
		joinLeave = {}
	end
end)

for i,v in pairs(joinLeave) do
    if v then
		local logText = scrollingFrame.logText:Clone()
		logText.Parent = scrollingFrame
		logText.Name = "logTextClone"
		logText.Font = Enum.Font.SourceSans
		logText.BorderSizePixel = 0
		logText.BackgroundTransparency = 1
		logText.Text = v
	end
end

scrollingFrame.CanvasSize = UDim2.new(0,0,0,script.Parent.UIListLayout.AbsoluteContentSize.Y) -- Dynamic scrolling

-- ===============================================================
-- REFRESHING
-- ===============================================================

refreshButton.MouseButton1Click:Connect(function()
	
	-- Max 15 refreshes a minute because of datastore limits
	if script.Parent.Parent.Refreshes.Value < 16 then
		for i,v in pairs(scrollingFrame:GetDescendants()) do
			if v.Name == "logTextClone" then
				v:Destroy()
			end
		end

		-- Load
		local joinLeave
		local success, errormessage = pcall(function()
			local dataStore = DSS:GetDataStore("Player_JoinLeaveTEST")
			joinLeave = dataStore:GetAsync("Log", joinLeave)
			if joinLeave == nil then
				joinLeave = {}
			end
		end)

		wait(0.1)

		for i,v in pairs(joinLeave) do
			if v then
				local logText = scrollingFrame.logText:Clone()
				logText.Parent = scrollingFrame
				logText.Name = "logTextClone"
				logText.Font = Enum.Font.SourceSans
				logText.BorderSizePixel = 0
				logText.BackgroundTransparency = 1
				logText.Text = v
			end
		end

		scrollingFrame.CanvasSize = UDim2.new(0,0,0,script.Parent.UIListLayout.AbsoluteContentSize.Y) -- Dynamic scrolling
		script.Parent.Parent.Refreshes.Value = script.Parent.Parent.Refreshes.Value + 1
	end
	
	if script.Parent.Parent.Refreshes.Value == 16 then
		script.Parent.Refresh.Text = " Slow down!"
		script.Parent.Refresh.BackgroundColor3 = Color3.new(0.568627, 0.568627, 0.568627)
		
		script.Parent.Parent.FirstJoins.Refresh.Text = " Slow down!"
		script.Parent.Parent.FirstJoins.Refresh.BackgroundColor3 = Color3.new(0.568627, 0.568627, 0.568627)
	end
end)