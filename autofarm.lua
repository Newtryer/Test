-- Load Services
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local virtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local workspace = game:GetService("Workspace")

-- Webhook URL (Replace with your Discord Webhook URL)
local webhookURL = "https://discord.com/api/webhooks/1340048482634825819/gpC9EQIuxV-dAPujJX95SItLEu9MbtkXCjJavyUwuPZaavptC06J9AzrHiKgSHVzXE7B"

-- Function to send message to Discord
local function sendDiscordMessage(message)
    local data = {
        ["content"] = message
    }
    local jsonData = HttpService:JSONEncode(data)
    HttpService:PostAsync(webhookURL, jsonData)
end

-- Send message when the script is executed
sendDiscordMessage(player.Name .. " executed the autofarm script!")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local AutoFarmButton = Instance.new("TextButton")
local MobSelection = Instance.new("TextBox")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame

AutoFarmButton.Parent = MainFrame
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AutoFarmButton.Size = UDim2.new(1, -20, 0, 50)
AutoFarmButton.Position = UDim2.new(0, 10, 0, 50)
AutoFarmButton.Text = "Auto Farm (OFF)"
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)

MobSelection.Parent = MainFrame
MobSelection.Size = UDim2.new(1, -20, 0, 30)
MobSelection.Position = UDim2.new(0, 10, 0, 110)
MobSelection.Text = "Enter Mob Name"
MobSelection.TextColor3 = Color3.fromRGB(255, 255, 255)
MobSelection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local autoFarmEnabled = false
local selectedMob = ""

-- Function to handle quest acceptance
local function acceptQuest()
    for _, npc in pairs(workspace.NPCs:GetChildren()) do
        if npc:FindFirstChild("HumanoidRootPart") and npc.Name:find("Quest") then
            -- Move to the NPC and accept quest
            player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
            wait(1)
            replicatedStorage.Remotes.QuestAccept:FireServer(npc.Name)
            sendDiscordMessage(player.Name .. " accepted the quest!")
        end
    end
end

-- Function to handle mob farming
local function farmMobs()
    while autoFarmEnabled do
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local humanoid = character:WaitForChild("Humanoid")
        
        -- Float in Air to Avoid Damage
        humanoid.PlatformStand = true
        humanoidRootPart.Velocity = Vector3.new(0, 50, 0)
        
        -- Find Nearest Mob
        local closestEnemy = nil
        local minDistance = math.huge
        
        for _, enemy in pairs(workspace.Enemies:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy.Name:lower():find(selectedMob:lower()) then
                local distance = (humanoidRootPart.Position - enemy.HumanoidRootPart.Position).magnitude
                if distance < minDistance then
                    closestEnemy = enemy
                    minDistance = distance
                end
            end
        end

        -- If a mob is found, teleport and attack
        if closestEnemy then
            humanoidRootPart.CFrame = closestEnemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 3)  -- Float above mob
            wait(0.5)
            virtualUser:Button1Down(Vector2.new(0, 0))  -- Simulate attack
        end
        
        wait(1)
    end
end

-- Button Event: Start/Stop Auto Farm
AutoFarmButton.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    AutoFarmButton.Text = autoFarmEnabled and "Auto Farm (ON)" or "Auto Farm (OFF)"
    AutoFarmButton.BackgroundColor3 = autoFarmEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    
    if autoFarmEnabled then
        selectedMob = MobSelection.Text
        acceptQuest()
        farmMobs()
    end
end)
