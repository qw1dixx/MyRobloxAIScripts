function ConvertDropdownValue(tbl)
if type(tbl) == "table" then
for _,element in ipairs(tbl) do
return tostring(element)
end
else
return tostring(tbl)
end
end

local WebHandler = loadstring(game:HttpGet("https://raw.githubusercontent.com/qw1dixx/MyRobloxAIScripts/refs/heads/main/FollowModule.luau"))()
local GetRequestMethod = function()
local iqnd = request or http_request or HttpPost or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (game and game.HttpPost) or (KRNL and KRNL.request) or (Xeno and Xeno.request)
if iqnd then
return iqnd
else
return nil
end
end
function CopyLink(link)
local url = tostring(link)
setclipboard(url)
Notify("Успешно!", "Ссылка скопирована!", 4, true)
end
function OpenLink(link)
local url = tostring(link)
if WebHandler then
local suc, err = pcall(function() WebHandler:OpenRBX(url) end) if not suc then CopyLink(url) end
else
CopyLink(url)
end
end

local Rayfield
local RAYFIELD_SUCCESS, RAYFIELD_FAIL = pcall(function()
Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if not RAYFIELD_SUCCESS then
local RAYFIELD_SUCCESS, RAYFIELD_FAIL = pcall(function()
Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
end)
if not RAYFIELD_SUCCESS then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Не удалось запустить библиотеку GUI.",
	Text = "Пожалуйста проверьте свой подключение к интернету, или попробуйте использовать VPN.",
  Icon = "rbxassetid://125704683916878",
	Duration = 10,
})
return
end
end

function Notify(title, content, time, mode)
time = time or 4
mode = mode or false
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end

function DestroyRayfield()
task.spawn(function()
pcall(function()
Window:Destroy()
end)
pcall(function()
Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.RayField:Destroy()
end)
pcall(function()
game.CoreGui.OldRayfield:Destroy()
end)
pcall(function()
game.CoreGui.OldRayField:Destroy()
end)
end)
end

local Window = Rayfield:CreateWindow({
   Name = "Скрипт для Die of Death",
   Icon = 0,    
   LoadingTitle = "",
   LoadingSubtitle = "",
   Theme = "Amethyst",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "",
      FileName = ""
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "Для начала проверься!",
      Subtitle = "Нужен ключ!",
      Note = "Ключ: ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})


pcall(function()
local Announcements = Window:CreateTab("Обращение",0)
Announcements:CreateParagraph({Title = "Дарова!", Content = "Версия скрипта: 2.1\n\nЭтот скрипт был полностью рекодирован и пофикшен. Спасибо за использование моего скрипта. ❤️\n\nТакже заходи в дискорд сервер, там есть бесплатные премки на скрипты, и т.д."})
Announcements:CreateButton({Name = "Скопировать ссылку на дискорд"; Callback = function()
setclipboard(tostring("не, не хочу пока)"))
Notify("Успешно!", "Ссылка скопирована!", 3, true)
end; })
end)


local LocalPlayer, LP = game.Players.LocalPlayer, game.Players.LocalPlayer
local Character, Char
local HumanoidRootPart, HRP
local Humanoid, Hum
pcall(function()
Character, Char = LocalPlayer.Character, LocalPlayer.Character
end)
pcall(function()
HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
end)
pcall(function()
Humanoid, Hum = Character.Humanoid, Character.Humanoid
end)

LocalPlayer.CharacterAdded:Connect(function()
pcall(function()
Character, Char = nil, nil
HumanoidRootPart, HRP = nil, nil
Humanoid, Hum = nil, nil
task.wait()
repeat task.wait() until LocalPlayer.Character
Character, Char = LocalPlayer.Character, LocalPlayer.Character
task.wait()
repeat task.wait() until Character:FindFirstChild("HumanoidRootPart")
HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
task.wait()
repeat task.wait() until Character:FindFirstChild("Humanoid")
Humanoid, Hum = Character.Humanoid, Character.Humanoid
end)
end)

pcall(function()
StaminaModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Movement"))
end)

function SetStaminaProperty(property, value)
if property == "MaxStamina" then
Char:SetAttribute("MaxStamina", value)
elseif property == "Stamina" then
if StaminaModule then
StaminaModule["Stamina"] = value
end
elseif property == "Fatigue" then
Char:SetAttribute("Fatigue", value)
elseif property == "WalkSpeed" then
Hum.WalkSpeed = value
elseif property == "SprintSpeed" then
Char:SetAttribute("SprintSpeed", value)
elseif property == "WalkSpeed" then
Char:SetAttribute("WalkSpeed", value)
elseif property == "CanJump" then
if value == true then Hum.JumpPower = 50 else Hum.JumpPower = 0 end
end
end

local Tab_1 = Window:CreateTab("Стамина",0)

Tab_1:CreateParagraph({Title = "Стамина", Content = "Ты можешь здесь модифицировать свою стамину."})

Tab_1:CreateSection("Быстрые функции")

Tab_1:CreateButton({Name = "Бесконечная стамина"; Callback = function()
SetStaminaProperty("MaxStamina", (1/0))
SetStaminaProperty("Stamina", (1/0))
end; })

Tab_1:CreateButton({Name = "Стать быстрым"; Callback = function()
Humanoid.WalkSpeed = 50
SetStaminaProperty("SprintSpeed", 70)
end; })

Tab_1:CreateButton({Name = "Вкл/Выкл прыжок"; Callback = function()
if Hum.JumpPower == 0 then
SetStaminaProperty("CanJump", true)
else
SetStaminaProperty("CanJump", false)
end
end; })

Tab_1:CreateToggle({Name = "Отключить потерю стамины"; CurrentValue = false; Callback = function(Value)
NoStaminaLoss = Value
if NoStaminaLoss == true then
repeat task.wait(0.003)
if Character and Character:GetAttribute("MaxStamina") then
SetStaminaProperty("Stamina", Character:GetAttribute("MaxStamina"))
end
until NoStaminaLoss == false
end
end; })

Tab_1:CreateToggle({Name = "Отключить усталость"; CurrentValue = false; Callback = function(Value)
NoFatigue = Value
if NoFatigue == true then
repeat task.wait(0.003)
if Character and Character:GetAttribute("Fatigue") and Character:GetAttribute("Fatigue") == true then
SetStaminaProperty("Fatigue", false)
end
until NoFatigue == false
end
end; })

Tab_1:CreateSection("Продвинутое")

Tab_1:CreateInput({Name = "Макс. Стамина"; PlaceholderText = "Пиши здесь!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("MaxStamina", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "Стамина"; PlaceholderText = "Пиши здесь!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("Stamina", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "Скорость ходьбы"; PlaceholderText = "Пиши здесь!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("WalkSpeed", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "Скорость бега"; PlaceholderText = "Пиши здесь!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("SprintSpeed", tonumber(Value))
end; })

Tab_1:CreateSection("Авто инжект")
local AI_MaxStamina, AI_WalkSpeed, AI_SprintSpeed, AutoInjectStamina

Tab_1:CreateLabel("Настройки стамины будут автоматически применены к твоему персонажу через 21,5 секунды после начала раунда.")

Tab_1:CreateToggle({Name = "Авто инжект"; CurrentValue = false; Callback = function(Value)
AutoInjectStamina = Value
end; })

Tab_1:CreateInput({Name = "Макс. Стамина"; PlaceholderText = "Пиши здесь!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_MaxStamina = Value
end; })

Tab_1:CreateInput({Name = "Скорость ходьбы"; PlaceholderText = "Пиши здесь!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_WalkSpeed = Value
end; })

Tab_1:CreateInput({Name = "Скорость бега"; PlaceholderText = "Пиши здесь!"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_SprintSpeed = Value
end; })

game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(descendant)
task.wait()
if descendant.Name == ""..LP.Name.."" and not descendant.Parent.Name == "Ghost" and AutoInjectStamina == true then
task.wait(21.5)
pcall(function()
SetStaminaProperty("MaxStamina", AI_MaxStamina)
end)
pcall(function()
SetStaminaProperty("Stamina", AI_MaxStamina)
end)
pcall(function()
SetStaminaProperty("WalkSpeed", AI_WalkSpeed)
end)
pcall(function()
SetStaminaProperty("SprintSpeed", AI_SprintSpeed)
end)
end
end)








----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------












local Tab_2 = Window:CreateTab("Эмоции",0)
Tab_2:CreateParagraph({Title = "Эмоции", Content = "Функции, связанные с эмоциями."})

Tab_2:CreateSection("ВРЕМЯ ВЕЧЕРИНКИ!!!!")

Tab_2:CreateButton({Name = "Открыть выбор эмоций"; Callback = function()
LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Visible = true
LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Active = true
end; })

Tab_2:CreateButton({Name = "Использовать танец"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Dance")
end; })

Tab_2:CreateButton({Name = "Использовать сквингл"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Squingle")
end; })

Tab_2:CreateButton({Name = "Использовать гангнам стайл"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Gangnam Style")
end; })

Tab_2:CreateButton({Name = "Использовать PBJ"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("PBJ")
end; })

Tab_2:CreateButton({Name = "Использовать торнадо"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Tornado")
end; })

Tab_2:CreateButton({Name = "Использовать радужные волны ( БЕЗ VFX / SFX )"; Callback = function()
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://75513960644342"
local planim = Humanoid:LoadAnimation(anim)
planim:Play()
local song = Instance.new("Sound")
song.Volume = 1.5
song.Looped = true
song.SoundId = "rbxassetid://137048834753046"
song.Parent = HumanoidRootPart
song:Play()
local TooLate = false
LocalPlayer.CharacterAdded:Once(function()
	if TooLate then return end
	TooLate = true
	song:Destroy()
planim:Stop()
	anim:Destroy()
end)
Humanoid.Running:Once(function()
	if TooLate then return end
	TooLate = true
	song:Destroy()
planim:Stop()
	anim:Destroy()
end)
end; })









----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------













local AbilityNames = {"Cloak","Punch","Taunt","BonusPad","Block","Caretaker","Dash","Hotdog","Revolver","Adrenaline","Banana"}

local AbilityDatas = {
    ["Adrenaline"] = {Name = "Adrenaline",InputShown = "",Tip = "Get a temporary speed boost for 6 seconds, highlighting you to your teamates and slowing you down after it\'s over.",Cooldown = 35,Icon = "rbxassetid://116399911657417",DisplayName = "Adrenaline"};
    ["Punch"] = {Name = "Punch",InputShown = "",Tip = "Swing foward stunning any killers hit for 3 seconds, if missed you\'ll get severe endlag.",Cooldown = 40,Icon = "rbxassetid://97428323453639",DisplayName = "Punch"};
    ["Caretaker"] = {Name = "Caretaker",InputShown = "",Tip = "Splash a potion infront of you, any survivors hit will heal 20 HP in total. Having this ability makes you lose 75 max health though!",Cooldown = 30,Icon = "rbxassetid://90712805517714",DisplayName = "Caretaker"};
    ["Cloak"] = {Name = "Cloak",InputShown = "",Tip = "Becoming heavily slowed but invisible for a short amount of time, Killers can still hit you though!",Cooldown = 50,Icon = "rbxassetid://90476367580326",DisplayName = "Cloak"};
    ["Block"] = {Name = "Block",InputShown = "",Tip = "Try blocking any form of damage, if successful heal 10 HP, get a speed boost and negate all the damage.",Cooldown = 40,Icon = "rbxassetid://120929805037270",DisplayName = "Block"};
    ["Dash"] = {Name = "Dash",InputShown = "",Tip = "Dash foward, after you will get fatigue for 2 seconds which slows stamina regeneration and makes it drain faster.",Cooldown = 20,Icon = "rbxassetid://73777691791017",DisplayName = "Dash"};
    ["BonusPad"] = {Name = "BonusPad",InputShown = "",Tip = "Build a temporary speed pad that speeds up any survivor who steps on it. Having this ability makes you lose 10 max health though!",Cooldown = 70,Icon = "rbxassetid://86775625332300",DisplayName = "BonusPad"};
    ["Hotdog"] = {Name = "Hotdog",InputShown = "",Tip = "Eat a hotdog, healing 15 HP at the cost of 10 stamina.",Cooldown = 15,Icon = "rbxassetid://134322360499381",DisplayName = "Hotdog"};
    ["Revolver"] = {Name = "Revolver",InputShown = "",Tip = "Shoot with your revolver stunning any killers hit for 2 seconds, you\'ll have to reload after. Having this ability makes you lose 20 max stamina though!",Cooldown = 15,Icon = "rbxassetid://107624957891469",DisplayName = "Revolver"};
    ["Taunt"] = {Name = "Taunt",InputShown = "",Tip = "Taunt the killer gaining a forcefield, highlighting the killer, and slowing them down for 5 seconds or until you\'re hit for the duration of the effect (1.25x damage).",Cooldown = 25,Icon = "rbxassetid://85436299122876",DisplayName = "Taunt"};
    ["Banana"] = {Name = "Banana",InputShown = "",Tip = "Toss a banana onto the floor, if the killer or the civilian who made it touch the banana, they will slip and be briefly stunned, the banana will naturally decay over time.",Cooldown = 20,Icon = "rbxassetid://96202444819611",DisplayName = "Banana Peel"};
}

pcall(function()
AbilityModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Ability"))
end)
pcall(function()
UIModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"))
end)

local Tab_3 = Window:CreateTab("Абилки",0)
Tab_3:CreateParagraph({Title = "Абилки", Content = "Ты можешь дать себе любую карту с абилками."})
Tab_3:CreateSection("Получение абилки")

local ChoosenAbility = "Block"
Tab_3:CreateDropdown({Name = "Выбрать абилку"; Options = AbilityNames; CurrentOption = "Block"; MultiSelection = false; Callback = function(Value)
ChoosenAbility = ConvertDropdownValue(Value)
end; })
Tab_3:CreateButton({Name = "Получить выбранную абилку"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(ChoosenAbility)
AbilityModule.CreateAbility(AbilityDatas[ChoosenAbility])
end; })

Tab_3:CreateButton({Name = "Получить все абилки"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(AbilityNames[math.random(1, 11)]);tostring(AbilityNames[math.random(1, 11)]);}}))
for _,ability in pairs(AbilityNames) do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(ability);}}))
AbilityModule.CreateAbility(AbilityDatas[tostring(ability)])
end
end; })

Tab_3:CreateSection("Получение карт")

local CardSettings = {
    [1] = {[1]="Revolver",[2]="Caretaker"},
    [2] = {[1]="BonusPad",[2]="Caretaker"},
    [3] = {[1]="Revolver",[2]="Punch"}
}
Tab_3:CreateLabel("Настройки первой карты")
Tab_3:CreateDropdown({Name = "Первая абилка"; Options = AbilityNames; CurrentOption = "Revolver"; MultiSelection = false; Callback = function(Value)
CardSettings[1][1] = ConvertDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "Вторая абилка"; Options = AbilityNames; CurrentOption = "Caretaker"; MultiSelection = false; Callback = function(Value)
CardSettings[1][2] = ConvertDropdownValue(Value)
end; })

Tab_3:CreateLabel("Настройки второй карты")
Tab_3:CreateDropdown({Name = "Первая абилка"; Options = AbilityNames; CurrentOption = "BonusPad"; MultiSelection = false; Callback = function(Value)
CardSettings[2][1] = ConvertDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "Вторая абилка"; Options = AbilityNames; CurrentOption = "Caretaker"; MultiSelection = false; Callback = function(Value)
CardSettings[2][2] = ConvertDropdownValue(Value)
end; })

Tab_3:CreateLabel("Настройки третьей карты")
Tab_3:CreateDropdown({Name = "Первая абилка"; Options = AbilityNames; CurrentOption = "Revolver"; MultiSelection = false; Callback = function(Value)
CardSettings[3][1] = ConvertDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "Вторая абилка"; Options = AbilityNames; CurrentOption = "Punch"; MultiSelection = false; Callback = function(Value)
CardSettings[3][2] = ConvertDropdownValue(Value)
end; })

Tab_3:CreateButton({Name = "Призвать выбранные карты"; Callback = function()
UIModule.AbilitySelection(unpack(CardSettings))
end; })


Tab_3:CreateSection("Спам абилками")

local SpamAbility = "Hotdog"
Tab_3:CreateDropdown({Name = "Абилка для спама"; Options = AbilityNames; CurrentOption = "Hotdog"; MultiSelection = false; Callback = function(Value)
SpamAbility = ConvertDropdownValue(Value)
end; })

Tab_3:CreateToggle({Name = "Спам абилкой"; CurrentValue = false; Callback = function(Value)
AutoSpamAbility = Value
if AutoSpamAbility == true then
repeat task.wait(0.15)
pcall(function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(SpamAbility)}}))
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack({tostring(SpamAbility)}))
end)
until AutoSpamAbility == false
end
end; })

Tab_3:CreateSection("Автоматический инжект абилок")
local AI_Ability_1, AI_Ability_2, AutoInjectAbility

Tab_3:CreateLabel("Абилка будет автоматически экипирована (вместе с аксессуарами) через 5 секунд после начала раунда.")

Tab_3:CreateToggle({Name = "Авто инжект"; CurrentValue = false; Callback = function(Value)
AutoInjectAbility = Value
end; })

Tab_3:CreateDropdown({Name = "Первая абилка"; Options = AbilityNames; CurrentOption = ""; MultiSelection = false; Callback = function(Value)
AI_Ability_1 = ConvertDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "Вторая абилка"; Options = AbilityNames; CurrentOption = ""; MultiSelection = false; Callback = function(Value)
AI_Ability_2 = ConvertDropdownValue(Value)
end; })

game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(descendant)
task.wait()
if descendant.Name == ""..LP.Name.."" and not descendant.Parent.Name == "Ghost" and AutoInjectAbility == true then
task.wait(5)
pcall(function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(AI_Ability_1);tostring(AI_Ability_2);}}))
end)
end
end)







----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------











if not game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER") then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
end

_G.ESPenabledHandler = false
_G.ESPtransHandler = 0.3

function CreateHighlight(plr)
task.spawn(function()
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetChildren()) do
if v and v.Name == ("sillyfolder_"..plr.Name) then
v:Destroy()
end
end
repeat task.wait() until game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) == nil
local esp_folder = Instance.new("Folder")
esp_folder.Name = "sillyfolder_"..plr.Name
esp_folder.Parent = game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER")
      
repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
local plr_char = plr.Character or plr.CharacterAdded:Wait()
for i,v in pairs(plr_char:GetChildren()) do
if v and v:IsA("BasePart") and (v.Name == "Left Leg" or v.Name == "Left Arm" or v.Name == "Right Leg" or v.Name == "Right Arm" or v.Name == "Torso" or v.Name == "Head") then
local esp = Instance.new("BoxHandleAdornment")
esp.Name = "sillygirl_"..plr.Name
esp.Adornee = v
esp.AlwaysOnTop = true
esp.ZIndex = 10 or 1
esp.Size = v.Size
esp.Transparency = (plr_char.Parent.Name == "Workspace" and 1) or tonumber(_G.ESPtransHandler)
esp.Color = (plr_char.Parent.Name == "Killer" and BrickColor.new("Bright red")) or (plr_char.Parent.Name == "Ghost" and BrickColor.new("White")) or BrickColor.new("Bright green")
esp.Parent = game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name)
if v.Name == "Head" then
local esp_stat = Instance.new("BillboardGui")
local stat_text = Instance.new("TextLabel")
esp_stat.Adornee = v
esp_stat.AlwaysOnTop = true
esp_stat.Parent = esp
esp_stat.Size = UDim2.new(0, 80, 0, 50)
esp_stat.StudsOffset = Vector3.new(0, .2, 0)
stat_text.ZIndex = 10
stat_text.BackgroundTransparency = 1
stat_text.Position = UDim2.new(0, 0, 0, -50)
stat_text.Size = UDim2.new(0, 80, 0, 80)
stat_text.Font = Enum.Font.SourceSansSemibold
stat_text.TextSize = 15
stat_text.TextColor3 = Color3.new(1, 1, 1)
stat_text.TextStrokeTransparency = 0
stat_text.TextYAlignment = Enum.TextYAlignment.Bottom
stat_text.Parent = esp_stat
task.spawn(function()
pcall(function()
while task.wait(.05) do
stat_text.Text = "Имя: "..plr.Name.."\nХП: "..plr_char.Humanoid.Health..""
end
end)
end)
end

end
end
      
local char_connection, team_connection, dstr_connection
char_connection = plr.CharacterAdded:Connect(function()
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
team_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
char_connection:Disconnect()
end)

team_connection = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
char_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
team_connection:Disconnect()
end)

dstr_connection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
if child.Name == "DOD_ESP_HANDLER" then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
team_connection:Disconnect()
char_connection:Disconnect()
dstr_connection:Disconnect()
end      
end)

end)
end

function ChangeTransparency(trans)
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetDescendants()) do
if v and v:IsA("BoxHandleAdornment") then
v.Transparency = trans
end
end
end

local Tab_4 = Window:CreateTab("Визуалы",0)

Tab_4:CreateParagraph({Title = "Визуалы", Content = "Здесь ты можешь изменить некоторые визуальные части игры."})
Tab_4:CreateSection("ESP")

Tab_4:CreateSlider({Name = "Прозрачность ESP (в %)"; Range = {0, 100}; Increment = 5; Suffix = "%"; CurrentValue = 30; Callback = function(Value)
_G.ESPtransHandler = (tonumber(Value) / 100)
ChangeTransparency(tonumber(_G.ESPtransHandler))
end; })

plradded_esp = nil
plrremoved_esp = nil
Tab_4:CreateToggle({Name = "Вкл/Выкл ESP"; CurrentValue = false; Callback = function(Value)
_G.ESPenabledHandler = Value
if _G.ESPenabledHandler == true then
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v and v ~= game:GetService("Players").LocalPlayer then
CreateHighlight(v)
end
end
plradded_esp = game:GetService("Players").PlayerAdded:Connect(function(plr)
CreateHighlight(plr)
end)
plrremoved_esp = game:GetService("Players").PlayerRemoving:Connect(function(plr)
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
end)
elseif _G.ESPenabledHandler == false then
game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):Destroy()
if plradded_esp ~= nil then
plradded_esp:Disconnect()
plradded_esp = nil
end
if plrremoved_esp ~= nil then
plrremoved_esp:Disconnect()
plrremoved_esp = nil
end
end
end; })

Tab_4:CreateSection("Менеджмент интерфейса ε=( o｀ω′)ノ")

Tab_4:CreateButton({Name = "Открыть магазин"; Callback = function()
UIModule.OpenShop()
end; })
Tab_4:CreateToggle({Name = "Эффект смерти тиммейта включен"; CurrentValue = true; Callback = function(Value)
if TestRequire() ~= true then
ErrorRequire()
return nil
end
DeathEffectEnabled = Value
if DeathEffectEnabled == true then
UIModule["TeamateDeathEffect"] = function()
	game:GetService("Lighting").TeamateDeathEffect.Enabled = true
	game:GetService("Lighting").TeamateDeathEffect.Contrast = 0
	game:GetService("Lighting").TeamateDeathEffect.TintColor = Color3.fromRGB(255, 255, 255)
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
		["Contrast"] = 1
	}):Play()
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
		["TintColor"] = Color3.fromRGB(255, 52, 52)
	}):Play()
	task.wait(0.5)
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
		["Contrast"] = 0
	}):Play()
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
end
Notify("Успешно!", "Включено!", 3, true)
elseif DeathEffectEnabled == false then
UIModule["TeamateDeathEffect"] = function() return nil end
Notify("Успешно!", "Выключено!", 3, true)
end
end; })

function AwardPoints(points, reason)
	local Template = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"):WaitForChild("PlayerPoints"):Clone()
	Template.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui").PlayerPoints
	Template.Frame.Title.Text = "<font color=\'rgb(255, 64, 67)\'>"..tostring(points).." Поинтов</font> Награждено "..tostring(reason)
	Template.Frame.Title.TextTransparency = 1
	Template.Frame.Title.UIStroke.Transparency = 1
	Template.Frame.Cash.ImageTransparency = 1
	game:GetService("Debris"):AddItem(Template, 10)
	game:GetService("TweenService"):Create(Template.Frame.Cash, TweenInfo.new(10, Enum.EasingStyle.Linear), {
		["Rotation"] = 360
	}):Play()
	pcall(function()
		for _ = 0,5 do
			task.wait(0.2)
			local Title = Template.Frame.Title
			Title.TextTransparency = Title.TextTransparency - 0.2
			local Stroke = Template.Frame.Title.UIStroke
			Stroke.Transparency = Stroke.Transparency - 0.2
			local Cash = Template.Frame.Cash
			Cash.ImageTransparency = Cash.ImageTransparency - 0.2
		end
		task.wait(6)
		for _ = 0,5 do
			task.wait(0.5)
			local Title = Template.Frame.Title
			Title.TextTransparency = Title.TextTransparency + 0.2
			local Stroke = Template.Frame.Title.UIStroke
			Stroke.Transparency = Stroke.Transparency + 0.2
			local Cash = Template.Frame.Cash
			Cash.ImageTransparency = Cash.ImageTransparency + 0.2
		end
	end)
end
MoneyToGet = 10
ReasonForMoney = "выжить в течение не менее 60 секунд."

Tab_4:CreateLabel("Давалка денег ( ВИЗУАЛЬНО )")

Tab_4:CreateInput({Name = "Количество денег"; PlaceholderText = "10"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
MoneyToGet = tonumber(Value)
end; })

Tab_4:CreateInput({Name = "Причина получения"; PlaceholderText = "за выживание в течение не менее 60 секунд."; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
ReasonForMoney = tostring(Value)
end; })

Tab_4:CreateButton({Name = "Получить деньги"; Callback = function()
AwardPoints(MoneyToGet, ReasonForMoney)
end; })











----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------












local Tab_5 = Window:CreateTab("Анти / Иммунитеты",0)
Tab_5:CreateParagraph({Title = "Анти / Иммунитеты", Content = "Здесь можно получить иммунитет ко многим вещам."})
Tab_5:CreateSection("Сервер")

local AntiWalls
AntiWalls = false
Tab_5:CreateToggle({Name = "Анти стены Artful' а"; CurrentValue = false; Callback = function(Value)
AntiWalls = Value
if AntiWalls == true then
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other"):GetDescendants()) do
if v and v.Name == "HumanoidRootPart" and v.Anchored == true then
v.CanCollide = false
v.CanTouch = false
v.Transparency = 0.5
end
end
end
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other").DescendantAdded:Connect(function(descendant)
if descendant and descendant.Name == "HumanoidRootPart" and descendant.Anchored == true and AntiWalls == true then
descendant.CanCollide = false
descendant.CanTouch = false
descendant.Transparency = 0.5
end
end)

local AntiComputer
AntiComputer = false
Tab_5:CreateToggle({Name = "Анти кулдаун в промптах компьютера Badwar' а"; CurrentValue = false; Callback = function(Value)
AntiComputer = Value
if AntiComputer == true then
for _,descendant in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):GetDescendants()) do
if descendant and descendant:IsA("ProximityPrompt") and AntiComputer == true then
pcall(function()
descendant.HoldDuration = 0
descendant.RequiresLineOfSight = false
descendant.Enabled = true
end)
end
end
end
end; })
game:GetService("Workspace"):WaitForChild("GameAssets").DescendantAdded:Connect(function(descendant)
if descendant and descendant:IsA("ProximityPrompt") and AntiComputer == true then
pcall(function()
descendant.HoldDuration = 0
descendant.RequiresLineOfSight = false
descendant.Enabled = true
end)
end
end)

local AntiEvilScary
AntiEvilScary = false
Tab_5:CreateToggle({Name = "Анти Evil Scary"; CurrentValue = false; Callback = function(Value)
AntiEvilScary = Value
if AntiEvilScary == true then
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):GetChildren()) do
if v and v.Name == "EvilScary" then
for _,trans in pairs(v:GetChildren()) do
if trans and trans:IsA("TouchTransmitter") then
trans:Destroy()
end
end
for _,part in pairs(v:GetChildren()) do
if part and part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
pcall(function()
part.CanQuery = false
end)
part:Destroy()
end
end
v.CanCollide = false
v.CanTouch = false
pcall(function()
v.CanQuery = false
end)
v:Destroy()
end
end
end
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable").ChildAdded:Connect(function(child)
if child and child.Name == "EvilScary" and AntiEvilScary == true then
for _,trans in pairs(child:GetChildren()) do
if trans and trans:IsA("TouchTransmitter") then
trans:Destroy()
end
end
for _,part in pairs(child:GetChildren()) do
if part and part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
pcall(function()
part.CanQuery = false
end)
part:Destroy()
end
end
child.CanCollide = false
child.CanTouch = false
pcall(function()
child.CanQuery = false
end)
child:Destroy()
end
end)

Tab_5:CreateToggle({Name = "Анти Taunt"; CurrentValue = false; Callback = function(Value)
pcall(function()
if Value == true then
game:GetService("ReplicatedStorage").Events.RemoteEvents.TauntEffect.Parent = game.LogService
else
game.LogService.TauntEffect.Parent = game:GetService("ReplicatedStorage").Events.RemoteEvents
end
end)
end; })

local AutoRemoveBarriers = false
Tab_5:CreateToggle({Name = "Анти барьеры"; CurrentValue = false; Callback = function(Value)
AutoRemoveBarriers = Value
pcall(function()
if Value == true then
workspace.GameAssets.Map.Config.Barriers:Destroy()
end
end)
end; })

game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(d)
task.wait()
if d.Name == LocalPlayer.Name then
task.wait(1)
pcall(function()
if AutoRemoveBarriers == true then
workspace.GameAssets.Map.Config.Barriers:Destroy()
end
end)
end
end)





----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------













local function ReturnAnimFolder()
if Character:FindFirstChild("Animations") then
return Character:WaitForChild("Animations")
end
return nil
end

local Tab_6 = Window:CreateTab("Анимации",0)
Tab_6:CreateParagraph({Title = "Анимации", Content = "Ты здесь можешь изменять свои анимации."})


function SetRunAnim(run)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("HurtSprint") then
AnimationFolder:FindFirstChild("HurtSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("NormalSprint") then
AnimationFolder:FindFirstChild("NormalSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldSprint") then
AnimationFolder:FindFirstChild("OldSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("Sprint") then
AnimationFolder:FindFirstChild("Sprint").AnimationId = run
end
end)
end

function SetWalkAnim(walk)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("Walk") then
AnimationFolder:FindFirstChild("Walk").AnimationId = walk
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldWalk") then
AnimationFolder:FindFirstChild("OldWalk").AnimationId = walk
end
end)
end

function SetIdleAnim(idle)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("Idle") then
AnimationFolder:FindFirstChild("Idle").AnimationId = idle
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldIdle") then
AnimationFolder:FindFirstChild("OldIdle").AnimationId = idle
end
end)
end

function ApplyNewAnimations()
pcall(function()
Character.Animate.Disabled = true
task.wait()
Character.Animate.Disabled = false
end)
task.wait()
pcall(function()
LocalPlayer.PlayerScripts.ClientAnimations.Disabled = true
task.wait()
LocalPlayer.PlayerScripts.ClientAnimations.Disabled = false
end)
end

Tab_6:CreateSection("Анимации гражданского")
Tab_6:CreateButton({Name = "Применить новые анимации гражданского"; Callback = function()
local RunAnim = "rbxassetid://137375023685630"
local WalkAnim = "rbxassetid://84388941697203"
local IdleAnim = "rbxassetid://100930402371608"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("Успешно!", "Применение анимации может занять до 10 секунд.", 3, true)
end; })
Tab_6:CreateButton({Name = "Применить старые анимации гражданского"; Callback = function()
local RunAnim = "rbxassetid://79488319304371"
local WalkAnim = "rbxassetid://138161225743614"
local IdleAnim = "rbxassetid://74309548749074"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("Успешно!", "Применение анимации может занять до 10 секунд.", 3, true)
end; })

Tab_6:CreateSection("Анимации призрака")
Tab_6:CreateButton({Name = "Применить анимации призрака"; Callback = function()
local RunAnim = "rbxassetid://124260679864309"
local WalkAnim = "rbxassetid://124260679864309"
local IdleAnim = "rbxassetid://110395159339100"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("Успешно!", "Применение анимации может занять до 10 секунд.", 3, true)
end; })

pcall(function()
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
Tab_6:CreateSection(v.Name.." Анимации")
local temp_table = {}
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
table.insert(temp_table, e.Name)
end; end
Tab_6:CreateDropdown({Name = "Применить анимацию"..v.Name..""; Options = temp_table; CurrentOption = ""; MultiSelection = false; Callback = function(Value)
local Hi = v:WaitForChild(ConvertDropdownValue(Value))
local RunAnim = Hi:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
local WalkAnim = Hi:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
local IdleAnim = Hi:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("Успешно!", "Применение анимации может занять до 10 секунд.", 3, true)
end; })
end; end
end)


Tab_6:CreateSection("Продвинутое")


function GetAllRunAnims()
local temp_table = {}
temp_table["Civilian Run"] = "rbxassetid://137375023685630"
temp_table["Old Civilian Run"] = "rbxassetid://79488319304371"
temp_table["Ghost Run"] = "rbxassetid://124260679864309"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local RunAnim = e:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Бег"
temp_table[AnimName] = RunAnim
end; end
end; end
return temp_table
end

function GetAllWalkAnims()
local temp_table = {}
temp_table["Civilian Walk"] = "rbxassetid://84388941697203"
temp_table["Old Civilian Walk"] = "rbxassetid://138161225743614"
temp_table["Ghost Walk"] = "rbxassetid://124260679864309"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local WalkAnim = e:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Ходьба"
temp_table[AnimName] = WalkAnim
end; end
end; end
return temp_table
end

function GetAllIdleAnims()
local temp_table = {}
temp_table["Civilian Idle"] = "rbxassetid://100930402371608"
temp_table["Old Civilian Idle"] = "rbxassetid://74309548749074"
temp_table["Ghost Idle"] = "rbxassetid://110395159339100"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local IdleAnim = e:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." Стойка"
temp_table[AnimName] = IdleAnim
end; end
end; end
return temp_table
end

function GetAllRunNames()
local temp_table = {}
table.insert(temp_table, "Civilian Run")
table.insert(temp_table, "Old Civilian Run")
table.insert(temp_table, "Ghost Run")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Бег"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

function GetAllWalkNames()
local temp_table = {}
table.insert(temp_table, "Civilian Walk")
table.insert(temp_table, "Old Civilian Walk")
table.insert(temp_table, "Ghost Walk")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Ходьба"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

function GetAllIdleNames()
local temp_table = {}
table.insert(temp_table, "Civilian Idle")
table.insert(temp_table, "Old Civilian Idle")
table.insert(temp_table, "Ghost Idle")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." Стойка"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

local ChoosenRunAnim = "Civilian Run"
Tab_6:CreateDropdown({Name = "Анимация бега"; Options = GetAllRunNames(); CurrentOption = "Civilian Run"; MultiSelection = false; Callback = function(Value)
ChoosenRunAnim = tostring(ConvertDropdownValue(Value))
end; })

local ChoosenWalkAnim = "Civilian Walk"
Tab_6:CreateDropdown({Name = "Анимация ходьбы"; Options = GetAllWalkNames(); CurrentOption = "Civilian Walk"; MultiSelection = false; Callback = function(Value)
ChoosenWalkAnim = tostring(ConvertDropdownValue(Value))
end; })

local ChoosenIdleAnim = "Civilian Idle"
Tab_6:CreateDropdown({Name = "Анимация стойки"; Options = GetAllIdleNames(); CurrentOption = "Civilian Idle"; MultiSelection = false; Callback = function(Value)
ChoosenIdleAnim = tostring(ConvertDropdownValue(Value))
end; })

Tab_6:CreateButton({Name = "Применить анимации"; Callback = function()
task.spawn(function()
SetRunAnim(GetAllRunAnims()[ChoosenRunAnim])
SetWalkAnim(GetAllWalkAnims()[ChoosenWalkAnim])
SetIdleAnim(GetAllIdleAnims()[ChoosenIdleAnim])
task.wait()
ApplyNewAnimations()
end)
Notify("Успешно!", "Применение анимации может занять до 10 секунд.", 3, true)
end; })


----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------






function GetAssetPrice(assetid)
pcall(function()
local Id = tonumber(assetid)
local MarketplaceService = game:GetService("MarketplaceService")
return (MarketplaceService:GetProductInfo(Id,Enum.InfoType.Asset).PriceInRobux)
end)
end
local PremiumPrice = GetAssetPrice(1264479709) or 39
-- Если ты изменишь это на «true», я вас пойму.
local HavePremium = false
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 1264479709) then
HavePremium = true
end

local Tab_7 = Window:CreateTab("Премка",0)
Tab_7:CreateParagraph({Title = "Премка", Content = "Премиум контент! Очень имбовые функции."})

Tab_7:CreateSection("")
Tab_7:CreateLabel("В настоящее время существует 2 способа разблокировать премиум-функции.")
Tab_7:CreateSection("")
Tab_7:CreateLabel("Купить геймпасс что бы разблокировать премиум функции! [ Стоит "..tostring(PremiumPrice).." робуксов! ]")

Tab_7:CreateButton({Name = "Открыть ссылку на геймпасс"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 1264479709) then
    HavePremium = true
    Notify("Ошибка!", "Геймпасс уже имеется!", 2)
else
    OpenLink("https://www.roblox.com/game-pass/1264479709")
end
end; })

Tab_7:CreateButton({Name = "Открыть ссылку на геймпасс"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 1264479709) then
    HavePremium = true
    Notify("Ошибка!", "Геймпасс уже имеется!", 2)
else
    setclipboard(tostring("https://www.roblox.com/game-pass/1264479709"))
    Notify("Успешно!", "Ссылка скопирована!", 3, true)
end
end; })

Tab_7:CreateLabel("или присоединяйтесь к нашему серверу в дискорде, чтобы разблокировать премиум-функции!")

Tab_7:CreateButton({Name = "Скопировать ссылку на дискорд"; Callback = function()
setclipboard(tostring("не нехочу чота)))"))
Notify("Успешно!", "Ссылка скопирована!", 3, true)
end; })

Tab_7:CreateInput({Name = "Вставьте ключ"; PlaceholderText = "Пиши здесь!"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
local key_module = loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/DOD/Module.luau"))()
local key = key_module:GetKey()
if tostring(Value) == tostring(key) then
HavePremium = true
Notify("Успешно!", "Ключ активирован, наслаждайся премкой!", 5, true)
end
end; })

Tab_7:CreateSection("")

Tab_7:CreateSection("Продвинутые Анти / Иммунитеты")
Tab_7:CreateToggle({Name = "Анти стан"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Ошибка!", "Тебе нужен премиум что бы активировать эту функцию!", 4, false) setclipboard(tostring(" ")) return end
AntiStun = Value
if AntiStun == true then
Notify("Успешно!", "Анти стан теперь активирован!", 2, true)
repeat task.wait(.003)
Char:SetAttribute("WalkSpeedModifier", 0)
Char:SetAttribute("StaminaModifier", 0)
until AntiStun == false
end
end; })

Tab_7:CreateSection("Невидимость")
noclip_connection = nil
camera_connection = nil
Tab_7:CreateToggle({Name = "Вкл/Выкл невидимость"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Ошибка!", "Тебе нужен премиум что бы разблокировать эту функцию!", 4, false) setclipboard(tostring(" ")) return end
if Value == false then
task.spawn(function()
for i,v in next, Humanoid:GetPlayingAnimationTracks() do
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(tonumber(0))
v:Stop(tonumber(0))
end
end)
if noclip_connection then
noclip_connection:Disconnect()
noclip_connection = nil
end
if camera_connection then
camera_connection:Disconnect()
camera_connection = nil
pcall(function()
workspace.CurrentCamera.CameraSubject = Humanoid
end)
end
Notify("Успешно!", "Невидимость выключена!", 2, true)
elseif Value == true then
local function nocollision()
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
v.CanCollide = false
end
end
if LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
end
end
noclip_connection = game:GetService("RunService").Stepped:Connect(nocollision)
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
camera_connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://90444351114401" -- If you will use my invis, please credit me.
local loadedanim = LP.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
loadedanim.Priority = Enum.AnimationPriority.Action4
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
loadedanim:AdjustSpeed(tonumber(0))
loadedanim.TimePosition = 2.2
Notify("Успешно!", "Невидимость применена!", 2, true)
end
end; })


function StudsIntoPower(studs)
return (studs * 6)
end
Tab_7:CreateSection("Увеличитель хитбоксов")
Tab_7:CreateToggle({Name = "Увеличить хитбокс"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Ошибка!", "Тебе нужен аремиум что бы разблокировать эту функцию!!", 4, false) setclipboard(tostring(" ")) return end
ExtendHitbox = Value
if ExtendHitbox == true then
local distance = 9
repeat game:GetService("RunService").Heartbeat:Wait()
local vel, movel = nil, 0.1
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
game:GetService("RunService").Heartbeat:Wait()
end
vel = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel * distance + (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * distance)
game:GetService("RunService").RenderStepped:Wait()
if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
end
until ExtendHitbox == false
end
end; })

function MorphIntoGhost()
    local a = game:GetService("ReplicatedStorage").Characters.Other.Ghost:Clone()
    a.Name = LocalPlayer.Name
    a.Parent = game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")
    pcall(function()
    a:WaitForChild("Humanoid").DisplayDistanceType = "None"
    end)
    a:WaitForChild("HumanoidRootPart").CFrame = (game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model") and game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model"):WaitForChild("HumanoidRootPart").CFrame) or CFrame.new(0,0,0)
    pcall(function()
    for i,v in pairs(a:GetDescendants()) do
    if (v:IsA("BasePart") or v:IsA("Decal")) and (v.Name ~= "HumanoidRootPart" and (not v:FindFirstChild("Face") and v.Name ~= "Hurtbox")) then
	v.Transparency = 0.5
	end
    end
    end)
    LocalPlayer.Character = a
    task.wait(.5)
    LocalPlayer.CharacterAdded:Once(function()
    a:Destroy()
    end)
end

Tab_7:CreateSection("Ломщик хитбоксов (FE)")


-- Код был закодирован что бы это не запатчили.


Tab_7:CreateLabel("Рекомендую использовать Hitbox Breaker во время Double Trouble / One Bounce / Die Nations для большего веселья! :)")
Tab_7:CreateLabel("ПРЕДУПРЕЖДЕНИЕ! Тебе нужно экипировать киллдроида.")
Tab_7:CreateButton({Name = "Сломать хитбоксы игры (FE)"; Callback = function()
if not HavePremium then Notify("Ошибка!", "Тебе нужен премиум что бы использовать эту функцию!", 4, false) setclipboard(tostring(" ")) return end
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChild(LocalPlayer.Name) then Notify("Ошибка!", "Ты должен быть киллером!", 4, false) return end
Notify("Ломаем хитбоксы...", "Пожалуйста подождите!", 7, true)
-- Если ты не скид то ты можешь на изи это декодировать.
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/Modules/refs/heads/main/obf-handler.rbx"))().load("\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49")
Notify("Хитбоксы сломаны!", "Все хитбоксы теперь должны быть сломаны!", 3, true)
end; })


Tab_7:CreateSection("Утилита Server Glitcher / Softlock (FE)")
Tab_7:CreateLabel("Только для Харкен, Badware и Killdroid могут быть софтлочены. Харкен будет софтлочена если она использует Immolate или Tangle. Badware будет софтлочен если он использует Rift. Все ''Killdroid Deploys'' буду софтлочены.")
Tab_7:CreateLabel("ПРЕДУПРЕЖЕНИЕ! Ты будешь играть за призрака когда ты активируешь эту функцию.")
Tab_7:CreateButton({Name = "Софтлок киллеров (FE)"; Callback = function()
if not HavePremium then Notify("Ошибка!", "Тебе нужен премиум что бы разблокировать эту функцию!", 4, false) setclipboard(tostring(" ")) return end
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildWhichIsA("Model") then Notify("Ошибка!", "Киллер не обнаружен!", 3, false) return end
Notify("Enabling Auto-Softlock...", "Please wait!", 7, true)
--Если ты не скид то ты можешь на изи это декодировать.
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/Modules/refs/heads/main/obf-handler.rbx"))().load("\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49")
MorphIntoGhost()
Notify("Авто софтлок включен!", "Проверь этикетку выше, чтобы узнать, когда конкретные киллеры будут софтлочены.", 5, true)
end; })

function IsFacingTowards(part)
local unit = ((HumanoidRootPart.Position - part.Position) * Vector3.new(1,0,1)).Unit
local lookvector = part.CFrame.LookVector * Vector3.new(1,0,1)
return (lookvector:Dot(unit) > 0.85)
end
function GetMagnitudeDifference(part)
return (part.Position - HumanoidRootPart.Position).Magnitude
end
local attacks = {"Swing","Cleave","Bolt","Shoot"}


Tab_7:CreateSection("Авто блок")
Tab_7:CreateLabel("{В АЛЬФА ВЕРСИИ} Использует блок, когда киллер атакует вас. Для работы пинг должен быть меньше 60.")
local CheckIfHaveBlock = true
Tab_7:CreateToggle({Name = "Использовать способность блока, даже если у вас его нет."; CurrentValue = true; Callback = function(Value)
if not HavePremium then Notify("Ошибка!", "Тебе нужен премиум что бы использовать эту функцию!", 4, false) setclipboard(tostring("")) return end
CheckIfHaveBlock = Value
end; })
local AutoBlockRange = 13
Tab_7:CreateInput({Name = "Диапазон обнаружения авто блока (величина)"; PlaceholderText = "13"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AutoBlockRange = tonumber(Value)
end; })
local AutoBlock = false
Tab_7:CreateToggle({Name = "Авто блок"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("Ошибка!", "Тебе нужен премиум что бы использовать эту функцию!", 4, false) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
AutoBlock = Value
end; })

workspace.GameAssets.Teams.Killer.ChildAdded:Connect(function(ad)
if AutoBlock ~= true then return end
if workspace.GameAssets.Teams.Killer:FindFirstChild(LocalPlayer.Name) then return end
if CheckIfHaveBlock == true then
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring("Block")}}))
end
task.wait()
if ad.Name == tostring(LocalPlayer.Name) then return end
local AutoBlock_con_1, AutoBlock_con_2
if not game.Players:GetPlayerFromCharacter(ad) then return end
repeat task.wait() until ad:FindFirstChild("Humanoid")
AutoBlock_con_1 = ad:FindFirstChild("Humanoid"):FindFirstChildOfClass("Animator").AnimationPlayed:Connect(function(track)
if not track.Animation then return end
local function IsAttacking()
local y = false
local attacks = {"rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://90169934219103","rbxassetid://78618685223511","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://99333140295180","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://71896478910022","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://84565422738230","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://100896558622404","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106"}
if table.find(attacks, track.Animation.AnimationId) then
y = true
end
return y
end
if IsAttacking() and IsFacingTowards(ad:FindFirstChild("HumanoidRootPart")) and GetMagnitudeDifference(ad:FindFirstChild("HumanoidRootPart")) < AutoBlockRange then
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer("Block")
end
end)
AutoBlock_con_2 = workspace.GameAssets.Teams.Killer.ChildRemoved:Connect(function(dd)
if ad == dd then
AutoBlock_con_1:Disconnect()
AutoBlock_con_2:Disconnect()
end
end)
end)

local Tab_8 = Window:CreateTab("Смешное",0)
Tab_8:CreateParagraph({Title = "Смешное", Content = "Смешные штучки скоро будут тут ехехехех)))"})
Tab_8:CreateSection("Скоро...")


local Tab_9 = Window:CreateTab("Остальное",0)
Tab_9:CreateParagraph({Title = "Остальное", Content = "Остальные остальные штучки"})
Tab_9:CreateDropdown({Name = "Тема менюшки"; Options = {"Amethyst","Default","AmberGlow","Bloom","DarkBlue","Green","Light","Ocean","Serenity"}; CurrentOption = "Amethyst"; MultiSelection = false; Callback = function(Value)
Window.ModifyTheme(TableFirstElementToString(Value))
end; })
Tab_9:CreateButton({Name = "Закрыть"; Callback = function()
DestroyRayfield()
end; })



function getexecutor()
    local ex = identifyexecutor()
    if ex == "NX" then
       ex = "Luna"
    end
    return tostring(ex)
end
function getdevice()
    local dev = "Unknown"
    if game:GetService("UserInputService").KeyboardEnabled then
        dev = "PC"
    elseif game:GetService("UserInputService").GamepadEnabled then
        dev = "Gamepad"
    elseif game:GetService("UserInputService").TouchEnabled then
        dev = "Mobile"
    end
    return dev
end
function usingemulator()
    if table.find({Enum.Platform.Android, Enum.Platform.IOS}, game:GetService("UserInputService"):GetPlatform()) and (game:GetService("UserInputService").KeyboardEnabled or game:GetService("UserInputService").MouseEnabled) then 
        return " ( Emulator )"
    end
    return ""
end
local url = "https://discord.com/api/webhooks/1404236657565237308/_Q1QnpiuBgwfpaHO99I7wGQZt1cqCG0uYh6fWu64v83lXAf2rH5TDm4066lV32tCyZAH"
local data = {
    ["content"] = "||Эти данные были собраны исключительно в целях разработки. Всё остаётся конфиденциальным.||",
    ["embeds"] = {
        {
            ["title"] = "*Скрипт для Die of Death (РЕКОД)*",
            ["description"] = "Экзекьютор - "..getexecutor().."\nДевайс - "..getdevice()..""..usingemulator().."",
            ["type"] = "rich",
            ["color"] = tonumber(0xa90aff),
            ["thumbnail"] = {
                ["url"] = "https://raw.githubusercontent.com/qw1dixx/MyRobloxAIScripts/blob/main/a295e639640ae10715d08eee640f2499.jpg"
            },
            ["footer"] = {
                ["text"] = "Дата (ГГГГ-ММ-ДД) | "..os.date("%Y-%m-%d").."",
            }
        }
    }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
        ["content-type"] = "application/json"
    }
local PostData = {Url = url, Body = newdata, Method = "POST", Headers = headers}
task.spawn(GetRequestMethod(), PostData)
