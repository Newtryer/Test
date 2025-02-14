local HttpService = game:GetService("HttpService")

-- Replace with your Discord Webhook URL
local webhookUrl = "https://discord.com/api/webhooks/1340070520762404895/8W15IaSI1elzjm-Su8O6XdMbbA6B8xljc-MXQjYWgandlFIWULSk5n42Km7oRHSjkYSP"

-- The message to send to Discord
local message = {
    content = "Hello from friend Roblox!"  -- This is the message sent to Discord
}

-- Convert the message table into JSON format
local jsonMessage = HttpService:JSONEncode(message)

-- Send the POST request to Discord webhook
local function sendToDiscord()
    local headers = {
        ["Content-Type"] = "application/json"
    }

    local response = HttpService:PostAsync(webhookUrl, jsonMessage, Enum.HttpContentType.ApplicationJson, false, headers)
    print("Message sent to Discord: " .. response)
end

-- Trigger the function to send the message (for example, when a player joins the game)
game.Players.PlayerAdded:Connect(function(player)
    sendToDiscord()
end)
