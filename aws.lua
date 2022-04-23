local DiscordLib =
    loadstring(game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()

getgenv().buyEgg = false;
getgenv().autoClicker = false;
getgenv().autoMagnet = false;

local win = DiscordLib:Window("descurd :SocialCreditUp:")

local serv = win:Server("Main", "")

local tgls = serv:Channel("Toggles")

tgls:Toggle(
    "Auto-Open",
    false,
    function(bool)
        getgenv().buyEgg = bool
        if bool then
            buyEgg();
        end  
    end
)
tgls:Toggle(
    "Auto-Clicker",
    false,
    function(bool)
        getgenv().autoClicker = bool
        if bool then
            autoClicker();
        end  
    end
)
local Folder = game.Workspace.Drops
tgls:Toggle(
    "Auto-Collect",
    false,
    function(bool)
        getgenv().autoMagnet = bool
        if bool then
            autoMagnet();
            wait(5)
            for i,v in pairs(Folder:GetChildren()) do
                v:Destroy()
            end
        end  
    end
)

local drops = serv:Channel("Map Teleporter")

local drop =
    drops:Dropdown(
    "Map Teleport",
    {"Enchants", "Gold Craft", "Rainbow Craft", "Fuse Table", "Upgrader", "Leaderboards"},
    function(bool)
        if bool == "Enchants" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(686.658264, 22.3063126, 2585.24512)
        end
        if bool == "Gold Craft" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2652.89941, 22.9967861, 6174.56348)
        end
        if bool == "Rainbow Craft" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2124.47559, 21.7947121, 144.887207)
        end
        if bool == "Fuse Table" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2142.75122, 22.3146515, 5006.55322)
        end 
        if bool == "Upgrader" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(683.278625, 22.4838181, -3303.56909)
        end
        if bool == "Leaderboards" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2622.20288, 23.162878, 6128.00635)
        end
    end
)

win:Server("Main", "http://www.roblox.com/asset/?id=6031075938")

    function buyEgg()
        spawn(function()
            while getgenv().buyEgg == true do
                game:GetService("ReplicatedStorage").Knit.Services.CapsuleService.RF.OpenThree:InvokeServer("Hero")
                wait(0.5)
            end    
        end)
    end
    
    function autoMagnet()
        spawn(function()
            while getgenv().autoMagnet == true do
                game:GetService("ReplicatedStorage").Knit.Services.DropService.RE.CollectDrop:FireServer("Yen")
                game:GetService("ReplicatedStorage").Knit.Services.DropService.RE.CollectDrop:FireServer("Gems")
                wait(0.1)
            end
        end)
    end
    
    function autoClicker()
        spawn(function()
            while getgenv().autoClicker == true do
                game:GetService("ReplicatedStorage").Knit.Services.EnemyService.RF.FireDamageClicker:InvokeServer()
                wait(0.1)
            end
        end)
    end
