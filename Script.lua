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
			Name = 'GitHub';
			Style = 'GitHub';
			Size = "Large";
			CopyToClip = true
		},
	},
	ConfigurationSaving = {
		Enabled = true,
		FolderName = 'SydeDemo',
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
MainTab:Paragraph({
	Title = 'Link',
	Content = 'https://github.com/BogaDev221/BogaHub'
})
local InputsSection = GameTab:Section('Scripts')

local PID = game.PlaceId
print("DEBUG PlaceId:", PID)

if PID == 79137923166591 then
	InputsSection:Dropdown({
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
					Content = 'Insta Dodge loaded!',
					Duration = 2
				})
			end
		end,
	})
else
	InputsSection:Paragraph({
		Title = 'Game not supported',
		Content = 'Detected PlaceId: ' .. PID
	})
end


MiscTab:Keybind({
	Title = 'Toggle UI',
	Key = Enum.KeyCode.K,
	CallBack = function()
		print('UI toggle keybind activated!')
		syde:Notify({
			Title = 'Keybind Pressed',
			Content = 'UI toggle key was pressed!',
			Duration = 2
		})
	end,
})
MiscTab:Paragraph({
	Title = 'Others Scripts',
	Content = 'Soon.'
})

AvailableTab:Paragraph({
	Title = 'Available',
	Content = '[UPD] Slap./n others soon.'
})

syde:LoadSaveConfig()
