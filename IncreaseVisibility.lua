for i,v in ipairs(game.Lighting:GetChildren()) do
	v:Destroy()
end

game.Lighting.Ambient=Color3.fromRGB(70,70,70)
game.Lighting.Brightness=10
game.Lighting.EnvironmentDiffuseScale=.6
game.Lighting.EnvironmentSpecularScale=.2
game.Lighting.GlobalShadows=true
game.Lighting.OutdoorAmbient=Color3.fromRGB(70,70,70)
game.Lighting.ShadowSoftness=.51
game.Lighting.ClockTime=6.3
game.Lighting.ExposureCompensation=.21

local atmosphere = Instance.new("Atmosphere",game.Lighting)
atmosphere.Density=.2
atmosphere.Offset=10
atmosphere.Color=Color3.new(1,1,1)
atmosphere.Decay=Color3.fromRGB(231,148,14)
atmosphere.Glare=.075
atmosphere.Haze=10

local sky = Instance.new("Sky",game.Lighting)
sky.MoonAngularSize=0
sky.SkyboxBk="rbxassetid://6444884337"
sky.SkyboxDn="rbxassetid://6444884785"
sky.SkyboxFt="rbxassetid://6444884337"
sky.SkyboxLf="rbxassetid://6444884337"
sky.SkyboxRt="rbxassetid://6444884337"
sky.SkyboxUp="rbxassetid://6412503613"
sky.StarCount=0
sky.SunAngularSize=15
sky.SunTextureId="rbxassetid://6196665106"

local bloom = Instance.new("BloomEffect",game.Lighting)
bloom.Intensity=1
bloom.Size=21
bloom.Threshold=2

local blur = Instance.new("BlurEffect",game.Lighting)
blur.Size=4

local depthOfField = Instance.new("DepthOfFieldEffect",game.Lighting)
depthOfField.FarIntensity=.1
depthOfField.FocusDistance=.05
depthOfField.InFocusRadius=30
depthOfField.NearIntensity=.75

local sunRays = Instance.new("SunRaysEffect",game.Lighting)
sunRays.Intensity=.3
sunRays.Spread=1
