--[[

	ReceiveAbility
	@author Garantae

	If the player touches the ability crystal, give a random ability.

--]]

--// Variables
local player
local AbilityName
local AbilityTexture
local IsAbilityPresent
local DoesCrystalExist = game.ReplicatedStorage.CORE_GameValues.DoesCrystalExist
local PickUpSound = script.Parent.PickUpSound
local IsScriptActive = false -- debounce

script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") ~= nil and hit.Parent:FindFirstChild("Humanoid").Health > 0 then
		if IsScriptActive == false then
			
			IsScriptActive = true
			player = game.Players:FindFirstChild(hit.Parent.Name)
		
			math.randomseed(tick())
			math.random()
		
			local range = math.random(1, 3)
		
			if range == 1 then
				AbilityName = "Vanish"
				AbilityTexture = "rbxassetid://5641262824"
				IsAbilityPresent = true
			end
			
			if range == 2 then
				AbilityName = "Sprint"
				AbilityTexture = "rbxassetid://5641263270"
				IsAbilityPresent = true
			end
			
			if range == 3 then
				AbilityName = "Freeze"
				AbilityTexture = "rbxassetid://5652505693"
				IsAbilityPresent = true
			end
		
			game.ReplicatedStorage.CORE_RemoteEvents.AbilityReceived:FireClient(player,AbilityName,AbilityTexture,IsAbilityPresent)
		
			--// Make the shard invisible
			script.Parent.Transparency = 1
			script.Parent.Sparkles:Destroy()
			PickUpSound:Play()
		
			repeat wait() until PickUpSound.IsPlaying == false
		
			DoesCrystalExist.Value = false
			script.Parent.Parent:Destroy()
		end
	end
end)
