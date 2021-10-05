--// Variables
local AbilityReceived = game.ReplicatedStorage.CORE_RemoteEvents.AbilityReceived
local AbilityButton = script.Parent
local IsAbilityPresentValue = AbilityButton.Parent.IsAbilityPresentValue
local AbilityNameValue = AbilityButton.Parent.AbilityNameValue
local AbilityTextureValue = AbilityButton.Parent.AbilityTextureValue
local StatusHeader = game.ReplicatedStorage.CORE_GameValues.StatusHeader



game.ReplicatedStorage.CORE_RemoteEvents.AbilityReceived.OnClientEvent:Connect(function(AbilityName,AbilityTexture,IsAbilityPresent)
	
	if StatusHeader.Value == "GAME IN PROGRESS" then
	
		--// Set the values
		AbilityNameValue.Value = AbilityName
		AbilityTextureValue.Value = AbilityTexture
		IsAbilityPresentValue.Value = IsAbilityPresent
	
		--// Show the name and texture
		AbilityButton.Image = AbilityTexture
		AbilityButton.AbilityName.Text = AbilityName
	
		--// Show the ability button
		AbilityButton.Visible = true
		--[[
		AbilityButton.BackgroundTransparency = 0
		AbilityButton.AbilityName.TextTransparency = 0
		AbilityButton.ButtonKeyText.BackgroundTransparency = 0
		AbilityButton.ButtonKeyText.TextTransparency = 0
		--]]
	
		--// Undisable CastAbility
		script.Parent.CastAbilityClient.Disabled = false
	
	end
	
end)
	
--script.Parent.MouseButton1Click:Connect(onClick) 
