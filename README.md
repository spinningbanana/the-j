# The J
Simple player logger and tool giver admin panel for roblox, ported from a .rbxm file to github using rbxlx-to-rojo

# How to add to your game
Get this model from the marketplace: https://create.roblox.com/store/asset/10151436556/the-j-v21

Once added to your game, there should be a folder named "the j [v2.1]", inside you will find each component
- Please put the "Data" folder into ServerScriptService
- Please put the "Activate Admin Gui" script into ServerScriptService
- Please put the "Admin" SurfaceGui into ServerStorage
- In-game, press "J" to open the UI. This only works for users deemed admin--add your userId to "Activate Admin Gui.server.lua"

# Documentation
Taken straight from the DOCUMENTATION.server.lua in PlayerLogFrame and ToolGiverFrame:

<b>PlayerLogFrame</b> <br>
This uses the Roblox datastores to log the following: <br>
&nbsp;&nbsp;&nbsp;&nbsp;- The first time a player has joined <br>
&nbsp;&nbsp;&nbsp;&nbsp;- Every time a player joins/leaves (time is in UTC) <br>
This also tells the game whether or not a player has joined the game before.

<b>ToolGiverFrame</b> <br>
This pulls tools from ReplicatedStorage/Tools (make your own folder) <br>
If you put a folder in the ReplicatedStorage/Tools, and tools inside, it will group the items inside the UI