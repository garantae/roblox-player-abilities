--[[

	CastAbilityClient
	@author Garantae

	Issue a request to the server to use an ability.

--]]

--// Variables
local AbilityReceived = game.ReplicatedStorage.CORE_RemoteEvents.AbilityReceived
local AbilityButton = script.Parent
local IsAbilityPresentValue = AbilityButton.Parent.IsAbilityPresentValue
local AbilityNameValue = AbilityButton.Parent.AbilityNameValue
local AbilityTextureValue = AbilityButton.Parent.AbilityTextureValue 
local ClickSound = script.ClickSound

function onClick()
	
	--// Unshow the button
	AbilityButton.Visible = false
	
	ClickSound:Play()
	
	--// Send only if there is an ability
	if AbilityNameValue.Value ~= "" then
		game.ReplicatedStorage.CORE_RemoteEvents.AbilityCasted:FireServer(AbilityNameValue.Value)
		script.Disabled = true
	end
end

function onTap(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.Q then
		
		--// Unshow the button
		AbilityButton.Visible = false

		ClickSound:Play()
		
		--// Send only if there is an ability
		if AbilityNameValue.Value ~= "" then
			game.ReplicatedStorage.CORE_RemoteEvents.AbilityCasted:FireServer(AbilityNameValue.Value)
			script.Disabled = true
		end
	end
end

	
script.Parent.MouseButton1Click:Connect(onClick)
game:GetService("UserInputService").InputBegan:Connect(onTap)
