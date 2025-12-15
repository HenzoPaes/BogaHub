local Luna = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/luna", true))()

local Window = Luna:CreateWindow({
    Name = "Boga Hub", -- This Is Title Of Your Window
    Subtitle = nil, -- A Gray Subtitle next To the main title.
    LogoID = "9980452590", -- The Asset ID of your logo. Set to nil if you do not have a logo for Luna to use.
    LoadingEnabled = true, -- Whether to enable the loading animation. Set to false if you do not want the loading screen or have your own custom one.
    LoadingTitle = "Boga Hub Loading!", -- Header for loading screen
    LoadingSubtitle = "by Boda_Grande", -- Subtitle for loading screen

    ConfigSettings = {
        RootFolder = true, -- The Root Folder Is Only If You Have A Hub With Multiple Game Scripts and u may remove it. DO NOT ADD A SLASH
        ConfigFolder = "Boga Hub" -- The Name Of The Folder Where Luna Will Store Configs For This Script. DO NOT ADD A SLASH
    },

    KeySystem = false, -- As Of Beta 6, Luna Has officially Implemented A Key System!
    KeySettings = {
        Title = "Luna Example Key",
        Subtitle = "Key System",
        Note = "Best Key System Ever! Also, Please Use A HWID Keysystem like Pelican, Luarmor etc. that provide key strings based on your HWID since putting a simple string is very easy to bypass",
        SaveInRoot = false, -- Enabling will save the key in your RootFolder (YOU MUST HAVE ONE BEFORE ENABLING THIS OPTION)
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        Key = {"Example Key"}, -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
        SecondAction = {
            Enabled = true, -- Set to false if you do not want a second action,
            Type = "Link", -- Link / Discord.
            Parameter = "" -- If Type is Discord, then put your invite link (DO NOT PUT DISCORD.GG/). Else, put the full link of your key system here.
        }
    }
})

local GameTab = Window:CreateTab({
    Name = "Scripts",
    Icon = "gamepad-2",
    ImageSource = "Lucide",
    ShowTitle = false -- This will determine whether the big header text in the tab will show
})
local MiscTab = Window:CreateTab({
    Name = "Misc",
    Icon = "more-vertical",
    ImageSource = "Lucide",
    ShowTitle = false -- This will determine whether the big header text in the tab will show
})
local AvailableTab = Window:CreateTab({
    Name = "Available",
    Icon = "check-circle-2",
    ImageSource = "Lucide",
    ShowTitle = false -- This will determine whether the big header text in the tab will show
})

Window:CreateHomeTab()

GameTab:CreateSection("Scripts")

local PID = game.PlaceId
print("DEBUG PlaceId:", PID)

if PID == 79137923166591 then -- slap
    local Label = Tab:CreateLabel({
        Text = "[UPD] Slap",
        Style = 1 -- Luna Labels Have 3 Styles : A Basic Label, A Green Information Label and A Red Warning Label. Look At The Following Image For More Details
    })
    GameTab:CreateButton({
        Name = "Insta Dodge (PC)",
        Description = "Insta Dodge, free win",
        Callback = function()
            pcall(function()
				loadstring(game:HttpGet(
					'https://raw.githubusercontent.com/rapierhub/loader/refs/heads/main/Pandemonium',
					true
				))()
			end)

            Luna:Notification({ 
                Title = "Loading Script",
                Icon = "sparkle",
                ImageSource = "Material",
                Content = "Insta Dodge Loading!"
            })
        end
    })
else
	GameTab:CreateParagraph({
        Title = "Game not supported!",
        Text = 'Detected PlaceId: [' .. PID .. "] /" .. game.Name
    })
end

MiscTab:CreateParagraph({
    Title = "Others Scripts",
    Text = "Soon."
})

AvailableTab:CreateParagraph({
    Title = "Available",
    Text = "[UPD] Slap.\n Others Soon!"
})

Luna:Notification({ 
    Title = "Boga Hub Loaded",
    Icon = "notifications_active",
    ImageSource = "Material",
    Content = "Have Fun!"
})

Window:CreateHomeTab({
    Icon = 1, -- By Default, The Icon Is The Home Icon. If You would like to change it to dashboard, replace the interger with 2
})

Luna:LoadAutoloadConfig()
