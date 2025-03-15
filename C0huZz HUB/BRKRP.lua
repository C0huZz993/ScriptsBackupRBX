local copy = "https://c0huzz993.github.io/felina.github.io/"
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Sirius/request/library/sense/source.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "C0huZz HUB | Felina Edition | Executor: "..identifyexecutor(),
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

local Paragraph = ABOUTTab:CreateParagraph({Title = "Felina | 15.03.25", Content = "Разработка ХАБа прекращена навсегда. Это финал и конец личности читера. Читать больше на сайте ниже"})

local Button = ABOUTTab:CreateButton({
   Name = "Сайт (Скопировать ссылку)",
   Callback = function()
setclipboard("https://c0huzz993.github.io/felina.github.io/")
   end,
})
