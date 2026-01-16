-- ==========================================
-- BOGA HUB - REFACTORED
-- Versão: 0.14 (Modular)
-- ==========================================

local Players = game:GetService("Players")
local PlaceId = game.PlaceId

-- ==========================================
-- 1. CARREGAMENTO DE BIBLIOTECAS
-- ==========================================
local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()
local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

-- ==========================================
-- 2. FUNÇÕES AUXILIARES (HELPERS)
-- ==========================================

local function Notify(title, content, icon)
    Starlight:Notification({
        Title = title,
        Icon = NebulaIcons:GetIcon(icon or 'info', 'Material'),
        Content = content,
    }, "Notify")
end

local function ExecuteScript(scriptData)
    local url = scriptData.Url
    local name = scriptData.Name
    local useCache = scriptData.Cache ~= false -- Padrão é true, a menos que especificado

    task.spawn(function()
        local success, err = pcall(function()
            Notify("Carregando", "Injetando " .. name .. "...", "hourglass_empty")
            loadstring(game:HttpGet(url, useCache))()
            Notify("Sucesso", name .. " injetado!", "check_circle")
        end)

        if not success then
            Notify("Erro", "Falha ao injetar " .. name, "error")
            warn("[BOGA HUB] Erro:", err)
        end
    end)
end

-- ==========================================
-- 3. BANCO DE DADOS DE SCRIPTS (CONFIGURAÇÃO)
-- ==========================================

-- Lista de Scripts Universais
local UniversalScripts = {
    {
        Name = "Infinite Yield / Sirius Hub - 2.0",
        Url = "https://rawscripts.net/raw/Universal-Script-Sirius-Reborn-Hub-74262",
        Icon = "all_inclusive",
        Style = 1,
        Tooltip = "Creditos: Sirius + Infinite Yield"
    },
    {
        Name = "Infinite Yield - 1.0",
        Url = "https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua",
        Icon = "all_inclusive",
        Style = 2,
        Tooltip = "Clássico"
    }
}

-- Definição dos pacotes de script por Categoria/Jogo
local GameScriptsDB = {
    ["Slap"] = {
        {
            Name = "Insta Dodge (PC)",
            Url = "https://raw.githubusercontent.com/rapierhub/loader/refs/heads/main/Pandemonium",
            Icon = "bolt",
            Style = 2
        }
    },
    ["MM2_Bundle"] = { -- Usado para MM2, FTF, FSK
        {
            Name = "Yarhm (PC & Mobile)",
            Url = "https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.20/yarhm.lua",
            Icon = "bolt",
            Style = 1,
            Cache = false
        },
        {
            Name = "Stelarium Hub",
            Url = "https://rawscripts.net/raw/Universal-Script-Stelarium-Hub-Keyless-74307",
            Icon = "bolt",
            Style = 2,
            Cache = false
        }
    },
    ["Spider"] = {
        {
            Name = "Spider By Liver_zMods",
            Url = "https://abre.ai/spider-lua",
            Icon = "bolt",
            Style = 1
        }
    },
	["BlindSt"] = {
        {
            Name = "Script - 1",
            Url = "https://pastebin.com/raw/vjB2N8PE",
            Icon = "bolt",
            Style = 1
        }
    }
}

-- Mapeamento: Qual ID usa qual pacote de scripts
local SupportedGames = {
    [79137923166591]      = { Name = "[UPD] Slap",        DatabaseKey = "Slap" },
    [142823291]     	  = { Name = "Murder Mystery 2",  DatabaseKey = "MM2_Bundle" },
    [893973440]     	  = { Name = "Flee the Facility", DatabaseKey = "MM2_Bundle" },
    [18687417158]     	  = { Name = "Forsaken",          DatabaseKey = "MM2_Bundle" },
    [5118969548]     	  = { Name = "Spider",            DatabaseKey = "Spider" },
    [118614517739521]     = { Name = "Blind Shoot",       DatabaseKey = "BlindSt" }
}

-- ==========================================
-- 4. CONFIGURAÇÃO DA UI
-- ==========================================

local WindowConfig = {
    Name = "Boga Hub",
    Subtitle = "v0.14 - Modular",
    Icon = 595029582,
    LoadingSettings = {
        Title = "Boga Hub",
        Subtitle = "Por @boda_Grande",
        Logo = 595029582
    },
    FileSettings = { ConfigFolder = "BogaHub" }
}

local Window = Starlight:CreateWindow(WindowConfig)

-- ==========================================
-- 5. CONSTRUÇÃO DAS ABAS (AUTOMATIZADA)
-- ==========================================

-- >> Aba Home
Window:CreateHomeTab({
    SupportedExecutors = {}, UnsupportedExecutors = {},
    DiscordInvite = "", IconStyle = 2,
    Changelog = {
        { Title = "v0.14", Date = "16/01/26", Description = "• Código completamente reescrito\n• Sistema modular de jogos\n• Otimização de carregamento" }
    }
})

-- >> Aba Universal
local MainTab = Window:CreateTabSection("Scripts", false)
local UniversalTab = MainTab:CreateTab({ Name = "Universal", Icon = NebulaIcons:GetIcon('public', 'Material'), Columns = 1 }, "UniTab")
local UniGroup = UniversalTab:CreateGroupbox({ Name = "Universal Scripts", Column = 1 }, "UniGroup")

-- Gerar botões universais
for _, script in ipairs(UniversalScripts) do
    UniGroup:CreateButton({
        Name = script.Name,
        Icon = NebulaIcons:GetIcon(script.Icon, 'Material'),
        Tooltip = script.Tooltip or "",
        Style = script.Style or 1,
        IndicatorStyle = 2,
        Callback = function() ExecuteScript(script) end
    }, "UNI_" .. script.Name)
end

-- >> Aba do Jogo Detectado
local CurrentGameData = SupportedGames[PlaceId]
local GameTabName = CurrentGameData and CurrentGameData.Name or "Jogo Desconhecido"
local GameTabIcon = CurrentGameData and 'sports_esports' or 'error_outline'

local GameTab = MainTab:CreateTab({
    Name = GameTabName,
    Icon = NebulaIcons:GetIcon(GameTabIcon, 'Material'),
    Columns = 1
}, "GameTab")

local GameGroup = GameTab:CreateGroupbox({ Name = "Scripts para " .. GameTabName, Column = 1 }, "GameGroup")

if CurrentGameData then
    -- JOGO SUPORTADO: Carregar botões do banco de dados
    print("[BOGA HUB] Jogo suportado detectado:", GameTabName)
    local scriptsToLoad = GameScriptsDB[CurrentGameData.DatabaseKey]
    
    if scriptsToLoad then
        for _, script in ipairs(scriptsToLoad) do
            GameGroup:CreateButton({
                Name = script.Name,
                Icon = NebulaIcons:GetIcon(script.Icon or 'code', 'Material'),
                Tooltip = script.Tooltip or "",
                Style = script.Style or 1,
                IndicatorStyle = 2,
                Callback = function() ExecuteScript(script) end
            }, "GAME_" .. script.Name)
        end
    else
        GameGroup:CreateLabel({ Name = "Nenhum script encontrado na DB." })
    end
else
    -- JOGO NÃO SUPORTADO
    print("[BOGA HUB] Jogo não suportado. ID:", PlaceId)
    GameGroup:CreateLabel({ Name = "⚠️ Não Suportado" })
    GameGroup:CreateParagraph({
        Name = "Info",
        Content = "Este jogo (ID: "..PlaceId..") ainda não está na lista.\nPeça suporte no Discord."
    })
    GameGroup:CreateButton({
        Name = "Copiar ID do Jogo",
        Icon = NebulaIcons:GetIcon('content_copy', 'Material'),
        Callback = function()
            setclipboard(tostring(PlaceId))
            Notify("Copiado", "ID: " .. PlaceId, "check")
        end
    })
end

-- ==========================================
-- FINALIZAÇÃO
-- ==========================================
Notify("Boga Hub", "Carregado com sucesso!", "rocket_launch")
