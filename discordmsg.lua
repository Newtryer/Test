-- Load Services
local player = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")

-- Webhook URL (Replace with your actual Discord Webhook)
local webhookURL = "https://discord.com/api/webhooks/1340051313886625824/vX3vQyQtRSCRbbJ8RikO5NHrFOnT0p-2nb2sj2ycH2enKjvPUx2bM3vkwumxl_WuVETN"

-- Function to send a Discord message
local function sendDiscordMessage(customMessage)
    local data = {
        ["content"] = customMessage
    }
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local jsonData = HttpService:JSONEncode(data)

    -- Make a POST request to Discord webhook
    local success, response = pcall(function()
        return HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson, false, headers)
    end)

    -- Debugging output
    if success then
        print("✅ Discord message sent successfully!")
    else
        print("❌ Error sending message: " .. response)
    end
end

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local MessageInput = Instance.new("TextBox")
local SendButton = Instance.new("TextButton")
local TitleLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame

TitleLabel.Parent = MainFrame
TitleLabel.Text = "Custom Discord Message"
TitleLabel.TextSize = 18
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleLabel.Size = UDim2.new(1, 0, 0, 40)

MessageInput.Parent = MainFrame
MessageInput.Size = UDim2.new(1, -20, 0, 50)
MessageInput.Position = UDim2.new(0, 10, 0, 60)
MessageInput.Text = "Enter your message here..."
MessageInput.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

SendButton.Parent = MainFrame
SendButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
SendButton.Size = UDim2.new(1, -20, 0, 50)
SendButton.Position = UDim2.new(0, 10, 0, 130)
SendButton.Text = "Send Message"
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Send Message Button Click Event
SendButton.MouseButton1Click:Connect(function()
    local customMessage = MessageInput.Text
    sendDiscordMessage("**User:** " .. player.Name .. "\n**Message:** " .. customMessage)
end)

-- Automatically send a message when the script is executed
sendDiscordMessage("📢 **User " .. player.Name .. " has executed the script!**")
