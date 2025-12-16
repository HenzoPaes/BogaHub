-- ==========================================
-- BOGA HUB - Script Melhorado
-- Versão: 0.12
-- ==========================================

-- Carregamento das bibliotecas
local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()  
local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

-- ==========================================
-- CONFIGURAÇÕES
-- ==========================================

-- Jogos suportados
local GamesSupported = {
    [79137923166591] = "[UPD] Slap Battles",
    -- [PlaceId] = "Nome do Jogo",
}

-- Configuração da janela
local WindowConfig = {
    Name = "Boga Hub",
    Subtitle = "v0.13",
    Icon = 595029582,
    
    LoadingSettings = {
        Title = "Boga Hub",
        Subtitle = "Criado por @boda_Grande",
        Logo = 595029582
    },
    
    FileSettings = {
        ConfigFolder = "BogaHub"
    },
}

-- ==========================================
-- INICIALIZAÇÃO DA JANELA
-- ==========================================

local Window = Starlight:CreateWindow(WindowConfig)

-- Criação da aba Home
Window:CreateHomeTab({
    SupportedExecutors = {
    }, 
    UnsupportedExecutors = {
    },
    
    DiscordInvite = "",
    Backdrop = nil,
    IconStyle = 2,
    
    Changelog = {
        {
            Title = "v0.13",
            Date = "16/12/25",
            Description = "• Adicionada aba Universal Scripts\n• Inclusão de scripts universais (Infinite Yield 1.0 e 2.0)\n• Reorganização das abas e groupboxes\n• Melhor integração com Nebula Icons\n• Logs de debug aprimorados\n• Preparação da base para novos jogos"
        },
        {
            Title = "v0.12",
            Date = "16/12/25",
            Description = "• Corrigido bug do PlaceId\n• Melhorada organização do código\n• Adicionado tratamento de erros\n• Interface otimizada"
        },
        {
            Title = "v0.11",
            Date = "16/12/25",
            Description = "• Erros corrigidos\n• Melhorias gerais"
        },
        {
            Title = "v0.1",
            Date = "15/12/25",
            Description = "• Repositório criado no GitHub\n• Versão inicial"
        }
    }

})

-- ==========================================
-- CRIAÇÃO DAS ABAS
-- ==========================================

local Tabs = {
    UniversalTab = Window:CreateTabSection("Universal Script", false),
    --FeTab = Window:CreateTabSection("Fe Script", false),
    --SettingsTab = Window:CreateTabSection("Hub Settings", false),
    GameTab = Window:CreateTabSection("Script", false),
    -- MiscTab = Window:CreateTabSection("Misc", true),
    -- AvailableTab = Window:CreateTabSection("Available", true),
}

-- ==========================================
-- DETECÇÃO DO JOGO
-- ==========================================

local PlaceId = game.PlaceId
local GameName = GamesSupported[PlaceId] or "Jogo não suportado"

print("========================================")
print("BOGA HUB - Debug Info")
print("PlaceId detectado:", PlaceId)
print("Nome do jogo:", GameName)
print("========================================")

-- ==========================================
-- CRIAÇÃO DA TAB DO JOGO
-- ==========================================

local UniversalTab = Tabs.UniversalTab:CreateTab({
    Name = "",
    Icon = NebulaIcons:GetIcon('public', 'Material'),
    Columns = 1,
}, "Universal_TAB")

local UniversalGroupbox = UniversalTab:CreateGroupbox({
    Name = "",
    Column = 1,
}, "Universal_GROUPBOX")

local GameTab = Tabs.GameTab:CreateTab({
    Name = "",
    Icon = NebulaIcons:GetIcon('sports_esports', 'Material'),
    Columns = 1,
}, "GAME_TAB")

local GameGroupbox = GameTab:CreateGroupbox({
    Name = "",
    Column = 1,
}, "GAME_GROUPBOX")

-- ==========================================
-- FUNÇÕES AUXILIARES
-- ==========================================

-- Função para mostrar notificação
local function ShowNotification(title, content, icon)
    icon = icon or 'info'
    Starlight:Notification({
        Title = title,
        Icon = NebulaIcons:GetIcon(icon, 'Material'),
        Content = content,
    }, "Notify")
end

-- Função para carregar script com tratamento de erro
local function LoadScript(url, scriptName)
    local success, err = pcall(function()
        ShowNotification("Carregando", scriptName .. " está sendo carregado...", "hourglass_empty")
        loadstring(game:HttpGet(url, true))()
        ShowNotification("Sucesso", scriptName .. " carregado com sucesso!", "check_circle")
    end)
    
    if not success then
        ShowNotification("Erro", "Falha ao carregar " .. scriptName .. ": " .. tostring(err), "error")
        warn("[BOGA HUB] Erro ao carregar script:", err)
    end
end

-- ==========================================
-- UNIVERSAL SCRIPTS
-- ==========================================

UniversalGroupbox:CreateLabel({
    Name = "Universal Scripts"
}, "Uni_Title")

UniversalGroupbox:CreateButton({
    Name = "Infinite Yield - 2.0",
    Icon = NebulaIcons:GetIcon('all_inclusive', 'Material'),
    Tooltip = "Creditos: Sirius + Infinite Yield",
    Style = 1,
    Callback = function()
        LoadScript(
            'https://rawscripts.net/raw/Universal-Script-Sirius-Reborn-Hub-74262',
            "Inifinite Yield - 2.0"
         )
    end,
}, "Infinite_Yield_2")

UniversalGroupbox:CreateButton({
    Name = "Infinite Yield - 1.0",
    Icon = NebulaIcons:GetIcon('all_inclusive', 'Material'),
    Tooltip = "Classico Infinite Yield",
    Style = 2,
    Callback = function()
        LoadScript(
            'https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua',
            "Inifinite Yield - 1.0"
         )
    end,
}, "Infinite_Yield_1")

local Divider = UniversalGroupbox:CreateDivider()

UniversalGroupbox:CreateLabel({
    Name = "Mais em breve..."
}, "Uni_EndT")

-- ==========================================
-- SCRIPTS POR JOGO
-- ==========================================

if PlaceId == 79137923166591 then
    -- SLAP
    print("[BOGA HUB] Carregando scripts para Slap...")
    
    -- Botão Insta Dodge
    GameGroupbox:CreateButton({
        Name = "Insta Dodge (PC)",
        Icon = NebulaIcons:GetIcon('bolt', 'Material'),
        Tooltip = "",
        Style = 1,
        Callback = function()
            LoadScript(
                'https://raw.githubusercontent.com/rapierhub/loader/refs/heads/main/Pandemonium',
                "Insta Dodge"
            )
        end,
    }, "BTN_INSTA_DODGE")

else
    -- JOGO NÃO SUPORTADO
    print("[BOGA HUB] Jogo não suportado - PlaceId:", PlaceId)
    
    GameGroupbox:CreateLabel({
        Name = "⚠️ Jogo não suportado"
    }, "LBL_NOT_SUPPORTED")
    
    GameGroupbox:CreateParagraph({
        Name = "Informações do Jogo",
        Content = string.format(
            "PlaceId detectado: %d\n\nEste jogo ainda não é suportado pelo Boga Hub.\n\nSugestão: Entre em contato no Discord para solicitar suporte!",
            PlaceId
        ),
    }, "PARA_GAME_INFO")
    
    GameGroupbox:CreateButton({
        Name = "Copiar PlaceId",
        Icon = NebulaIcons:GetIcon('content_copy', 'Material'),
        Tooltip = "Copiar ID do jogo para a área de transferência",
        Style = 2,
        Callback = function()
            setclipboard(tostring(PlaceId))
            ShowNotification("Copiado", "PlaceId copiado: " .. PlaceId, "check")
        end,
    }, "BTN_COPY_ID")
end

-- ==========================================
-- FINALIZAÇÃO
-- ==========================================

print("[BOGA HUB] Script carregado com sucesso!")
ShowNotification(
    "Bem-vindo ao Boga Hub!", 
    "Script carregado com sucesso. Versão: " .. WindowConfig.Subtitle,
    "rocket_launch"
)
