local replicatedStorage = game:GetService("ReplicatedStorage")
local scrollingFrame = script.Parent

-- List Tools
for i,v in ipairs(replicatedStorage.Tools:GetChildren()) do
	if v:IsA("Tool") then
		local toolButton = scrollingFrame.toolButton:Clone()
		toolButton.Parent = scrollingFrame
		toolButton.Name = v.Name
		toolButton.Tool.Value = v.Name
		toolButton.Font = Enum.Font.SourceSans
		toolButton.BorderSizePixel = 0
		toolButton.BackgroundTransparency = 0
		toolButton.Text = v.Name
	end
	
	if v:IsA("Folder") then
		local toolFolder = scrollingFrame.toolFolder:Clone()
		toolFolder.Parent = scrollingFrame
		toolFolder.Title.Text = v.Name
		
		for i,folderChildren in ipairs(replicatedStorage.Tools[v.Name]:GetChildren()) do
			local folderButton = toolFolder.toolButton:Clone()
			folderButton.Parent = toolFolder
			folderButton.Name = folderChildren.Name
			
			folderButton.Tool.Value = folderChildren.Name
			folderButton.Folder.Value = v.Name
			
			folderButton.Font = Enum.Font.SourceSans
			folderButton.BorderSizePixel = 0
			folderButton.BackgroundTransparency = 0
			folderButton.Text = folderChildren.Name
		end
		
		toolFolder.toolButton:Destroy()
		toolFolder.CanvasSize = UDim2.new(0,0,0,toolFolder.UIListLayout.AbsoluteContentSize.Y) -- Dynamic scrolling
	end
end

script.Parent.toolButton:Destroy()
script.Parent.toolFolder:Destroy()
scrollingFrame.CanvasSize = UDim2.new(0,0,0,script.Parent.UIListLayout.AbsoluteContentSize.Y) -- Dynamic scrolling