local player = script.Parent.Name
local PlayerService = game:GetService("Players")
local AbilityRecipient = PlayerService:FindFirstChild(player)
local PlayerWithBomb = game.ReplicatedStorage.CORE_GameValues.PlayerWithBomb

local function Sprint()
	
	--// Play SprintSFX
	if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart") then
		script.SprintSFX:Clone().Parent = AbilityRecipient.Character:FindFirstChild("HumanoidRootPart")
		
		if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("SprintSFX") then
			AbilityRecipient.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("SprintSFX"):Play()
		end
		
	end
	
	if AbilityRecipient.Character:FindFirstChild("Humanoid") then
		AbilityRecipient.Character:FindFirstChild("Humanoid").WalkSpeed = AbilityRecipient.Character:FindFirstChild("Humanoid").WalkSpeed + 7
	end
	
	wait(2)
	
	if AbilityRecipient.Character:FindFirstChild("Humanoid") then
		AbilityRecipient.Character:FindFirstChild("Humanoid").WalkSpeed = AbilityRecipient.Character:FindFirstChild("Humanoid").WalkSpeed - 7
	end
	
	--// Delete SprintSFX
	if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart") then
		script.SprintSFX:Clone().Parent = AbilityRecipient.Character:FindFirstChild("HumanoidRootPart")
		
		if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("SprintSFX") then
			AbilityRecipient.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("SprintSFX"):Destroy()
		end
		
	end	
	
	script:Destroy()
end

Sprint()
