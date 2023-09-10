local Players = game:GetService("Players")
local BASE_HEIGHT 		= 58
local CHUNK_SCALE 		= 3
local RENDER_DISTANCE 	= 200 --in studs
local X_SCALE 			= 90
local Z_SCALE 			= 90
local GENERATION_SEED	=  math.random()
print("Your seed is: "..tostring(GENERATION_SEED))
local TERRAIN_TYPE = Enum.Material.Grass 
local chunks = {}
local function chunkExists(chunkX, chunkZ)
	if not chunks[chunkX] then
		chunks[chunkX] = {}
	end
	return chunks[chunkX][chunkZ]
end
local function mountLayer(x, heightY, z, material)
	local beginY = -BASE_HEIGHT
	local endY = heightY
	local cframe = CFrame.new(x * 4 + 2, (beginY + endY) * 4 / 2, z * 4 + 2)
	local size = Vector3.new(4, (endY - beginY) * 4, 4)
	workspace.Terrain:FillBlock(cframe, size, material)	
end
function makeChunk(chunkX, chunkZ)
	local rootPosition = Vector3.new(chunkX * CHUNK_SCALE, 0, chunkZ * CHUNK_SCALE)
	chunks[chunkX][chunkZ] = true
	for x = 0, CHUNK_SCALE - 1 do
		for z = 0, CHUNK_SCALE - 1 do
			local cx = (chunkX * CHUNK_SCALE) + x
			local cz = (chunkZ * CHUNK_SCALE) + z
			local noise = math.noise(GENERATION_SEED, cx / X_SCALE, cz / Z_SCALE)
			local cy = noise * BASE_HEIGHT
			mountLayer(cx, cy, cz, TERRAIN_TYPE)
		end
	end
end
function checkSurroundings(location)
	local chunkX, chunkZ = math.floor(location.X / 4 / CHUNK_SCALE), math.floor(location.Z / 4 / CHUNK_SCALE)
	local range = math.max(1, RENDER_DISTANCE / CHUNK_SCALE)
	for x = -range, range do
		for z = -range, range do
			local cx = chunkX + x
			local cz = chunkZ + z
			if not chunkExists(cx, cz) then
				makeChunk(cx, cz)
			end
		end
	end
end
while true do
	for _, player in pairs(Players:GetPlayers()) do
		if player.Character then
			local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				checkSurroundings(humanoidRootPart.Position)
			end
		end
	end
	wait(1)
end
