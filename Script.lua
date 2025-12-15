local syde = loadstring(game:HttpGet("https://raw.githubusercontent.com/essencejs/syde/refs/heads/main/source",true))()

syde:Load({
	Logo = '9980452590',
	Name = 'Boga Hub',
	Status = 'Stable', -- {Stable, Unstable, Detected, Patched}
	Accent = Color3.fromRGB(106, 187, 255), -- Window Accent Theme
	HitBox = Color3.fromRGB(123, 230, 255), -- Window HitBox Theme (ex. Toggle Color)
	AutoLoad = false, -- Does Not Work !
	Socials = {    -- Allows 1 Large and 2 Small Blocks
		[[--{
			Name = 'Syde';
			Style = 'Discord';
			Size = "Large";
			CopyToClip = true -- Copy To Clip (coming very soon)
		},]]
		{
			Name = 'GitHub';
			Style = 'GitHub';
			Size = "Large";
			CopyToClip = true
		}
	},
	ConfigurationSaving = { -- Allows Config Saving
		Enabled = true,
		FolderName = 'BogaHub',
		FileName = "BogaHub"
	},
	[[--AutoJoinDiscord = { 
		Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
		Invite = "CZRZBwPz", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
		RememberJoins = false -- Set this to false to make them join the discord every time they load it up
	},]]
})

local Window = syde:Init({
	Title = 'Boga Hub'; -- Set Title
	SubText = 'Made With 💓 By @boda_Grande' -- Set Subtitle
})

local MainTab  = Window:InitTab({ Title = 'Main' })
local GameTab  = Window:InitTab({ Title = 'Game' })

main:Section('Github')
main:Paragraph({
	Title = 'Welcome to Boga Hub',
	Content = 'Boga Hub was made for Roblox exploiting, developed by @boda_Grande, and is open-source on GitHub.'
})
main:Paragraph({
	Title = 'Link',
	Content = 'https://github.com/BogaDev221/BogaHub'
})

local PID = game.PlaceId

if PID == 79137923166591 then -- Slap
	InputsTab:Dropdown({
	Title = '[UPD] Slap',
	Options = {'Insta Dodge / no key / PC', 'Soon', 'Soon', 'Soon'},
	PlaceHolder = 'Select a script...',
	CallBack = function(option)
		print('Script selected:', option)
		if option == "Insta Dodge / no key / PC" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/rapierhub/loader/refs/heads/main/Pandemonium"))()
		end
		syde:Notify({
			Title = 'Loading Script',
			Content = 'Selected: ' .. option,
			Duration = 2
		})
	end,
	})
end

syde:LoadSaveConfig()
