--[[ 

	SpawnCrystal
	@author Garantae
	
	Spawns Ability Crystals in random areas which give a random ability to the first player who picks it up. This script will allow the crystal to
	spawn in a set (or random) amount of time if there are none available to be grabbed.
	
--]]

--// General Variables
local DoesCrystalExist = game.ReplicatedStorage.CORE_GameValues.DoesCrystalExist
local StatusHeader = game.ReplicatedStorage.CORE_GameValues.StatusHeader
local ChosenMap = game.ReplicatedStorage.CORE_GameValues.ChosenMap

--// Crystal Variables
local AbilityCrystal = game.ServerStorage.CORE_GameModels.AbilityCrystal

while true do

	wait(5)

	if DoesCrystalExist.Value == false and not workspace:FindFirstChild("AbilityCrystal") then
		if workspace.CurrentMap:FindFirstChild(ChosenMap.Value) then
			
			local CrystalSpawns = workspace.CurrentMap:FindFirstChild(ChosenMap.Value):FindFirstChild("CrystalSpawns"):GetChildren()
			local RandomCrystalSpawn = CrystalSpawns[math.random(1,#CrystalSpawns)]
		
			DoesCrystalExist.Value = true
			AbilityCrystal:Clone().Parent = workspace
			
			wait(0.5)
			
			if workspace:FindFirstChild("AbilityCrystal") then
				workspace:FindFirstChild("AbilityCrystal"):MoveTo(RandomCrystalSpawn.Position)
			end
		end
	else
		repeat wait(1) until DoesCrystalExist.Value == false and not workspace:FindFirstChild("AbilityCrystal")
	end
	
	
end


--[[
game.Players.PlayerAdded:Connect(function()
	AbilityCrystal:Clone().Parent = workspace
	
	workspace:FindFirstChild("AbilityCrystal"):MoveTo(SpawnCrystal.Position)
end)
--]]
