local HttpService = game:GetService("HttpService")

local webhookURL = "https://discord.com/api/webhooks/1340070520762404895/8W15IaSI1elzjm-Su8O6XdMbbA6B8xljc-MXQjYWgandlFIWULSk5n42Km7oRHSjkYSP" -- Replace this with your webhook URL

local player = game.Players.LocalPlayer
local message = "**User:** " .. player.Name .. " has executed the script!"

local data = {
    ["content"] = message
}

local success, response = pcall(function()
    return HttpService:PostAsync(webhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
end)

if success then
    print("✅ Sent to Discord!")
else
    print("❌ Failed to send: " .. response)
end
