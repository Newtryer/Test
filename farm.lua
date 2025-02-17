_G.webhookURL= "https://discord.com/api/webhooks/1341133773680410645/0p3HaAkvx7IhrGEW6SG1NqFvZpm0kCjBoJgOuyhD2yHnHR2JDQBcwUfHuNUT-Eu5MnMM" -- webhook here

local HttpService = game:GetService("HttpService")
local httpRequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Functions

local function webhhook()
    if _G.webhookURL == "" then return end

    local payload = {
        username = "Executed",
        avatar_url = "https://google.com",
        content = "",
        embeds = {
            {
                title = "Executere",
                type = "rich",
                color = 65280,
                fields = {
                    { name = "Author", value = "This script was made by Frostbreaker (frostbreakerv1)", inline = false }
                },
                footer = { text = "made by FrostBreaker", icon_url = "https://google.com" }
            }
        }
    }

    local response = httpRequest({
        Url = _G.webhookURL,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = HttpService:JSONEncode(payload)
    })

    if not response or not response.Success then
        warn("webhook failed")
    end
end
webhhook()
