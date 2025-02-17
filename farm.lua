-- Roblox Script for Game Owners (Blox Fruits-like Game)

-- Create ScreenGui for Admin Tools
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Frame for GUI
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = screenGui

-- Create Title Label
local title = Instance.new("TextLabel")
title.Text = "Admin Tools"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Create Auto-Farm Button
local autoFarmButton = Instance.new("TextButton")
autoFarmButton.Text = "Enable Auto-Farm"
autoFarmButton.Size = UDim2.new(0.8, 0, 0, 40)
autoFarmButton.Position = UDim2.new(0.1, 0, 0.2, 0)
autoFarmButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
autoFarmButton.TextColor3 = Color3.new(1, 1, 1)
autoFarmButton.Parent = frame

-- Create FPS Improve Button
local fpsImproveButton = Instance.new("TextButton")
fpsImproveButton.Text = "Enable FPS Improve"
fpsImproveButton.Size = UDim2.new(0.8, 0, 0, 40)
fpsImproveButton.Position = UDim2.new(0.1, 0, 0.6, 0)
fpsImproveButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
fpsImproveButton.TextColor3 = Color3.new(1, 1, 1)
fpsImproveButton.Parent = frame

-- Auto-Farm Logic
local autoFarmEnabled = false
local function autoFarm()
    while autoFarmEnabled do
        -- Example: Automatically farm resources or experience
        for _, npc in pairs(workspace.NPCs:GetChildren()) do
            if npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
                -- Simulate farming (e.g., deal damage, collect rewards)
                npc.Humanoid:TakeDamage(10)
                print("Farming:", npc.Name)
                wait(1) -- Cooldown between attacks
            end
        end
        wait(1)
    end
end

autoFarmButton.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    autoFarmButton.Text = autoFarmEnabled and "Disable Auto-Farm" or "Enable Auto-Farm"
    if autoFarmEnabled then
        autoFarm()
    end
end)

-- FPS Improve Logic
local fpsImproveEnabled = false
local function optimizeFPS()
    if fpsImproveEnabled then
        -- Reduce graphics quality for better performance
        settings().Rendering.QualityLevel = 1
        -- Disable unnecessary effects
        for _, effect in pairs(workspace:GetDescendants()) do
            if effect:IsA("ParticleEmitter") or effect:IsA("Smoke") or effect:IsA("Fire") then
                effect.Enabled = false
            end
        end
    else
        -- Restore default settings
        settings().Rendering.QualityLevel = 10
        for _, effect in pairs(workspace:GetDescendants()) do
            if effect:IsA("ParticleEmitter") or effect:IsA("Smoke") or effect:IsA("Fire") then
                effect.Enabled = true
            end
        end
    end
end

fpsImproveButton.MouseButton1Click:Connect(function()
    fpsImproveEnabled = not fpsImproveEnabled
    fpsImproveButton.Text = fpsImproveEnabled and "Disable FPS Improve" or "Enable FPS Improve"
    optimizeFPS()
end)
