# Function

* Spawn ability crystals in random spawns over a random range of time.
* Give a random ability to the player that picked up an ability crystal.
* Send information regarding the ability to the client (name, image, etc.)
* Server executes the ability's function upon player request.

SpawnCrystal.lua will check if a game is currently in progress. If it is, then over a random period of time, it will spawn an ability crystal at a random spawn placed around a map. When a player picks this crystal up, they will receive a random ability each designated with their own unique value. This will then send the client information regarding the ability they received, such as the ability name, picture, and the ability to use it (button). When the player decides to use said ability, it will issue a RemoteEvent request to the server where it then carries out the function of the ability.
# Vanish Ability Showcase

https://user-images.githubusercontent.com/91921033/135949989-eb21d0be-2794-4ad5-b1a8-a23de9b899f8.mp4


