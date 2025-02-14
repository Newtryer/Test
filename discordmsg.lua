local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create RemoteEvent (if it doesn't exist)
local remoteName = "SendDiscordMessage"
local webhookURL = "https://discord.com/api/webhooks/1340070520762404895/8W15IaSI1elzjm-Su8O6XdMbbA6B8xljc-MXQjYWgandlFIWULSk5n42Km7oRHSjkYSP" -- Replace with your Discord Webhook

local remoteEvent = ReplicatedStorage:FindFirstChild(remoteName)
if not remoteEvent then
    remoteEvent = Instance.new("RemoteEvent", ReplicatedStorage)
    remoteEvent.Name = remoteName
end

-- Server-side script to send messages (auto-runs)
local function setupWebhookHandler()
    local serverScript = Instance.new("Script", game.ServerScriptService)
    serverScript.Name = "DiscordWebhookHandler"
    serverScript.Source = [[
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local HttpService = game:GetService("HttpService")
        local webhookURL = "]] .. webhookURL .. [["

        ReplicatedStorage.SendDiscordMessage.OnServerEvent:Connect(function(player, message)
            local data = {
                ["content"] = "**User:** " .. player.Name .. "\n**Message:** " .. message
            }
            local jsonData = HttpService:JSONEncode(data)
            
            pcall(function()
                HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
            end)
        end)
    ]]
end

setupWebhookHandler() -- Run server setup

-- GUI
local player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local MessageInput = Instance.new("TextBox")
local SendButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 200)

MessageInput.Parent = MainFrame
MessageInput.Size = UDim2.new(1, -20, 0, 50)
MessageInput.Position = UDim2.new(0, 10, 0, 60)
MessageInput.Text = "Enter your message..."
MessageInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

SendButton.Parent = MainFrame
SendButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
SendButton.Size = UDim2.new(1, -20, 0, 50)
SendButton.Position = UDim2.new(0, 10, 0, 130)
SendButton.Text = "Send"

SendButton.MouseButton1Click:Connect(function()
    local message = MessageInput.Text
    remoteEvent:FireServer(message)
end)

-- Auto-send execution message
remoteEvent:FireServer("📢 **User " .. player.Name .. " has executed the script!**")
