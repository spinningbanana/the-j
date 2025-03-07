local refresh1 = script.Parent.FirstJoins.Refresh
local refresh2 = script.Parent.JoinLeaves.Refresh

while wait(60) do
	script.Parent.Refreshes.Value = 0
	
	refresh1.Text = " Refresh"
	refresh2.Text = " Refresh"
	
	refresh1.BackgroundColor3 = Color3.fromRGB(255, 58, 58)
	refresh2.BackgroundColor3 = Color3.fromRGB(255, 58, 58)
end