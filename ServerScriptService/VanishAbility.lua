local player = script.Parent.Name
local PlayerService = game:GetService("Players")
local AbilityRecipient = PlayerService:FindFirstChild(player)
local TrailName
local TrailRate

local function Vanish()
	
	local SmokeBomb = script.SmokeBomb
	SmokeBomb:Clone().Parent = AbilityRecipient.Character.HumanoidRootPart
	
	--// Play VanishSFX
	if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart") then
		script.VanishSFX:Clone().Parent = AbilityRecipient.Character:FindFirstChild("HumanoidRootPart")
		
		if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("VanishSFX") then
			AbilityRecipient.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("VanishSFX"):Play()
		end
		
	end
	
	--// Disappear
	for _, item in pairs (AbilityRecipient.Character:GetChildren()) do
		if item:IsA("Part") or item:IsA("MeshPart") then
			item.Transparency = 1
		elseif item:IsA("Accessory") then
			for _, accessoryPart in pairs (item:GetChildren()) do
				if accessoryPart:IsA("Part") or accessoryPart:IsA("MeshPart") then
					accessoryPart.Transparency = 1
				end
			end
		end
		
	end
	
	--// Hide face
	if AbilityRecipient.Character:FindFirstChild("Head") then
		if AbilityRecipient.Character:FindFirstChild("Head"):FindFirstChild("face") then
			AbilityRecipient.Character:FindFirstChild("Head"):FindFirstChild("face").Transparency = 1
		end
	end
	
	wait(0.5)
	
	--// Hide SmokeBomb
	if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart") then
		if AbilityRecipient.Character.HumanoidRootPart:FindFirstChild("SmokeBomb") then
			AbilityRecipient.Character.HumanoidRootPart:FindFirstChild("SmokeBomb").Rate = 0
		end
	end
	
	--// Hide trail
	if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart") then
		for _, item in pairs (AbilityRecipient.Character.HumanoidRootPart:GetChildren()) do
			if item:IsA("ParticleEmitter") then
				if item.Rate ~= 0 then
					TrailRate = item.Rate
					TrailName = item.Name
				end	
				item.Rate = 0
			end
		end
	end
	
	wait(2)
	
	if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart") then
		--// Destroy VanishSFX
		if AbilityRecipient.Character.HumanoidRootPart:FindFirstChild("VanishSFX") then
			AbilityRecipient.Character.HumanoidRootPart:FindFirstChild("VanishSFX"):Destroy()
		end
		--// Destroy SmokeBomb
		if AbilityRecipient.Character.HumanoidRootPart:FindFirstChild("SmokeBomb") then
			AbilityRecipient.Character.HumanoidRootPart:FindFirstChild("SmokeBomb"):Destroy()
		end
	end
	
	--// Reappear
	for _, item in pairs (AbilityRecipient.Character:GetChildren()) do
		if item:IsA("Part") or item:IsA("MeshPart") then
			if item.Name ~= "HumanoidRootPart" then
				item.Transparency = 0
			end
		elseif item:IsA("Accessory") then
			for _, accessoryPart in pairs (item:GetChildren()) do
				if accessoryPart:IsA("Part") or accessoryPart:IsA("MeshPart") then
					accessoryPart.Transparency = 0
				end
			end
		end
		
	end
	
	--// Show face
	if AbilityRecipient.Character:FindFirstChild("Head") then
		if AbilityRecipient.Character:FindFirstChild("Head"):FindFirstChild("face") then
			AbilityRecipient.Character:FindFirstChild("Head"):FindFirstChild("face").Transparency = 0
		end
	end
	
	--// Show trail
	if AbilityRecipient.Character:FindFirstChild("HumanoidRootPart") then
		for _, item in pairs (AbilityRecipient.Character.HumanoidRootPart:GetChildren()) do
			if item:IsA("ParticleEmitter") then
				if item.Name == TrailName then
					item.Rate = TrailRate
				end	
			end
		end
	end
	
	script:Destroy()	
end

Vanish()
