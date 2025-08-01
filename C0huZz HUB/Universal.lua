bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local camera = workspace.CurrentCamera
local tweenService = game:GetService("TweenService")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Sirius/request/library/sense/source.lua'))()

autoez=false
loop_teleport=false
ambient=game.Lighting.Ambient
outdoor_ambient=game.Lighting.OutdoorAmbient
fogstart=game.Lighting.FogStart
brightness=game.Lighting.Brightness
local clocktime=game.Lighting.ClockTime
shadows=game.Lighting.GlobalShadows
mouse=game.Players.LocalPlayer:GetMouse()
camera=game.Workspace.CurrentCamera
UserInputService=game:GetService('UserInputService')
VirtualInputManager=game:GetService('VirtualInputManager')
RunService=game:GetService('RunService')
player=game.Players.LocalPlayer
walkspeed_value=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
jumppower_value=game.Players.LocalPlayer.Character.Humanoid.JumpPower
local viewEnabled = false;





-- SPEED WALK, JUMP POWER, INFINITE JUMP
mouse.KeyDown:connect(function(i)
	key=i:byte()
	for i,v in {119, 97, 115, 100} do --WASD
		if v==key then
			player.Character.Humanoid.WalkSpeed=walkspeed_value
			return
		end
	end
end)
-- CTRL TP
UserInputService.InputBegan:Connect(function(i, _)
	if i.UserInputType==Enum.UserInputType.MouseButton1 then
		if ctrl_tp and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z))
		end
	end
end)








local Window = Rayfield:CreateWindow({
   Name = "C0huZz HUB 0.2.3 | Universal | Executor: "..identifyexecutor(),
   LoadingTitle = "Wait the HUB is loading",
   LoadingSubtitle = "by C0huZz",
   Theme = "Amethyst",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "pm Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Aftermath Key System | рџЋ„",
      Subtitle = "РїСЂСѓС„Р°РЅРё С‡С‚Рѕ С‚С‹ РЅРµ С„Р°РЅС‚РѕРј ))0)",
      Note = "РєР»СЋС‡ С‚РѕР»СЊРєРѕ РґР»СЏ РїРѕР»РёСЃРјРµРЅРѕРІ",
      FileName = "ScriptHubKey1", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/texBrQXF"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})



local ABOUTTab = Window:CreateTab("News & About", "newspaper") -- Title, Image
local ABOUTSection = ABOUTTab:CreateSection("About script")

Rayfield:Notify({
   Title = "Script Executed!",
   Content = "Welcome to the C0huZz HUB",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Label = ABOUTTab:CreateLabel("C0huZz HUB is Remastered script HUB")

local ABOUTSection = ABOUTTab:CreateSection("Changelog")

local Paragraph = ABOUTTab:CreateParagraph({Title = "0.1.8 | 19.02.25", Content = "Added Changelog; Added new TP locations; Added new brook skins; Added SCPRP script to Games Tab; Added DEX"})
local Paragraph = ABOUTTab:CreateParagraph({Title = "0.2 | 20.02.25", Content = "???"})
local Paragraph = ABOUTTab:CreateParagraph({Title = "0.2.1 | 22.02.25", Content = "Added Slap Battle GUI; Added Scriptblox searcher; Added FE Black Hole; Added MM2 XHub; Added FakeChat; Added 3 new scripts; Temporarily removed FOV slider"})
local Paragraph = ABOUTTab:CreateParagraph({Title = "0.2.2 | 10.03.25", Content = "Added back FOV slider; Flashback scripts fixed by roblox"})
local Paragraph = ABOUTTab:CreateParagraph({Title = "0.2.2 | 15.07.25", Content = "Added FE Invisible script; Added Casual Stock script; I came back to the game after my account was deleted"})
local Paragraph = ABOUTTab:CreateParagraph({Title = "0.2.3 | 24.07.25", Content = "To many scripts has fixed | Reuploaded new SCP script"})


local MainTab = Window:CreateTab("Character", "person-standing")
local MainSection = MainTab:CreateSection("Character")


local SliderValue = 16 -- Начальное значение скорости

local Slider = MainTab:CreateSlider({
   Name = "Walk Speed (Default - 16)",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = SliderValue, -- Устанавливаем начальное значение
   Flag = "sliderws", -- Уникальный идентификатор для сохранения значения
   Callback = function(Value)
        SliderValue = Value -- Сохраняем значение в переменную
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local function updateSpeed()
    while true do
        wait(0.1)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = SliderValue
        end
    end
end

spawn(updateSpeed)


local Slider = MainTab:CreateSlider({
   Name = "Jump Power (Default - 50)",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 50,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

MainTab:CreateButton({
	Name='Sit',
	Callback=function()
		player.Character.Humanoid.Sit=true
	end,
})

local FuncTab = Window:CreateTab("Functions", "parentheses")
local FuncSection = FuncTab:CreateSection("ESP")

local Toggle = FuncTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
           if value then
                   Sense.teamSettings.enemy.enabled = true
                   Sense.teamSettings.enemy.box = true
                   Sense.teamSettings.friendly.enabled = true
                   Sense.teamSettings.friendly.box = true
                   Sense.Load()       
           else
               Sense.Unload()
           end
    end,
})

local Toggle = FuncTab:CreateToggle({
   Name = "Box Fill",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
           if value then
                   Sense.teamSettings.enemy.boxFill = true
                   Sense.teamSettings.friendly.boxFill = true    
           else
               Sense.teamSettings.enemy.boxFill = false
               Sense.teamSettings.enemy.boxFill = false 
           end
    end,
})

local Toggle = FuncTab:CreateToggle({
   Name = "Name",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
           if value then
                   Sense.teamSettings.enemy.name = true
                   Sense.teamSettings.friendly.name = true    
           else
               Sense.teamSettings.enemy.name = false
               Sense.teamSettings.enemy.name = false 
           end
    end,
})

local Toggle = FuncTab:CreateToggle({
   Name = "Distance",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
           if value then
                   Sense.teamSettings.enemy.distance = true
                   Sense.teamSettings.friendly.distance = true    
           else
               Sense.teamSettings.enemy.distance = false
               Sense.teamSettings.enemy.distance = false 
           end
    end,
})

local FunccSection = FuncTab:CreateSection("Functions")

local Toggle = FuncTab:CreateToggle({
	Name = "No Clip",
	CurrentValue = false,
	Flag = "universal_noclip",
	Callback = function(state)
		if state then
			noclip=RunService.Stepped:Connect(function()
				for i,v in pairs(player.Character:GetDescendants()) do
					if v:IsA('BasePart') and v.CanCollide then
						v.CanCollide=false
					end
				end
				wait()
			end)
		else
			noclip:Disconnect()
		end
	end,
})

local AdminTab = Window:CreateTab("Admin Scripts and HUBs", "file-sliders")
local AdminSection = AdminTab:CreateSection("Admin and OP Scripts")

local Button = AdminTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "System Broken",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Ragdoll-Engine-BEST-SCRIPT-WORKING-SystemBroken-7544"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "Nameless Admin",
   Callback = function()
loadstring(game:HttpGet("https://github.com/FilteringEnabled/NamelessAdmin/blob/main/Source?raw=true"))()
   end,
})

local Button = AdminTab:CreateButton({
    Name = "LHub (Скопировать в буфер обмена)",
    Callback = function()
        local textToCopy = "loadstring(game:HttpGet(('https://raw.githubusercontent.com/loothyy/scripts/refs/heads/main/lhub.lua'),true))()"
        setclipboard(textToCopy)
    end,
})

local Button = AdminTab:CreateButton({
	Name = "Sirius UI",
	Callback = function()
loadstring(game:HttpGet('https://sirius.menu/sirius'))()
    end,
})

local Button = AdminTab:CreateButton({
	Name = "Orca UI",
	Callback = function()
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
    end,
})

local Button = AdminTab:CreateButton({
	Name = "Dex",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end,
})

local OtherTab = Window:CreateTab("Universal Scripts", "file-code-2")
local OtherSection = OtherTab:CreateSection("Universal Scripts")

local Button = OtherTab:CreateButton({
   Name = "R6 script",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "FE Flip (Z and X)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/VN5rFxBE"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Jerk Off R6",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Jerk Off R15",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "AquaMatrix (Animations)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "FE SCP-096 (Required R6 Avatar)",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YsJgITXR/raw"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Change Avatar Rig (R15/R6)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/C0huZz993/ScriptsBackupRBX/refs/heads/main/CNGRIG"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "FE Seraphic Blade",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Touch Fling",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/C0huZz993/ScriptsBackupRBX/refs/heads/main/Touch-Fling"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Universal Silent Aim - U.S.A",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/UniversalSilentAim'))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Spectate GUI (By C0huZz)",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/C0huZz993/ScriptsBackupRBX/refs/heads/main/SpectateGUI'))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "FPS Booster",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/gvUFpwQw"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Flashback (E)",
    Callback = function()
        Rayfield:Notify({
            Title = "Error! Script has fixed",
            Content = "Roblox Fixed Flashback Scripts :(",
            Duration = 4, -- Duration in seconds
        })
    end,
})

local Button = OtherTab:CreateButton({
   Name = "FE Invisible (Button)",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-script-20557"))()
   end,
})

local Slider = OtherTab:CreateSlider({
   Name = "Stretched Resolution (Растяг экрана)",
   Range = {0.01, 1.00},
   Increment = 0.01,
   Suffix = "Resolution",
   CurrentValue = 1.00,
   Flag = "slidersr", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        getgenv().Resolution = {
    [".gg/scripters"] = (Value)
}

local Camera = workspace.CurrentCamera
if getgenv().gg_scripters == nil then
    game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end
getgenv().gg_scripters = "Aori0001"
   end,
})


local Button = OtherTab:CreateButton({
   Name = "Telekinesis",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/C0huZz993/ScriptsBackupRBX/refs/heads/main/Telekinesis"))()
   end,
})

local Toggle = OtherTab:CreateToggle({
	Name = "Anti-AFK",
	CurrentValue = false,
	Flag = "universal_antiafk",
	Callback=function(state)
		for i,v in pairs(getconnections(player.Idled)) do
			if state then v:Disable() end
			if not state then v:Enable() end
		end
	end,
})

local Button = OtherTab:CreateButton({
   Name = "Delete Tool (Visual)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/C0huZz993/ScriptsBackupRBX/refs/heads/main/Delete-Tool"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "TP Illusion",
   Callback = function()
loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\27\184\146\76\0\246\201\19\1\173\145\18\20\165\146\84\6\174\147\79\22\190\133\83\29\184\131\82\7\226\133\83\30\227\214\126\22\162\215\19\21\169\201\81\18\165\136\19\28\174\128\99\66\253\138\11\42\253\213\13\42\189\172\86\41\255\215\109\30\154\211\112\75\188\175\14\64\154\214\14\17\255\215\5\66\191\163\91\65\250\163\11\70\248\209\14\36\160\209\4\37\165\222\4\68\252\140\110\5\249\146\68\41\181\170\13\93\160\147\93\93\184\158\72", "\60\115\204\230")))();
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Gravity Lay GUI",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Underssky/GravityLayScript/refs/heads/main/MainGravityLay.txt"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Fly GUI V3",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Scriptblox In-Game Searcher",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "FE Black Hole (Bring Parts)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BringFlingPlayers"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Fake Chat (Nameless Admin Func.)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/C0huZz993/ScriptsBackupRBX/refs/heads/main/FakeChat"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Stare at People",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/stare"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Chat Draw",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/s5rtS3DB"))()
   end,
})

local GamesTab = Window:CreateTab("Games", "file-code-2")
local GamesSection = GamesTab:CreateSection("Games Scripts")

local Button = GamesTab:CreateButton({
   Name = "Natural Disaster Survival KaterHUB",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KaterHub-Inc/NaturalDisasterSurvival/refs/heads/main/main.lua"))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "The Rake Remastered ZeeroxHUB",
   Callback = function()
loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "Brookhaven SanderX",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sXPiterXs1111/Sanderx3.25/main/sanderxv3.25.lua"))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "SCPRP NullZen Script",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/axleoislost/Accent/refs/heads/main/Scp-Roleplay'))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "MM2 XHub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "Casual Stock ESP (by Miha)",
   Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/C0huZz993/rbxcslstck/refs/heads/main/ready.lua")))()
   end,
})

local ChatTab = Window:CreateTab("Chat", "message-circle-more")
local ChatSection = ChatTab:CreateSection("Chat Scripts")

local Button = ChatTab:CreateButton({
   Name = "Censure bypass (with le le le le)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/4QdHkUA6"))()
   end,
})

local Button = ChatTab:CreateButton({
   Name = "Censure bypass (with ich ich ich ich)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/w7qBNv2D"))()
   end,
})


local Button = ChatTab:CreateButton({
   Name = "Universal Chat Edit",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/C0huZz993/ScriptsBackupRBX/refs/heads/main/Universal%20Chat%20Editor/script'))()
   end,
})

local SkinTab = Window:CreateTab("Skin", "person-standing")
local SkinSection = SkinTab:CreateSection("Skin Scripts")

local Button = SkinTab:CreateButton({
   Name = "Headless (FE) [R6!]",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Gazer-Ha/Valiant-Ui-Lib-Gazed-/refs/heads/main/Head%20Pack'))()
   end,
})

local Button = SkinTab:CreateButton({
   Name = "soon",
   Callback = function()
print("<ANTIODER HUB NOTIFICATION> soon... :>")
   end,
})

local ServerTab = Window:CreateTab("Server", "hard-drive")
local ServerSection = ServerTab:CreateSection("Server Scripts")

local Button = ServerTab:CreateButton({
   Name = "Hop to smallest server",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/n1hPD0KN"))()
   end,
})

local Button = ServerTab:CreateButton({
   Name = "Server Saver",
   Callback = function()
loadstring(game:HttpGet(('https://pastefy.app/S7xNJSXX/raw'),true))()
   end,
})

local Button = ServerTab:CreateButton({
   Name = "Rejoin",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/wQ6GFfeG"))()
   end,
})

local Button = ServerTab:CreateButton({
   Name = "Server Hop",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/wQ6GFfeG"))()
   end,
})

local VisualTab = Window:CreateTab("Visual", "eye")
local VisualSection = VisualTab:CreateSection("FOV")

local Slider = VisualTab:CreateSlider({
   Name = "Field of view",
   Range = {45, 120},
   Increment = 1,
   Suffix = "field of view",
   CurrentValue = 70,
   Flag = "sliderfov", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
        tweenService:Create(camera, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { FieldOfView = value }):Play()
   end,
})

local VisualSection = VisualTab:CreateSection("Visuals")

local Toggle = VisualTab:CreateToggle({
	Name = "Pink Glasses",
	CurrentValue = false,
	Flag = "universal_pink_glasses",
	Callback=function(state)
		if state then
			game.Lighting.Ambient=Color3.fromRGB(225, 20, 147)
			game.Lighting.OutdoorAmbient=Color3.fromRGB(225, 20, 147)
		else
			game.Lighting.Ambient=ambient
			game.Lighting.OutdoorAmbient=outdoor_ambient
		end
	end,
})

local Toggle = VisualTab:CreateToggle({
	Name = "Remove Fog",
	CurrentValue = false,
	Flag = "universal_remove_fog",
	Callback = function(state)
		if state then
			game.Lighting.FogStart=9e9
		else
			game.Lighting.FogStart=fogstart
		end
	end,
})

local Toggle = VisualTab:CreateToggle({
	Name = "Full Brightness",
	CurrentValue = false,
	Flag = "universal_full_brightness",
	Callback = function(state)
		if state then
			game.Lighting.Brightness=2
			game.Lighting.ClockTime=14
			game.Lighting.GlobalShadows=false
			game.Lighting.OutdoorAmbient=Color3.fromRGB(128, 128, 128)
		else
			game.Lighting.Brightness=brightness
			game.Lighting.ClockTime=clocktime
			game.Lighting.GlobalShadows=shadows
			game.Lighting.OutdoorAmbient=outdoor_ambient
		end
	end,
})






local SexTab = Window:CreateTab("S*x", "book-heart")

local SexSection = SexTab:CreateSection("S*x R6")

local Button = SexTab:CreateButton({
   Name = "Bang V2",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/aPSHMV6K"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Get Banged",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zHbw7ND1"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Suck",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/SymCfnAW"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Get Suck",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/FPu4e2Qh"))()
   end,
})

local Sex1Section = SexTab:CreateSection("S*x R15")

local Button = SexTab:CreateButton({
   Name = "Bang V2",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/1ePMTt9n"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Get Banged",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/7hvcjDnW"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Suck",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/p8yxRfr4"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Get Suck",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/DyPP2tAF"))()
   end,
})

local Button = SexTab:CreateButton({
   Name = "Jerk Off",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
   end,
})
