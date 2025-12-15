local syde = loadstring(game:HttpGet("https://raw.githubusercontent.com/essencejs/syde/refs/heads/main/source", true))()

syde:Load({
	Logo = '9980452590',
	Name = 'Boga Hub',
	Status = 'Stable',
	Accent = Color3.fromRGB(106, 187, 255),
	HitBox = Color3.fromRGB(123, 230, 255),
	AutoLoad = false,
	Socials = {
		{
			Name = 'No Discord';
			Style = 'Discord';
			Size = "Small";
			CopyToClip = false
		},
		{
			Name = 'GitHub';
			Style = 'GitHub';
			Size = "Large";
			CopyToClip = true
		}
	},
	ConfigurationSaving = {
		Enabled = true,
		FolderName = 'BogaHub',
		FileName = "config"
	},
	
})

local Window = syde:Init({
	Title = 'Boga Hub';
	SubText = 'Made With 💓 By @boda_Grande'
})

local MainTab  = Window:InitTab({ Title = 'Main' })
local GameTab  = Window:InitTab({ Title = 'Game' })
local MiscTab  = Window:InitTab({ Title = 'Misc' })
local AvailableTab  = Window:InitTab({ Title = 'Available Games' })

MainTab:Section('Github')
MainTab:Paragraph({
	Title = 'Welcome to Boga Hub',
	Content = 'Boga Hub was made for Roblox exploiting, developed by @boda_Grande, and is open-source on GitHub.'
})
MainTab:Button({
	Title = 'Link', -- Set Title
	Description = 'Copy github link', -- Description (Optional)
	Type = 'Hold', -- Type [ Default, Hold ] (Optional)
	HoldTime = 1, -- Hold Time When Type is *Hold
	CallBack = function()
	       setclipboard("https://github.com/BogaDev221/BogaHub")
		   syde:Notify({
					Title = 'Copied',
					Content = 'link has been copied!',
					Duration = 2
				})
	end,
})

GameTab:Section('Scripts')

local PID = game.PlaceId
print("DEBUG PlaceId:", PID)

if PID == 79137923166591 then -- slap
	GameTab:Dropdown({
		Title = '[UPD] Slap',
		Options = {'Insta Dodge (PC)'},
		PlaceHolder = 'Select a script...',
		CallBack = function(option)
			if option == 'Insta Dodge (PC)' then
				pcall(function()
					loadstring(game:HttpGet(
						'https://raw.githubusercontent.com/rapierhub/loader/refs/heads/main/Pandemonium',
						true
					))()
				end)

				syde:Notify({
					Title = 'Loading Script',
					Content = 'Insta Dodge Loading!',
					Duration = 2
				})
			end
		end,
	})
else
	GameTab:Paragraph({
		Title = 'Game not supported',
		Content = 'Detected PlaceId: ' .. PID
	})
end


MiscTab:Paragraph({
	Title = 'Others Scripts',
	Content = 'Soon.'
})

AvailableTab:Paragraph({
	Title = 'Available',
	Content = '[UPD] Slap.\nOthers Soon!'
})

syde:LoadSaveConfig()

