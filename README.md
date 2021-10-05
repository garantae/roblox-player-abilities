# About

 If a game is in progress, an ability crystal will spawn at random spawn indicators placed around the map over a random period of time (SpawnCrystal.lua). When a player makes contact with the crystal, they will receive a random ability, generated through a random selection of values that is attached to corresponding abilities (ReceiveAbility.lua). After, the client will then be sent all of the received ability's data, such as its name and image (ReceiveAbilityClient.lua). When the player feels ready to use said ability, they are able to interact with the ability button that will issue a RemoveEvent request to the server (CastAbilityClient.lua) which will be where the server carries out the ability's function (CastAbilityServer.lua)

# Function

* Spawn ability crystals in random spawns over a random range of time.
* Give a random ability to the player that picked up an ability crystal.
* Send information regarding the ability to the client (name, image, etc.)
* Server executes the ability's function upon player request.

# Vanish Ability Showcase

https://user-images.githubusercontent.com/91921033/135949989-eb21d0be-2794-4ad5-b1a8-a23de9b899f8.mp4


