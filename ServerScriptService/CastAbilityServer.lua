--[[

	CastAbilityServer
	@author Garantae

	After a player issues a request to use an ability, server handles which ability has been used and what each ability does. The different abilities are given upon player
	contact with the ability crystal.

--]]

--// Variables
local AbilityName
local AbilityTexture
local IsAbilityPresent
local AbilityRecipient
local IsScriptActive = false
local Timer = 0

local function Vanish()
	if workspace:FindFirstChild(AbilityRecipient) then
		script.VanishBehavior:Clone().Parent = workspace:FindFirstChild(AbilityRecipient)
		if workspace:FindFirstChild(AbilityRecipient):FindFirstChild("VanishAbility") then
			workspace:FindFirstChild(AbilityRecipient):FindFirstChild("VanishAbility").Disabled = false
		end
	end
	IsScriptActive = false	
end

local function Sprint()
	if workspace:FindFirstChild(AbilityRecipient) then
		script.SprintBehavior:Clone().Parent = workspace:FindFirstChild(AbilityRecipient)
		if workspace:FindFirstChild(AbilityRecipient):FindFirstChild("SprintAbility") then
			workspace:FindFirstChild(AbilityRecipient):FindFirstChild("SprintAbility").Disabled = false
		end
	end
	IsScriptActive = false
end

local function Freeze()
	if workspace:FindFirstChild(AbilityRecipient) then
		script.FreezeBehavior:Clone().Parent = workspace:FindFirstChild(AbilityRecipient)
		if workspace:FindFirstChild(AbilityRecipient):FindFirstChild("FreezeAbility") then
			workspace:FindFirstChild(AbilityRecipient):FindFirstChild("FreezeAbility").Disabled = false
		end
	end
	IsScriptActive = false
end

game.ReplicatedStorage.CORE_RemoteEvents.AbilityCasted.OnServerEvent:Connect(function(player,AbilityName)
	
	repeat
		Timer = Timer + 0.25
		wait(0.25)
	until IsScriptActive == false or Timer == 3
	
	if IsScriptActive == false and player:FindFirstChild("ReadyStatus") then
		IsScriptActive = true
		AbilityRecipient = player.Name
		Timer = 0
	
		--// All accessible abilities
		if AbilityName == "Vanish" then
			Vanish()
		end
	
		if AbilityName == "Sprint" then
			Sprint()
		end
		
		if AbilityName == "Freeze" then
			Freeze()
		end
	end
	
end)

