local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

-- Create UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 0, 30)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Speed Changer"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextSize = 18
TextLabel.Parent = Frame

local SpeedBox = Instance.new("TextBox")
SpeedBox.Size = UDim2.new(1, -20, 0, 30)
SpeedBox.Position = UDim2.new(0, 10, 0, 40)
SpeedBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.Text = "Enter Speed"
SpeedBox.Parent = Frame

local ApplyButton = Instance.new("TextButton")
ApplyButton.Size = UDim2.new(1, -20, 0, 30)
ApplyButton.Position = UDim2.new(0, 10, 0, 80)
ApplyButton.BackgroundColor3 = Color3.fromRGB(30, 150, 30)
ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyButton.Text = "Apply Speed"
ApplyButton.Parent = Frame

-- Speed Change Function
ApplyButton.MouseButton1Click:Connect(function()
    local speed = tonumber(SpeedBox.Text)
    if speed and humanoid then
        humanoid.WalkSpeed = speed
    end
end)
