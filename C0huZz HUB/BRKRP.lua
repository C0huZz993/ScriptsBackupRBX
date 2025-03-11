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
   Name = "C0huZz HUB 0.2.2 | Universal | Executor: "..identifyexecutor(),
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
local Paragraph = ABOUTTab:CreateParagraph({Title = "0.2.2 | 10.03.25", Content = "Added division of HUB into games; Added back FOV slider; Flashback scripts fixed by roblox"})


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

local Toggle = FuncTab:CreateToggle({
	Name = "Infinite Jump",
	CurrentValue = false,
	Flag = "universal_infinite_jump",
	Callback = function(state)
		if state then
			player.Character.Humanoid:ChangeState('Jumping')
			wait(0.1)
			player.Character.Humanoid:ChangeState('Seated')
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
   Name = "Walk On Walls (button Z)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
   end,
})

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
   Name = "Speed Animations Changer",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/dAnuL1X3"))()
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
   Name = "Fake Lag",
   Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/VM3b0Thg'))()
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

local Button = OtherTab:CreateButton({
   Name = "FE Tools Draw",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Affexter/Programs/refs/heads/main/scripts/tooldrawFE.lua"))()
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
   Name = "Brookhaven Darkones GUI",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Brook%20Haven%20Gui'))()
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
loadstring(game:HttpGet('https://raw.githubusercontent.com/axleoislost/NullZen/main/Scp-Roleplay'))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "Slap Battles ForgeHub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "MM2 XHub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "Fling Things and P. (Key - ElysiumFTAP)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Oxwoey/ElysiumHub/main/oxwoey.lua", true))()
   end,
})

local ChatTab = Window:CreateTab("Chat", "message-square-more")
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

local HouseTab = Window:CreateTab("Brookhaven Troll", nil)
local HouseSection = HouseTab:CreateSection("House")
local a = 0;
local Input = HouseTab:CreateInput({
   Name = "House Number",
   CurrentValue = "",
   PlaceholderText = "Number",
   RemoveTextAfterFocusLost = true,
   Flag = "Input1",
   Callback = function(Value)
              a = tonumber(Value) or 0;
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Get Roommate",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\109\211\0\215\231\4\172\71\211\5\193\222\14\176\102\213\25\194\227\14\141\79\200\0\215\197", "\222\42\186\118\178\183\97"),[2]=game[LUAOBFUSACTOR_DECRYPT_STR_0("\109\224\69\147\88\254\87", "\234\61\140\36")][LUAOBFUSACTOR_DECRYPT_STR_0("\13\210\185\115\3\17\209\187\107\10\51", "\111\65\189\218\18")],[3]=a};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\113\78\11\57\2\95\174\87\78\31\6\31\83\189\66\76\30", "\207\35\43\123\85\107\60"))[LUAOBFUSACTOR_DECRYPT_STR_0("\66\143", "\25\16\202\192\138")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\172\251\161\227\176\241\172\217\153\240\160\243\250\206\252\240\140\226\248\197\252\246", "\148\157\171\205\130\201")):FireServer(unpack(args));
   end,
})

local HouseSection = HouseTab:CreateSection("Size")

local Button = HouseTab:CreateButton({
   Name = "Super Small Avatar (fly for move)",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\241\187\193\84\53\34\237\215\161\243\79\46\36\221\221\164\206", "\153\178\211\160\38\84\65"),[2]=4};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\176\14\74\39\139\8\91\63\135\15\105\63\141\25\91\44\135", "\75\226\107\58"))[LUAOBFUSACTOR_DECRYPT_STR_0("\106\251", "\173\56\190\113\26\113\162")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\154\253\33\10\227\195\219\124\22", "\151\171\190\77\101")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Default Avatar Size",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\133\190\86\193\167\181\67\214\180\133\94\201\163\131\71", "\179\198\214\55"),[2]=1};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\194\9\98\122\76\208\241\24\119\114\118\199\255\30\115\113\64", "\179\144\108\18\22\37"))[LUAOBFUSACTOR_DECRYPT_STR_0("\244\134", "\175\166\195\123\233")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\190\225\81\70\228\231\199\12\90", "\144\143\162\61\41")):FireServer(unpack(args));
   end,
})

local HouseSection = HouseTab:CreateSection("Skins for Brookhaven RP")
local Button = HouseTab:CreateButton({
   Name = "Assassin",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\61\184\36", "\98\166\88\217\86\217"),[2]=15133320948};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\196\243\105\13\143\223\247\226\124\5\181\200\249\228\120\6\131", "\188\150\150\25\97\230"))[LUAOBFUSACTOR_DECRYPT_STR_0("\232\172", "\141\186\233\63\98\108")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\160\223\60\178\36\229\187\41\151\51\240\254\45\231\55", "\69\145\138\76\214")):FireServer(unpack(args));
   end,
})


local Button = HouseTab:CreateButton({
   Name = "Small Man",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\253\172\90\94\69\223\92\219\182\120\68\69\210\79\219", "\40\190\196\59\44\36\188"),[2]={[1]=14731377941,[2]=14731377894,[3]=14731377875,[4]=14731384498,[5]=14731377938,[6]=0},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\15\81\213\183\241\61\47\41\66", "\109\92\37\188\212\154\29")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\54\234\180\207\56\89\5\251\161\199\2\78\11\253\165\196\52", "\58\100\143\196\163\81"))[LUAOBFUSACTOR_DECRYPT_STR_0("\40\103", "\110\122\34\67\195\95\41\133")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\36\144\77\75\194\116\224\73\101\196\124\182\82\68\215\36\189", "\182\21\209\59\42")):FireServer(unpack(args));
		local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\160\82\196\15", "\222\215\55\165\125\65"),[2]=6564572490};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\30\212\214\22\251\194\236\94\41\213\245\14\253\211\236\77\41", "\42\76\177\166\122\146\161\141"))[LUAOBFUSACTOR_DECRYPT_STR_0("\151\175", "\22\197\234\101\174\25")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\124\1\181\216\119\187\134\131\12\34\164\200\119\254\197", "\230\77\84\197\188\22\207\183")):FireServer(unpack(args));
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\201\24\199\229\137\179\227", "\85\153\116\166\156\236\193\144")][LUAOBFUSACTOR_DECRYPT_STR_0("\136\239\78\178\232\48\168\225\84\182\246", "\96\196\128\45\211\132")][LUAOBFUSACTOR_DECRYPT_STR_0("\22\133\122\77\211\172\160\221\39", "\184\85\237\27\63\178\207\212")][LUAOBFUSACTOR_DECRYPT_STR_0("\32\76\4\94\6\86\0\91", "\63\104\57\105")][LUAOBFUSACTOR_DECRYPT_STR_0("\60\134\168\79\56\151\161\65\15", "\36\107\231\196")] = 90;
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Headless",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\201\189\37\241\65\60\254\176\54\192\72\62\228\178\33", "\95\138\213\68\131\32"),[2]={[1]=1,[2]=1,[3]=1,[4]=1,[5]=1,[6]=134082579},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\49\251\113\83\14\50", "\22\74\72\193\35")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\30\124\244\84\37\122\229\76\41\125\215\76\35\107\229\95\41", "\56\76\25\132"))[LUAOBFUSACTOR_DECRYPT_STR_0("\108\228", "\175\62\161\203\70")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\109\252\213\18\33\61\140\209\60\39\53\218\202\29\52\109\209", "\85\92\189\163\115")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "French Fries",
   Callback = function()
               local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\81\224\197\177\10\64\109\119\250\231\171\10\77\126\119", "\25\18\136\164\195\107\35"),[2]={[1]=5392155773,[2]=5392150804,[3]=5392146467,[4]=5392152751,[5]=5392148570,[6]=1},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\234\52\243\125\87\152\219", "\216\136\77\201\47\18\220\161")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\31\233\59\214\1\223\131\57\233\47\233\28\211\144\44\235\46", "\226\77\140\75\186\104\188"))[LUAOBFUSACTOR_DECRYPT_STR_0("\139\235", "\47\217\174\176\95")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\233\252\96\3\166\85\41\52\151\207\127\5\187\90\121\119\180", "\70\216\189\22\98\210\52\24")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Korblox",
   Callback = function()
               local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\195\11\35\251\254\199\244\6\48\202\247\197\238\4\39", "\164\128\99\66\137\159"),[2]={[1]=139607770,[2]=139607625,[3]=139607570,[4]=139607718,[5]=139607673,[6]=1},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\144\179\140\37\173\243", "\222\96\233\137")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\139\182\183\19\129\240\241\173\182\163\44\156\252\226\184\180\162", "\144\217\211\199\127\232\147"))[LUAOBFUSACTOR_DECRYPT_STR_0("\202\10", "\36\152\79\94\72\181\37\98")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\134\249\81\62\195\217\22\45\248\202\78\56\222\214\70\110\219", "\95\183\184\39")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Ice Knight",
   Callback = function()
           local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\169\232\208\117\139\181\236\208\87\128\160\231\197\113", "\20\232\193\137\162"),[2]={[1]=1,[2]=139572697,[3]=139572600,[4]=139572888,[5]=139572789,[6]=139572973},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\32\198\159\148\194\168\13", "\17\66\191\165\198\135\236\119")};
	   game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\61\170\190\31\246\235\237\197\10\171\157\7\240\250\237\214\10", "\177\111\207\206\115\159\136\140"))[LUAOBFUSACTOR_DECRYPT_STR_0("\55\172", "\63\101\233\112\116\180\47")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\146\26\251\19\236\55\146\41\194\0\241\49\202\53\236\67\244", "\86\163\91\141\114\152")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Frigidus",
   Callback = function()
	local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\230\230\49\49", "\196\145\131\80\67"),[2]=48545806};
	game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\44\181\22\4\17\235\31\164\3\12\43\252\17\162\7\15\29", "\136\126\208\102\104\120"))[LUAOBFUSACTOR_DECRYPT_STR_0("\74\175", "\49\24\234\174\35\207\50\93")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\93\199\237\140\112\24\163\248\169\103\13\230\252\217\99", "\17\108\146\157\232")):FireServer(unpack(args));	
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Infernus",
   Callback = function()
	local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\49\46\36\173", "\129\70\75\69\223"),[2]=31101391};
	game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\116\206\227\229\117\236\71\223\246\237\79\251\73\217\242\238\121", "\143\38\171\147\137\28"))[LUAOBFUSACTOR_DECRYPT_STR_0("\226\167", "\180\176\226\217\147\99\131")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\130\140\63\3\210\173\126\2\242\175\46\19\210\232\61", "\103\179\217\79")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Empyreus",
   Callback = function()
		local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\230\137\47", "\58\82\131\232\93\41"),[2]=64444871};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\177\82\192\25\84\60\130\67\213\17\110\43\140\69\209\18\88", "\95\227\55\176\117\61"))[LUAOBFUSACTOR_DECRYPT_STR_0("\42\91", "\203\120\30\67\43")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\160\16\93\235\216\229\116\72\206\207\240\49\76\190\203", "\185\145\69\45\143")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Astra",
   Callback = function()
		local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\67\3\134\164", "\228\52\102\231\214\197\208"),[2]=162067148};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\44\229\101\198\227\136\24\194\27\228\70\222\229\153\24\209\27", "\182\126\128\21\170\138\235\121"))[LUAOBFUSACTOR_DECRYPT_STR_0("\185\255", "\102\235\186\85\134\230\115\80")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\6\57\46\91\115\192\115\82\45\40\94\102\213\115\69", "\66\55\108\94\63\18\180")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Violet",
   Callback = function()
	local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\71\142\63\101", "\23\48\235\94"),[2]=1402432199};
	game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\78\223\200\81\94\48\211\104\223\220\110\67\60\192\125\221\221", "\178\28\186\184\61\55\83"))[LUAOBFUSACTOR_DECRYPT_STR_0("\246\232", "\149\164\173\39\92\146\110")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\162\18\0\27\27\15\162\34\49\9\27\15\242\118\2", "\123\147\71\112\127\122")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Emerald",
   Callback = function()
		local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\76\55\173\82", "\157\59\82\204\32"),[2]=2830437685};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\10\59\243\246\224\233\210\165\61\58\208\238\230\248\210\182\61", "\209\88\94\131\154\137\138\179"))[LUAOBFUSACTOR_DECRYPT_STR_0("\26\132", "\66\72\193\164\28\126\67\81")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\182\25\184\92\39\98\182\41\137\78\39\98\230\125\186", "\22\135\76\200\56\70")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Ice",
   Callback = function()
		local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\51\10\163\85", "\39\68\111\194"),[2]=4390891467};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\228\163\247\203\112\180\215\178\226\195\74\163\217\180\230\192\124", "\215\182\198\135\167\25"))[LUAOBFUSACTOR_DECRYPT_STR_0("\191\108", "\40\237\41\138")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\150\65\234\252\75\211\37\255\217\92\198\96\251\169\88", "\42\167\20\154\152")):FireServer(unpack(args));
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Shine Time",
   Callback = function()
		local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\13\24\63\10", "\68\122\125\94\120\85\145"),[2]=1180433861};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\37\25\223\82\193\218\187\3\25\203\109\220\214\168\22\27\202", "\218\119\124\175\62\168\185"))[LUAOBFUSACTOR_DECRYPT_STR_0("\151\213", "\164\197\144\40")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\210\197\186\143\220\162\210\245\139\157\220\162\130\161\184", "\214\227\144\202\235\189")):FireServer(unpack(args));
   end,
})

local HouseSection = HouseTab:CreateSection("Teleport in Place")
local Button = HouseTab:CreateButton({
   Name = "Go to spawn",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\76\189\167\106\200\110\162", "\173\28\209\198\19")][LUAOBFUSACTOR_DECRYPT_STR_0("\89\227\180\186\121\220\187\186\108\233\165", "\219\21\140\215")][LUAOBFUSACTOR_DECRYPT_STR_0("\107\176\199\181\89\75\172\195\181", "\56\40\216\166\199")][LUAOBFUSACTOR_DECRYPT_STR_0("\14\161\24\46\40\187\28\43\20\187\26\59\22\181\7\59", "\79\70\212\117")][LUAOBFUSACTOR_DECRYPT_STR_0("\132\48\243\199\244\8", "\109\199\118\129\166\153")] = CFrame.new(4, 4, 2);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Electric",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\115\41\46\27\235\196\155", "\232\35\69\79\98\142\182")][LUAOBFUSACTOR_DECRYPT_STR_0("\85\15\28\252\117\48\19\252\96\5\13", "\157\25\96\127")][LUAOBFUSACTOR_DECRYPT_STR_0("\132\139\244\23\81\50\179\134\231", "\81\199\227\149\101\48")][LUAOBFUSACTOR_DECRYPT_STR_0("\85\71\246\16\248\137\53\191\79\93\244\5\198\135\46\175", "\219\29\50\155\113\150\230\92")][LUAOBFUSACTOR_DECRYPT_STR_0("\242\6\215\122\242\77", "\45\177\64\165\27\159\40")] = CFrame.new(236, 4, 829);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Inside Electric",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\57\9\30\47\74\186\229", "\150\105\101\127\86\47\200")][LUAOBFUSACTOR_DECRYPT_STR_0("\226\253\240\180\203\240\194\243\234\176\213", "\160\174\146\147\213\167")][LUAOBFUSACTOR_DECRYPT_STR_0("\99\236\27\86\13\66\84\225\8", "\33\32\132\122\36\108")][LUAOBFUSACTOR_DECRYPT_STR_0("\145\1\127\74\114\182\29\118\121\115\182\0\66\74\110\173", "\28\217\116\18\43")][LUAOBFUSACTOR_DECRYPT_STR_0("\241\113\196\85\221\171", "\92\178\55\182\52\176\206")] = CFrame.new(235, 5, 812);
   end,
})
local function teleportToCriminal()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\42\57\112\12\31\39\98", "\117\122\85\17")][LUAOBFUSACTOR_DECRYPT_STR_0("\164\224\41\69\170\237\132\238\51\65\180", "\189\232\143\74\36\198")][LUAOBFUSACTOR_DECRYPT_STR_0("\223\162\11\92\214\9\232\175\24", "\106\156\202\106\46\183")][LUAOBFUSACTOR_DECRYPT_STR_0("\21\12\118\50\36\50\16\127\1\37\50\13\75\50\56\41", "\74\93\121\27\83")][LUAOBFUSACTOR_DECRYPT_STR_0("\94\157\244\127\112\190", "\30\29\219\134")] = CFrame.new(-119, -28, 235);
end
local Button = HouseTab:CreateButton({
   Name = "Criminal",
   Callback = function()
teleportToCriminal();
   end,
})

local function teleportToAgencyBase1()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\107\207\87\60\94\209\69", "\69\59\163\54")][LUAOBFUSACTOR_DECRYPT_STR_0("\156\167\201\75\63\253\186\177\177\207\88", "\214\208\200\170\42\83\173")][LUAOBFUSACTOR_DECRYPT_STR_0("\250\41\115\178\116\218\53\119\178", "\21\185\65\18\192")][LUAOBFUSACTOR_DECRYPT_STR_0("\214\67\80\26\175\241\95\89\41\174\241\66\109\26\179\234", "\193\158\54\61\123")][LUAOBFUSACTOR_DECRYPT_STR_0("\22\55\50\184\56\20", "\217\85\113\64")] = CFrame.new(178, 3, -427);
end

local Button = HouseTab:CreateButton({
   Name = "Agency secret room",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\25\248\135\165\54\59\231", "\83\73\148\230\220")][LUAOBFUSACTOR_DECRYPT_STR_0("\31\208\245\225\227\185\63\222\239\229\253", "\233\83\191\150\128\143")][LUAOBFUSACTOR_DECRYPT_STR_0("\212\142\206\96\12\244\146\202\96", "\109\151\230\175\18")][LUAOBFUSACTOR_DECRYPT_STR_0("\136\239\76\69\142\175\243\69\118\143\175\238\113\69\146\180", "\224\192\154\33\36")][LUAOBFUSACTOR_DECRYPT_STR_0("\160\114\10\131\142\81", "\226\227\52\120")] = CFrame.new(-337, 17, 56);
   end,
})

local function teleportToPortalAgency()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\70\138\250\68\16\18\15", "\124\22\230\155\61\117\96")][LUAOBFUSACTOR_DECRYPT_STR_0("\233\164\229\234\242\221\249\196\178\227\249", "\149\165\203\134\139\158\141")][LUAOBFUSACTOR_DECRYPT_STR_0("\16\164\65\52\50\175\84\35\33", "\70\83\204\32")][LUAOBFUSACTOR_DECRYPT_STR_0("\38\148\6\129\0\142\2\132\60\142\4\148\62\128\25\148", "\224\110\225\107")][LUAOBFUSACTOR_DECRYPT_STR_0("\215\80\207\48\61\193", "\164\148\22\189\81\80\164")] = CFrame.new(672, 4, -296);
end

local Button = HouseTab:CreateButton({
   Name = "Portal Agency",
   Callback = function()
teleportToPortalAgency();
   end,
})

local function teleportToHospital()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\61\249\130\71\8\231\144", "\62\109\149\227")][LUAOBFUSACTOR_DECRYPT_STR_0("\223\135\138\213\12\195\132\136\205\5\225", "\96\147\232\233\180")][LUAOBFUSACTOR_DECRYPT_STR_0("\11\48\27\89\140\58\60\61\8", "\89\72\88\122\43\237")][LUAOBFUSACTOR_DECRYPT_STR_0("\4\174\168\55\21\35\178\161\4\20\35\175\149\55\9\56", "\123\76\219\197\86")][LUAOBFUSACTOR_DECRYPT_STR_0("\123\254\7\13\227\58", "\95\56\184\117\108\142")] = CFrame.new(-309, 4, 71);
end

local Button = HouseTab:CreateButton({
   Name = "Hospital",
   Callback = function()
teleportToHospital();
   end,
})

local function teleportToArch()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\220\6\246\153\211\225\93", "\46\140\106\151\224\182\147")][LUAOBFUSACTOR_DECRYPT_STR_0("\199\34\126\67\231\29\113\67\242\40\111", "\34\139\77\29")][LUAOBFUSACTOR_DECRYPT_STR_0("\147\248\28\70\40\179\228\24\70", "\73\208\144\125\52")][LUAOBFUSACTOR_DECRYPT_STR_0("\2\249\135\202\201\31\90\207\24\227\133\223\247\17\65\223", "\171\74\140\234\171\167\112\51")][LUAOBFUSACTOR_DECRYPT_STR_0("\12\40\94\94\252\168", "\205\79\110\44\63\145")] = CFrame.new(-589, 141, -59);
end

local Button = HouseTab:CreateButton({
   Name = "Arcada",
   Callback = function()
teleportToArch();
   end,
})

local function teleportToOnTopOfSchool()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\120\68\49\236\136\89\107", "\181\40\40\80\149\237\43\24")][LUAOBFUSACTOR_DECRYPT_STR_0("\57\189\38\51\182\122\30\20\171\32\32", "\114\117\210\69\82\218\42")][LUAOBFUSACTOR_DECRYPT_STR_0("\103\222\89\97\173\71\194\93\97", "\204\36\182\56\19")][LUAOBFUSACTOR_DECRYPT_STR_0("\193\94\209\130\115\55\27\237\121\211\140\105\8\19\251\95", "\114\137\43\188\227\29\88")][LUAOBFUSACTOR_DECRYPT_STR_0("\199\59\186\17\233\24", "\112\132\125\200")] = CFrame.new(-370, 50, 173);
end

local Button = HouseTab:CreateButton({
   Name = "Top of School",
   Callback = function()
teleportToOnTopOfSchool();
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Inside the apartment",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\110\204\76\72\141\76\211", "\232\62\160\45\49")][LUAOBFUSACTOR_DECRYPT_STR_0("\88\220\246\173\173\68\223\244\181\164\102", "\193\20\179\149\204")][LUAOBFUSACTOR_DECRYPT_STR_0("\244\9\128\208\214\2\149\199\197", "\162\183\97\225")][LUAOBFUSACTOR_DECRYPT_STR_0("\1\208\233\246\18\237\168\45\247\235\248\8\210\160\59\209", "\193\73\165\132\151\124\130")][LUAOBFUSACTOR_DECRYPT_STR_0("\238\228\187\90\187\179", "\214\173\162\201\59\214")] = CFrame.new(-8, 20, -161);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Cemetery",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\216\114\9\241\76\104\177", "\194\136\30\104\136\41\26")][LUAOBFUSACTOR_DECRYPT_STR_0("\240\217\0\73\24\128\165\46\197\211\17", "\79\188\182\99\40\116\208\201")][LUAOBFUSACTOR_DECRYPT_STR_0("\94\203\43\83\34\60\105\198\56", "\95\29\163\74\33\67")][LUAOBFUSACTOR_DECRYPT_STR_0("\84\39\77\54\113\133\13\120\0\79\56\107\186\5\110\38", "\100\28\82\32\87\31\234")][LUAOBFUSACTOR_DECRYPT_STR_0("\18\116\242\112\246\211", "\94\81\50\128\17\155\182\136")] = CFrame.new(-483.2502746582031, 4.351785659790039, 51.08787155151367);
   end,
})

local function teleportToMountain1()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\187\48\229\32\231\166\15", "\231\235\92\132\89\130\212\124")][LUAOBFUSACTOR_DECRYPT_STR_0("\210\187\247\62\221\117\242\181\237\58\195", "\37\158\212\148\95\177")][LUAOBFUSACTOR_DECRYPT_STR_0("\87\20\165\149\12\119\8\161\149", "\109\20\124\196\231")][LUAOBFUSACTOR_DECRYPT_STR_0("\136\168\121\164\63\47\169\185\70\170\62\52\144\188\102\177", "\64\192\221\20\197\81")][LUAOBFUSACTOR_DECRYPT_STR_0("\140\208\240\163\170\170", "\199\207\150\130\194")] = CFrame.new(-670, 251, 765);
end

local Button = HouseTab:CreateButton({
   Name = "Mountain",
   Callback = function()
teleportToMountain1();
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Safe in Bank",
   Callback = function()
                local plr = game[LUAOBFUSACTOR_DECRYPT_STR_0("\145\240\237\207\164\238\255", "\182\193\156\140")][LUAOBFUSACTOR_DECRYPT_STR_0("\237\67\21\179\234\15\205\77\15\183\244", "\95\161\44\118\210\134")];
		local char = plr[LUAOBFUSACTOR_DECRYPT_STR_0("\197\72\18\31\123\213\241\171\244", "\206\134\32\115\109\26\182\133")];
		local hrp = char[LUAOBFUSACTOR_DECRYPT_STR_0("\30\237\194\18\83\82\63\252\253\28\82\73\6\249\221\7", "\61\86\152\175\115\61")];
		hrp[LUAOBFUSACTOR_DECRYPT_STR_0("\138\39\206\49\220\132", "\167\201\97\188\80\177\225\67")] = CFrame.new(-6.593982696533203, 17.95779800415039, 269.07952880859375);
		local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\126\1\135\164\245\143\73\60\139\160\240\146", "\225\46\104\228\207\156"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\207\190\76", "\223\202\160\211\46\87\51\210")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\228\236\10\120\4\213\232\14\113\9\229\253\21\102\12\209\236", "\109\182\137\122\20"))[LUAOBFUSACTOR_DECRYPT_STR_0("\96\140", "\28\50\201\114\154\128\183\138")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\251\178\22\253\251\138", "\146\202\230\121")):InvokeServer(unpack(args));
   end,
})


local Button = HouseTab:CreateButton({
   Name = "Secret in beach",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\157\57\76\71\168\39\94", "\62\205\85\45")][LUAOBFUSACTOR_DECRYPT_STR_0("\89\3\162\168\14\185\5\116\21\164\187", "\105\21\108\193\201\98\233")][LUAOBFUSACTOR_DECRYPT_STR_0("\99\141\26\236\194\61\206\69\151", "\186\32\229\123\158\163\94")][LUAOBFUSACTOR_DECRYPT_STR_0("\44\54\124\203\23\170\62\0\17\126\197\13\149\54\22\55", "\87\100\67\17\170\121\197")][LUAOBFUSACTOR_DECRYPT_STR_0("\205\173\168\129\90\176", "\213\142\235\218\224\55")] = CFrame.new(-279, 22, 1116);
   end,
})

local function teleportToSecretLocation()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\56\174\248\220\13\176\234", "\165\104\194\153")][LUAOBFUSACTOR_DECRYPT_STR_0("\171\63\218\170\245\109\129\134\41\220\185", "\237\231\80\185\203\153\61")][LUAOBFUSACTOR_DECRYPT_STR_0("\134\56\129\96\68\166\36\133\96", "\37\197\80\224\18")][LUAOBFUSACTOR_DECRYPT_STR_0("\49\87\65\71\186\22\75\72\116\187\22\86\124\71\166\13", "\212\121\34\44\38")][LUAOBFUSACTOR_DECRYPT_STR_0("\153\156\56\4\115\168", "\62\218\218\74\101\30\205\146")] = CFrame.new(505, -75, 143);
end

local Button = HouseTab:CreateButton({
   Name = "Secret 1 (Airplane cabin)",
   Callback = function()
teleportToSecretLocation();
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Secret 2 (Cinema room)",
   Callback = function()
                local plr = game[LUAOBFUSACTOR_DECRYPT_STR_0("\148\65\63\109\207\182\94", "\170\196\45\94\20")][LUAOBFUSACTOR_DECRYPT_STR_0("\82\75\6\53\205\16\60\127\93\0\38", "\80\30\36\101\84\161\64")];
		local char = plr[LUAOBFUSACTOR_DECRYPT_STR_0("\133\89\24\80\217\56\178\84\11", "\91\198\49\121\34\184")];
		local hrp = char[LUAOBFUSACTOR_DECRYPT_STR_0("\28\211\122\184\135\59\207\115\139\134\59\210\71\184\155\32", "\233\84\166\23\217")];
		hrp[LUAOBFUSACTOR_DECRYPT_STR_0("\91\94\234\231\59\36", "\65\24\24\152\134\86")] = CFrame.new(223.24264526367188, -37.5954704284668, -153.50656127929688);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Secret 3 (City Hall roof)",
   Callback = function()
                local plr = game[LUAOBFUSACTOR_DECRYPT_STR_0("\47\25\55\81\77\109\101", "\174\127\117\86\40\40\31\22")][LUAOBFUSACTOR_DECRYPT_STR_0("\240\52\79\218\208\11\64\218\197\62\94", "\187\188\91\44")];
		local char = plr[LUAOBFUSACTOR_DECRYPT_STR_0("\60\255\127\55\227\14\11\242\108", "\109\127\151\30\69\130")];
		local hrp = char[LUAOBFUSACTOR_DECRYPT_STR_0("\250\144\122\25\203\223\187\18\224\138\120\12\245\209\160\2", "\118\178\229\23\120\165\176\210")];
		hrp[LUAOBFUSACTOR_DECRYPT_STR_0("\38\250\94\8\1\170", "\221\101\188\44\105\108\207\65")] = CFrame.new(-350.3148498535156, 45.385169982910156, -123.7399673461914);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Secret 4 (Police roof)",
   Callback = function()
                local plr = game[LUAOBFUSACTOR_DECRYPT_STR_0("\33\48\80\66\251\3\47", "\158\113\92\49\59")][LUAOBFUSACTOR_DECRYPT_STR_0("\192\127\66\113\242\54\214\6\245\117\83", "\103\140\16\33\16\158\102\186")];
		local char = plr[LUAOBFUSACTOR_DECRYPT_STR_0("\228\133\188\103\2\63\211\136\175", "\92\167\237\221\21\99")];
		local hrp = char[LUAOBFUSACTOR_DECRYPT_STR_0("\215\53\32\39\241\47\36\34\205\47\34\50\207\33\63\50", "\70\159\64\77")];
		hrp[LUAOBFUSACTOR_DECRYPT_STR_0("\244\105\64\254\23\210", "\122\183\47\50\159")] = CFrame.new(-151.79331970214844, 22.575626373291016, 7.7789154052734375);
   end,
})

local function teleportToSecretRoomInWorkshop()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\242\61\166\86\133\208\34", "\224\162\81\199\47")][LUAOBFUSACTOR_DECRYPT_STR_0("\196\74\48\60\143\216\73\50\36\134\250", "\227\136\37\83\93")][LUAOBFUSACTOR_DECRYPT_STR_0("\122\165\9\102\88\174\28\113\75", "\20\57\205\104")][LUAOBFUSACTOR_DECRYPT_STR_0("\0\190\21\184\20\85\58\44\153\23\182\14\106\50\58\191", "\83\72\203\120\217\122\58")][LUAOBFUSACTOR_DECRYPT_STR_0("\159\207\169\162\162\184", "\223\220\137\219\195\207\221")] = CFrame.new(0, 4, -495);
end

local Button = HouseTab:CreateButton({
   Name = "Secret 5 (Under map)",
   Callback = function()
teleportToSecretRoomInWorkshop();
   end,
})

local function teleportToSecretRoom2()
		game[LUAOBFUSACTOR_DECRYPT_STR_0("\104\88\216\253\180\158\198", "\181\56\52\185\132\209\236")][LUAOBFUSACTOR_DECRYPT_STR_0("\30\67\209\169\73\153\246\51\85\215\186", "\154\82\44\178\200\37\201")][LUAOBFUSACTOR_DECRYPT_STR_0("\86\227\3\31\191\75\97\112\249", "\21\21\139\98\109\222\40")][LUAOBFUSACTOR_DECRYPT_STR_0("\44\249\161\141\52\11\229\168\190\53\11\248\156\141\40\16", "\90\100\140\204\236")][LUAOBFUSACTOR_DECRYPT_STR_0("\143\50\44\205\186\29", "\120\204\116\94\172\215")] = CFrame.new(-343, 4, -613);
end

local Button = HouseTab:CreateButton({
   Name = "Secret 6 (Under map 2)",
   Callback = function()
teleportToSecretRoom2();
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Limbo platform",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\106\117\188\183\213\4\196", "\176\58\25\221\206\176\118\183")][LUAOBFUSACTOR_DECRYPT_STR_0("\30\30\218\7\226\136\62\16\192\3\252", "\216\82\113\185\102\142")][LUAOBFUSACTOR_DECRYPT_STR_0("\97\83\33\202\124\65\79\37\202", "\29\34\59\64\184")][LUAOBFUSACTOR_DECRYPT_STR_0("\58\11\69\203\59\82\27\26\122\197\58\73\34\31\90\222", "\61\114\126\40\170\85")][LUAOBFUSACTOR_DECRYPT_STR_0("\239\14\101\56\206\118", "\19\172\72\23\89\163")] = CFrame.new(17.99738883972168, -28.77614974975586, -61.85468673706055);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "X-Ray Secret room",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\66\88\24\229\119\70\10", "\156\18\52\121")][LUAOBFUSACTOR_DECRYPT_STR_0("\111\31\216\203\136\133\9\222\90\21\201", "\191\35\112\187\170\228\213\101")][LUAOBFUSACTOR_DECRYPT_STR_0("\155\167\125\71\63\31\107\189\189", "\31\216\207\28\53\94\124")][LUAOBFUSACTOR_DECRYPT_STR_0("\9\50\166\14\85\46\46\175\61\84\46\51\155\14\73\53", "\59\65\71\203\111")][LUAOBFUSACTOR_DECRYPT_STR_0("\52\134\110\117\134\9", "\84\119\192\28\20\235\108")] = CFrame.new(-57.210060119628906, -11.819289207458496, 109.7131729125976);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Under the Yacht",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\3\180\182\168\78\33\171", "\43\83\216\215\209")][LUAOBFUSACTOR_DECRYPT_STR_0("\103\168\179\10\34\123\171\177\18\43\89", "\78\43\199\208\107")][LUAOBFUSACTOR_DECRYPT_STR_0("\81\128\1\12\186\57\209\211\96", "\182\18\232\96\126\219\90\165")][LUAOBFUSACTOR_DECRYPT_STR_0("\21\75\42\169\51\81\46\172\15\81\40\188\13\95\53\188", "\200\93\62\71")][LUAOBFUSACTOR_DECRYPT_STR_0("\101\107\92\219\201\183", "\110\38\45\46\186\164\210")] = CFrame.new(-108.2221450805664, 0.3154836893081665, 873.8525390625);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Under the spawn",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\5\241\201\82\53\1\38", "\115\85\157\168\43\80")][LUAOBFUSACTOR_DECRYPT_STR_0("\211\85\132\86\128\249\74\200\230\95\149", "\169\159\58\231\55\236\169\38")][LUAOBFUSACTOR_DECRYPT_STR_0("\50\201\190\2\197\23\104\20\211", "\28\113\161\223\112\164\116")][LUAOBFUSACTOR_DECRYPT_STR_0("\238\77\74\120\85\201\81\67\75\84\201\76\119\120\73\210", "\59\166\56\39\25")][LUAOBFUSACTOR_DECRYPT_STR_0("\145\254\212\201\78\183", "\35\210\184\166\168")] = CFrame.new(-26, -8.490150451660156, 14);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Billboard 1",
   Callback = function()
                local plr = game[LUAOBFUSACTOR_DECRYPT_STR_0("\23\255\172\66\30\74\163", "\208\71\147\205\59\123\56")][LUAOBFUSACTOR_DECRYPT_STR_0("\123\47\135\185\91\16\136\185\78\37\150", "\216\55\64\228")];
		local char = plr[LUAOBFUSACTOR_DECRYPT_STR_0("\156\128\63\208\184\246\255\186\154", "\139\223\232\94\162\217\149")];
		local hrp = char[LUAOBFUSACTOR_DECRYPT_STR_0("\253\150\46\240\181\90\195\209\177\44\254\175\101\203\199\151", "\170\181\227\67\145\219\53")];
		hrp[LUAOBFUSACTOR_DECRYPT_STR_0("\122\163\12\179\84\128", "\210\57\229\126")] = CFrame.new(-242.68215942382812, 89.68680572509766, -549.6495361328125);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Billboard 2",
   Callback = function()
                local plr = game[LUAOBFUSACTOR_DECRYPT_STR_0("\205\245\246\249\248\235\228", "\128\157\153\151")][LUAOBFUSACTOR_DECRYPT_STR_0("\90\122\143\40\25\67\122\116\149\44\7", "\19\22\21\236\73\117")];
		local char = plr[LUAOBFUSACTOR_DECRYPT_STR_0("\84\205\163\187\246\190\57\243\101", "\150\23\165\194\201\151\221\77")];
		local hrp = char[LUAOBFUSACTOR_DECRYPT_STR_0("\86\46\229\27\112\52\225\30\76\52\231\14\78\58\250\14", "\122\30\91\136")];
		hrp[LUAOBFUSACTOR_DECRYPT_STR_0("\156\130\247\177\128\186", "\237\223\196\133\208")] = CFrame.new(-630.480712890625, 26.586822509765625, 365.14093017578125);
   end,
})

local Button = HouseTab:CreateButton({
   Name = "Billboard 3",
   Callback = function()
game[LUAOBFUSACTOR_DECRYPT_STR_0("\149\114\119\246\43\88\182", "\42\197\30\22\143\78")][LUAOBFUSACTOR_DECRYPT_STR_0("\95\74\92\62\127\117\83\62\106\64\77", "\95\19\37\63")][LUAOBFUSACTOR_DECRYPT_STR_0("\82\36\166\238\112\4\101\41\181", "\103\17\76\199\156\17")][LUAOBFUSACTOR_DECRYPT_STR_0("\155\63\136\233\82\31\176\254\129\37\138\252\108\17\171\238", "\154\211\74\229\136\60\112\217")][LUAOBFUSACTOR_DECRYPT_STR_0("\140\58\248\204\8\66", "\39\207\124\138\173\101")] = CFrame.new(447, 64, 510);
   end,
})
