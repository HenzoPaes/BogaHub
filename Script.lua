local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()  

local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

local Window = Starlight:CreateWindow({
    Name = "Boga Hub",
    Subtitle = "v0.1",
    Icon = 9980452590,

    LoadingSettings = {
        Title = "Boga Hub",
        Subtitle = "Welcome to Boga Hub",
        Logo = 9980452590
    },

    FileSettings = {
        ConfigFolder = "BogaHub"
    },
})

Window:CreateHomeTab({
    -- Logic is done this way to not immediately rule out unknown executors.
    -- For example, if Delta is confirmed to break with your script, it can go in Unsupported.
    -- If users use Trigon but you don't have it/unsure whether it works, it can be left out and marked as a maybe

    SupportedExecutors = {}, 
    UnsupportedExecutors = {},

    DiscordInvite = "", -- The Discord Invite Link. Do Not Include discord.gg/ | Only Include the code.
    Backdrop = nil, -- A Custom Image to use for the backdrop. Set to 0 to use the Game's Thumbnail. Defaults To A Roblox Void. Set to a blank image to not use.  

    IconStyle = 2, -- 1 for solid, 2 for outline

    Changelog = {
        -- Pass Tables For Each Update
        
        {
            Title = "v0.1",
            Date = "15/12/25",
            Description = "Created Repo in github \n end",
        },
    }
})

local Tabs = {
    GameTab = Window:CreateTabSection("Script",true),
    --MiscTab = Window:CreateTabSection("Misc",true),
    --AvailableTab = Window:CreateTabSection("Available",true),
}

local GameTabGroup = Tabs.GameTab:CreateGroupbox({
    Name = "GameTabGroup",
    Column = 1,
}, "GameTabGroup")
local Text = GameTabGroup:CreateLabel({
        Name = "Game Tab"
}, "GameTabGroup")

local PID = game.PlaceId
print("DEBUG PlaceId:", PID)

if PID == 79137923166591 then -- slap
	local Button = GameTabGroup:CreateButton({
        Name = "Insta Dodge (PC)",
        Icon = NebulaIcons:GetIcon('check', 'Material'),
        Callback = function()
            pcall(function()
				    loadstring(game:HttpGet(
					    'https://raw.githubusercontent.com/rapierhub/loader/refs/heads/main/Pandemonium',
					    true
				    ))()
		    end)

            local Notifications = Starlight:Notification({
                Title = "Loading Script",
                Icon = NebulaIcons:GetIcon('sparkle', 'Material'),
                Content = "Insta Dodge Loading!",
            }, "Notfy")
        end,
    }, "GameTabGroup")
else
	Tabs.GameTab:Paragraph({
		Title = 'Game not supported',
		Content = 'Detected PlaceId: ' .. PID
	})
end
