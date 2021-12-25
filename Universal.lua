
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/iCalux/UILibarys/main/YoungStarSource.lua"))();

--Other tings
local client = game.Players.LocalPlayer
local char = client.Character


--AimBot Thingss
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false
local Locked = false
local Victim
--inf 
local noclip = false
local infjumpenabled = false

game:GetService("RunService").RenderStepped:Connect(function()
    if noclip == true then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjumpenabled then
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)



--Tabs


local MainWindow = library:CreateWindow("iCalux Hub (Public)");
local PlayerWindow = library:CreateWindow("Player");
local ESPWindow = library:CreateWindow("ESP");
local AimbotWindow = library:CreateWindow("Aimbot");
local ExtraWindow = library:CreateWindow("Extra");





--[[

MainWindow:Slider("Example Slider",16,100,true,function(X)
  if X then
      print(X)
  end
end);

MainWindow:Box("Example Box",function(examplebox)
  if examplebox then
      print(examplebox)
  end;
end);

MainWindow:Toggle("ExampleToggle",function(E)
 
end);

spawn(function()
  while wait() do
      if ToggleExample then
          local Cool = 0
          repeat wait()
          Cool = Cool + 1
          print("YoungStar = Cool")
          until Cool == 10
          break
      end;
  end;
end);
]]--
------------------------------------------------------------------------------
--Player--
PlayerWindow:Toggle("NoClip",function(Value)
noclip = Value
end)

PlayerWindow:Toggle("Infinite Jump",function(Value)
infjumpenabled = Value
end)

PlayerWindow:Button("Force Reset Character",function()
local playerrr = game.Players.LocalPlayer
local nameofplayerrr = player.Character.Name
print(nameofplayerrr)
game.Workspace[nameofplayerrr].Humanoid.Health = 0
warn("Player Reset!")
end);
  
PlayerWindow:Slider("WalkSpeed",16,250,true, function(Value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

PlayerWindow:Slider("Jump Power",50,250,true, function(Value)
	game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
end)

PlayerWindow:Slider("Gravity",160,500,true, function(Value)
    workspace.Gravity = Value
end)

PlayerWindow:Slider("FOV",70,120,true, function(Value)
local amount = fovamount
game:GetService'Workspace'.Camera.FieldOfView = Value
end)

-----------------------------------------------------------------------------------
---------------------ESP----------------------

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/iCalux/UsefulScripts/main/ESP.lua"))()

ESPWindow:Toggle("Enable ", function(State)
ESP.Enabled = State
end)

ESPWindow:Toggle("Boxes ", function(State)
ESP.Boxes = State
end)

ESPWindow:Toggle("Name ", function(State)
ESP.Names = State
end)

ESPWindow:Toggle("Team Colour", function(State)
ESP.TeamColor = State
end)

ESPWindow:Toggle("Team Mates", function(State)
ESP.TeamMates = State
end)

ESPWindow:Toggle("Player ", function(State)
ESP.Players = State
end)

ESPWindow:Toggle("Tracers", function(State)
ESP.Tracers = State
end)

------------------------------------------------------------------------------
--AimBot
_G.AimbotEnabled = false
_G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
_G.AimPart = "Head" -- Where the aimbot script would lock at.
_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

_G.CircleSides = 64 -- How many sides the FOV circle would have.
_G.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
_G.CircleTransparency = 0.7 -- Transparency of the circle.
_G.CircleRadius = 80 -- The radius of the circle / FOV.
_G.CircleFilled = false -- Determines whether or not the circle is filled.
_G.CircleVisible = false -- Determines whether or not the circle is visible.
_G.CircleThickness = 0 -- The thickness of the circle.



AimbotWindow:Toggle("Enable AimBot", function(value)
_G.AimbotEnabled = value

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function GetClosestPlayer()
	local MaximumDistance = _G.CircleRadius
	local Target

	for _, v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= LocalPlayer.Name then
            if _G.TeamCheck == true then 
                if v.Team ~= LocalPlayer.Team then
                    if workspace:FindFirstChild(v.Name) ~= nil then
                        if workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                            if workspace[v.Name]:FindFirstChild("Humanoid") ~= nil and workspace[v.Name]:FindFirstChild("Humanoid").Health ~= 0 then
                                local ScreenPoint = Camera:WorldToScreenPoint(workspace[v.Name]:WaitForChild("HumanoidRootPart", math.huge).Position)
                                local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                
                                if VectorDistance < MaximumDistance then
                                    Target = v
                                end
                            end
                        end
                    end
                end
            else
                if workspace:FindFirstChild(v.Name) ~= nil then
                    if workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                        if workspace[v.Name]:FindFirstChild("Humanoid") ~= nil and workspace[v.Name]:FindFirstChild("Humanoid").Health ~= 0 then
                            local ScreenPoint = Camera:WorldToScreenPoint(workspace[v.Name]:WaitForChild("HumanoidRootPart", math.huge).Position)
                            local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                            
                            if VectorDistance < MaximumDistance then
                                Target = v
                            end
                        end
                    end
                end
            end
		end
	end

	return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
        Locked = false
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Filled = _G.CircleFilled
    FOVCircle.Color = _G.CircleColor
    FOVCircle.Visible = _G.CircleVisible
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Transparency = _G.CircleTransparency
    FOVCircle.NumSides = _G.CircleSides
    FOVCircle.Thickness = _G.CircleThickness
    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
        Locked = true
    end
end)
end)

AimbotWindow:Toggle("Team Check", function(value)
    
_G.TeamCheck = value -- If set to true then the script would only lock your aim at enemy team members.

end)

AimbotWindow:Toggle("FOV Circle", function(value)
_G.CircleVisible = value
end)

AimbotWindow:Toggle("Filled", function(value)
_G.CircleFilled = value
end)

AimbotWindow:Slider("Circle Size",30,1080,true, function(value)
_G.CircleRadius = value -- The radius of the circle / FOV.
end)

AimbotWindow:Slider("Circle Thickness",0,20,true, function(value)
_G.CircleThickness = value -- The thickness of the circle.
end)

AimbotWindow:Slider("Sides",3,80,true, function(value)
_G.CircleSides = value -- The thickness of the circle.
end)

------------------------------------------------------------------------------------
--Extra--
ExtraWindow:Toggle("X-Ray",function(Value)
    if Value then
        for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
				v.Transparency = v.Transparency + 0.5
			end
		end
    else
        for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
				v.Transparency = v.Transparency - 0.5
			end
		end
    end
end)

ExtraWindow:Toggle("FullBright",function(Value)
if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = Value
_G.FullBrightEnabled = not _G.FullBrightEnabled
end)

ExtraWindow:Button("Rejoin Game", function()
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer

ts:Teleport(game.PlaceId, p)    
end)

ExtraWindow:Button("Shift To Close GUI",function()

end);

ExtraWindow:Button("Made by icalux#6339",function()

end);

function joindiscord()
    if not syn then return err("synapse only") end
    local json = {
        ["cmd"] = "INVITE_BROWSER",
            ["args"] = {
            ["code"] = "gNdA9b95eJ"
        },
        ["nonce"] = 'a'
        }
    spawn(function()
        print(syn.request({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                ['Origin'] = 'https://discord.com'
              },
            Body = game:GetService('HttpService'):JSONEncode(json),
        }).Body)
    end)
end

ExtraWindow:Button("Join Discord", joindiscord)
