local player = script.Parent.Name
local PlayerService = game:GetService("Players")
local AbilityRecipient = PlayerService:FindFirstChild(player)
local TrailName
local TrailRate
local PlayerWithBomb = game.ReplicatedStorage.CORE_GameValues.PlayerWithBomb
local IceBlock = game.ServerStorage.CORE_GameModels.IceBlock
local PlayerToBeFrozen
local FreezeSFX = script.FreezeSFX

local function Freeze()
	
	--// Check if the user is not a bomber
	if PlayerWithBomb.Value ~= AbilityRecipient.Name then
		
		--// Record the name
		PlayerToBeFrozen = PlayerWithBomb.Value
		
		--// Freeze the bomber
		if workspace:FindFirstChild(PlayerToBeFrozen) then
			if workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("Humanoid") then
				if workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("Humanoid").Health > 0 then
					
					--// Play the Freeze SFX
					FreezeSFX:Clone().Parent = workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("HumanoidRootPart")
					if workspace:FindFirstChild(PlayerToBeFrozen) then
						if workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("HumanoidRootPart") then
							if workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX") then
								workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX"):Play()
							end
						end
					end
					
					workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("Humanoid").WalkSpeed = 0 
					workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("Humanoid").JumpPower = 0 -- Default: 50
					
					--// Clone the ice
					IceBlock:Clone().Parent = workspace:FindFirstChild(PlayerToBeFrozen)
					if workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("IceBlock") then
						workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("IceBlock").CFrame = workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("HumanoidRootPart").CFrame
					end
					
					wait(1.2)
					
					--// Remove the SFX
					if workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("HumanoidRootPart") then
						if workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX") then
							workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX"):Destroy()
						end
					end
					
					--// Delete the ice
					if workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("IceBlock") then
						workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("IceBlock"):Destroy()
					end
					
					--// Check if player is still the bomber
					if PlayerToBeFrozen == PlayerWithBomb.Value then
						workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("Humanoid").WalkSpeed = 20 
						workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("Humanoid").JumpPower = 50
					else
						workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("Humanoid").WalkSpeed = 16 
						workspace:FindFirstChild(PlayerToBeFrozen):FindFirstChild("Humanoid").JumpPower = 50
					end
				end
			end
		end
		
	else
		--// Freeze all players
		for _, PlayersInGame in pairs(game.Players:GetPlayers()) do
			if PlayersInGame then
				if PlayersInGame:FindFirstChild("ReadyStatus") then
					if PlayersInGame.Name ~= AbilityRecipient.Name then
						if workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("Humanoid") then
							if workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("Humanoid").Health > 0 then
								
								--// Play the Freeze SFX
								FreezeSFX:Clone().Parent = workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("HumanoidRootPart")
								if workspace:FindFirstChild(PlayersInGame.Name) then
									if workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("HumanoidRootPart") then
										if workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX") then
											workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX"):Play()
										end
									end
								end
								
								workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("Humanoid").WalkSpeed = 0
								workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("Humanoid").JumpPower = 0
								
								IceBlock:Clone().Parent = workspace:FindFirstChild(PlayersInGame.Name)
								if workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("IceBlock") then
									workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("IceBlock").CFrame = workspace:FindFirstChild(PlayersInGame.Name):FindFirstChild("HumanoidRootPart").CFrame
								end
							end
						end
						
						
						
					end
				end
			end	
		end
		
		wait(1.2)
		
		--// Unfreeze all players
		for _, PlayersFrozen in pairs(game.Players:GetPlayers()) do
			if PlayersFrozen then
				if PlayersFrozen:FindFirstChild("ReadyStatus") then
					if PlayersFrozen.Name ~= AbilityRecipient.Name then
						
						if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid") then
							if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").Health > 0 then
								
								--// Remove the SFX
								if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("HumanoidRootPart") then
									if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX") then
										workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX"):Destroy()
									end
								end
								
								if PlayersFrozen.Name == PlayerWithBomb.Value then
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").WalkSpeed = 20
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").JumpPower = 50
								else
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").WalkSpeed = 16
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").JumpPower = 50
								end
								
								if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("IceBlock") then
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("IceBlock"):Destroy()
								end
								
							end
						end
						
					end
				end
			end
		end
		
	end
	
	script:Destroy()
end

Freeze()

game.Players.PlayerRemoving:Connect(function(PlayerThatLeft)
	if PlayerThatLeft.Name == AbilityRecipient.Name then
		
		for _, PlayersFrozen in pairs(game.Players:GetPlayers()) do
			if PlayersFrozen then
				if PlayersFrozen:FindFirstChild("ReadyStatus") then
					if PlayersFrozen.Name ~= AbilityRecipient.Name then
						
						if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid") then
							if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").Health > 0 then
								
								--// Remove the SFX
								if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("HumanoidRootPart") then
									if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX") then
										workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("HumanoidRootPart"):FindFirstChild("FreezeSFX"):Destroy()
									end
								end
								
								if PlayersFrozen.Name == PlayerWithBomb.Value then
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").WalkSpeed = 20
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").JumpPower = 50
								else
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").WalkSpeed = 16
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("Humanoid").JumpPower = 50
								end
								
								if workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("IceBlock") then
									workspace:FindFirstChild(PlayersFrozen.Name):FindFirstChild("IceBlock"):Destroy()
								end
								
							end
						end
						
					end
				end
			end
		end
		
		
	end
end)
