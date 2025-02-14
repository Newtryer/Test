-- Load Services
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local virtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local workspace = game:GetService("Workspace")

-- Webhook URL (Replace with your Discord Webhook URL)
local webhookURL = "https://discord.com/api/webhooks/1340051313886625824/vX3vQyQtRSCRbbJ8RikO5NHrFOnT0p-2nb2sj2ycH2enKjvPUx2bM3vkwumxl_WuVETN"

-- Function to send message to Discord
local function sendDiscordMessage(message)
    local data = {
        ["content"] = message
    }
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local jsonData = HttpService:JSONEncode(data)

    -- Make a POST request to Discord webhook
    local success, response = pcall(function()
        return HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson, false, headers)
    end)

    -- Check if the request was successful
    if success then
        print("Discord message sent successfully.")
    else
        print("Error sending message: " .. response)
    end
end

-- Send message when the script is executed
sendDiscordMessage(player.Name .. " executed the autofarm script!")

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local AutoFarmButton = Instance.new("TextButton")
local MobSelection = Instance.new("TextBox")
local TitleLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame

TitleLabel.Parent = MainFrame
TitleLabel.Text = "Auto Farm Script"
TitleLabel.TextSize = 24
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleLabel.Size = UDim2.new(1, 0, 0, 40)

AutoFarmButton.Parent = MainFrame
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AutoFarmButton.Size = UDim2.new(1, -20, 0, 50)
AutoFarmButton.Position = UDim2.new(0, 10, 0, 80)
AutoFarmButton.Text = "Auto Farm (OFF)"
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)

MobSelection.Parent = MainFrame
MobSelection.Size = UDim2.new(1, -20, 0, 30)
MobSelection.Position = UDim2.new(0, 10, 0, 150)
MobSelection.Text = "Enter Mob Name"
MobSelection.TextColor3 = Color3.fromRGB(255, 255, 255)
MobSelection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local autoFarmEnabled = false
local selectedMob = ""

-- Function to handle quest acceptance
local function acceptQuest()
    -- Loop through all NPCs in the workspace
    for _, npc in pairs(workspace.NPCs:GetChildren()) do
        if npc:FindFirstChild("HumanoidRootPart") and npc.Name:find("Quest") then
            -- Move to the NPC and accept quest
            player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
            wait(1)
            replicatedStorage.Remotes.QuestAccept:FireServer(npc.Name)
            sendDiscordMessage(player.Name .. " accepted the quest: " .. npc.Name)
            print("Quest Accepted for: " .. npc.Name)  -- Debug message
            break -- Stop after accepting the first quest
        end
    end
end

-- Function to handle mob farming
local function farmMobs()
    print("Starting Auto Farm...")  -- Debug message
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

        -- Search for mobs based on the selected name
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
            print("Attacking mob: " .. closestEnemy.Name)  -- Debug message
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
        print("Selected Mob: " .. selectedMob)  -- Debug message
        acceptQuest()
        farmMobs()
    else
        print("Auto Farm Stopped")  -- Debug message
    end
end)
