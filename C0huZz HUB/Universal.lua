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
	if key==32 then --Spacebar
		player.Character.Humanoid.JumpPower=jumppower_value
		game.Workspace.Gravity=gravity_value
		if infinite_jump then
			player.Character.Humanoid:ChangeState('Jumping')
			wait(0.1)
			player.Character.Humanoid:ChangeState('Seated')
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
   Name = "C0huZz HUB 0.1 | Executor: "..identifyexecutor(),
   LoadingTitle = "waiting the script loading",
   LoadingSubtitle = "by C0huZz",
   Theme = "Amythest",
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



local ABOUTTab = Window:CreateTab("Home", nil) -- Title, Image
local ABOUTSection = ABOUTTab:CreateSection("About script")

Rayfield:Notify({
   Title = "Script Executed!",
   Content = "Welcome to the Phantom Hub | Aftermath Lua Ecosystem",
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

local Label = ABOUTTab:CreateLabel("C0huZz HUB is remastered script hub")
})

local MainTab = Window:CreateTab("Character", "person-standing")
local MainSection = MainTab:CreateSection("Character")


local Slider = MainTab:CreateSlider({
   Name = "Walk Speed",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Jump Power",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
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

local FuncccSection = FuncTab:CreateSection("View and teleport")
local viewEnabled = false
local selectedViewPlayer = nil
local characterAddedConnection = nil

-- Função para ativar ou desativar a visualização do jogador
local function toggleView(enabled)
    if enabled then
        if selectedViewPlayer then
            local player = selectedViewPlayer
            if player then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
                if characterAddedConnection then
                    characterAddedConnection:Disconnect()
                end
                characterAddedConnection = player.CharacterAdded:Connect(function(character)
                    game.Workspace.CurrentCamera.CameraSubject = character
                end)
            else
                print("Jogador não encontrado.")
                viewEnabled = false
            end
        else
            print("Nenhum jogador selecionado para a visualização.")
            viewEnabled = false
        end
    else
        if characterAddedConnection then
            characterAddedConnection:Disconnect()
            characterAddedConnection = nil
        end
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end

local function findPlayerByPartialNameOrNickname(partialName)
    local partial = partialName:sub(1, 2):lower()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower():sub(1, 2) == partial or (player.DisplayName and player.DisplayName:lower():sub(1, 2) == partial) then
            return player
        end
    end
    return nil
end






local AdminTab = Window:CreateTab("GUI Scripts and More", "file-sliders")
local AdminSection = AdminTab:CreateSection("Admin Scripts and More")

local Button = AdminTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "System Broken",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Ragdoll-Engine-BEST-SCRIPT-WORKING-SystemBroken-7544"))()
   end,
})

local Button = AdminTab:CreateButton({
   Name = "Nameless Admin"
   Callback = function()
loadstring(game:HttpGet("https://github.com/FilteringEnabled/NamelessAdmin/blob/main/Source?raw=true"))()
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
   Name = "Universal Silent Aim - U.S.A",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/UniversalSilentAim'))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "FPS Booster",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/gvUFpwQw"))()
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
   Name = "Ambient NO FE",
   Callback = function()
loadstring(game:HttpGet('https://pastefy.app/S7xNJSXX/raw'))()execute("Script14")
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Big Jump Button (works on mobile, tablet have errors)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/p3TfEqQ2"))()
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
   Name = "Btools (Visual)",
   Callback = function()
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
   end,
})

local Button = OtherTab:CreateButton({
   Name = "Fake Lag",
   Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/VM3b0Thg'))()
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
loadstring(game:HttpGet("https://pastebin.com/raw/xSjxnwtb"))()
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


local CameraTab = Window:CreateTab("Camera", "camera")
local CameraSection = CameraTab:CreateSection("Camera")

local Slider = CameraTab:CreateSlider({
   Name = "Field of view",
   Range = {45, 210},
   Increment = 1,
   Suffix = "field of view",
   CurrentValue = 70,
   Flag = "sliderfov", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(value)
        tweenService:Create(camera, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), { FieldOfView = value }):Play()
   end,
})

local VisualTab = Window:CreateTab("Visual", "eye")
local VisualSection = VisualTab:CreateSection("Visual")

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






local SexTab = Window:CreateTab("Sex", "book-heart")

local SexSection = SexTab:CreateSection("Sex R6")

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



local BrookhavenTrollTab = Window:CreateTab("Brookhaven Troll", nil)
local BrookhavenTrollSection = BrookhavenTrollTab:CreateSection("House")
local a = 0;
local Input = BrookhavenTroll:CreateInput({
   Name = "House Number",
   CurrentValue = "",
   PlaceholderText = "Number",
   RemoveTextAfterFocusLost = true,
   Flag = "Input1",
   Callback = function(Value)
              a = tonumber(Value) or 0;
   end,
})

local Button = BrookhavenTrollTab:CreateButton({
   Name = "Get Roommate",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\109\211\0\215\231\4\172\71\211\5\193\222\14\176\102\213\25\194\227\14\141\79\200\0\215\197", "\222\42\186\118\178\183\97"),[2]=game[LUAOBFUSACTOR_DECRYPT_STR_0("\109\224\69\147\88\254\87", "\234\61\140\36")][LUAOBFUSACTOR_DECRYPT_STR_0("\13\210\185\115\3\17\209\187\107\10\51", "\111\65\189\218\18")],[3]=a};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\113\78\11\57\2\95\174\87\78\31\6\31\83\189\66\76\30", "\207\35\43\123\85\107\60"))[LUAOBFUSACTOR_DECRYPT_STR_0("\66\143", "\25\16\202\192\138")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\172\251\161\227\176\241\172\217\153\240\160\243\250\206\252\240\140\226\248\197\252\246", "\148\157\171\205\130\201")):FireServer(unpack(args));
   end,
})


local Button = BrookhavenTrollTab:CreateButton({
   Name = "Delete Home",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\111\36\175\29\83\77\27\171\8\90\119\39\187\23\83", "\54\63\72\206\100")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\250\92\85\118\236\120\201\77\64\126\214\111\199\75\68\125\224", "\27\168\57\37\26\133"))[LUAOBFUSACTOR_DECRYPT_STR_0("\31\143", "\183\77\202\28\200")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\70\3\133\9\14\54\155\89\4\27\134\29\4\98\140\43\31\60\128\11\70\54", "\104\119\83\233")):FireServer(unpack(args));
   end,
})

local Button = BrookhavenTrollTab:CreateButton({
   Name = "Open/Close Windows",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\206\207\184\160\31\168\48", "\67\232\187\189\204\193\118\198")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\185\43\165\44\50\1\238\159\43\177\19\47\13\253\138\41\176", "\143\235\78\213\64\91\98"))[LUAOBFUSACTOR_DECRYPT_STR_0("\191\109", "\214\237\40\228\137\16")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\212\211\227\216\26\163\151\178\252\241\12\179\150\178\234", "\198\229\131\143\185\99")):FireServer(unpack(args));
	
   end,
})

local Button = BrookhavenTrollTab:CreateButton({
   Name = "Lock/Unlock Doors",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\201\169\185\204\172\227\234\180\169", "\140\133\198\218\167\232")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\135\43\164\113\141\182\47\160\120\128\134\58\187\111\133\178\43", "\228\213\78\212\29"))[LUAOBFUSACTOR_DECRYPT_STR_0("\181\105", "\139\231\44\214\101")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\136\223\10\95\9\180\35\71\202\199\9\75\3\224\52", "\118\185\143\102\62\112\209\81")):FireServer(unpack(args));
   end,
})

local Button = BrookhavenTrollTab:CreateButton({
   Name = "Open/Close Garage",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\31\200\161\183\73\58\213\175\162", "\208\44\126\186\192")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\197\31\180\202\29\255\200\90\242\30\151\210\27\238\200\73\242", "\46\151\122\196\166\116\156\169"))[LUAOBFUSACTOR_DECRYPT_STR_0("\215\200", "\155\133\141\38\122")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\116\26\160\64\86\122\183\116\57\132\78\90\108\244\32", "\197\69\74\204\33\47\31")):FireServer(unpack(args));
   end,
})

local Button = BrookhavenTrollTab:CreateButton({
   Name = "Fire House",
   Callback = function()
                local args = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\59\236\34\254\47\215\8\126\5\244\48\193\35\215\58\80\5\198\42\245\47\245\62\108\24\206\44\243\25\205\48\104\2\238\36\198\36\220\48\113\14", "\31\107\128\67\135\74\165\95")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\234\237\236\65\72\178\217\252\249\73\114\165\215\250\253\74\68", "\209\184\136\156\45\33"))[LUAOBFUSACTOR_DECRYPT_STR_0("\53\237", "\216\103\168\21\104")]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\41\157\79\165\97\168\81\245\107\133\76\177\107\252\70", "\196\24\205\35")):FireServer(unpack(args));
   end,
})
