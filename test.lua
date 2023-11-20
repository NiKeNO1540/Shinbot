--экспорт библиотек
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()

--окно
local Window = Library:CreateWindow({
    Title = 'SL2 AimBot',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

--табы
local Tabs = {
    Main = Window:AddTab('Main'),
}

--бокс группа
local LeftGroupBox = Window.Tabs.Main:AddLeftGroupbox('Rell Coin giver')

--список игроков
LeftGroupBox:AddDropdown('Usernames', {
    SpecialType = 'Player',
    Text = 'List of players',
    Tooltip = 'Select target',
    Callback = function(Username)
        getgenv().target = Username
    end
})

--кнопка (Не забудь выбрать никнейм)
local MyButton = LeftGroupBox:AddButton({
    Text = 'Enable Inf spin',
    Func = function()
        game:GetService("Players").LocalPlayer.startevent:FireServer("band", "\128")
workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = workspace[target].HumanoidRootPart.CFrame
local args = {
    [1] = "equipjutsu",
    [2] = "v",
    [3] = game:GetService("ReplicatedStorage"):WaitForChild("alljutsu"):WaitForChild("RELL"):WaitForChild("rell1")
}

game:GetService("Players").LocalPlayer:WaitForChild("startevent"):FireServer(unpack(args))
local args = {
    [1] = "key",
    [2] = "v"
}

game:GetService("Players").LocalPlayer.Character.combat.update:FireServer(unpack(args))
local args = {
    [1] = "key",
    [2] = "vend"
}

game:GetService("Players").LocalPlayer.Character.combat.update:FireServer(unpack(args))
wait(6)
local TeleportService = game:GetService("TeleportService")
TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
    DoubleClick = false,
    Tooltip = 'This is the main button'
})

--UI Settings
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox('UI Settings')
--выклбчить гуи
LeftGroupBox2:AddButton('Unload', function() Library:Unload() end)
--бинд менюшки
LeftGroupBox2:AddLabel('Menu keybind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind

--если выбранный игрок ливает
game:GetService("Players").PlayerRemoving:Connect(function(player)
    if player.Name == Options.Usernames.Value then
        Options.Usernames:SetValue()
    end
end)