--[[]]
getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Abyss Hub",
	LoadingTitle = "Abyss Hub - Key System",
	LoadingSubtitle = "Library - Rayfield UI",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "AbyssHub", -- Create a custom folder for your hub/game
		FileName = "AbyssConfig",
	},
        Discord = {
        	Enabled = false,
        	Invite = "d3gCybHBXX", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Abyss Hub",
		Subtitle = "Key System",
		Note = "Join the discord https://discord.gg/d3gCybHBXX",
		FileName = "AbyssKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
        Key = "a"
	}
})
function BABFT()
local costRarity2
local costAmount
--Tabs
local FarmingTab = Window:CreateTab("Farming", 4483362458) -- Title, Image
local ChestTab = Window:CreateTab("Chests", 4483362458) -- Title, Image
local EstimationTab = Window:CreateTab("Calculate", 4483362458) -- Title, Image
--Sections
local AutofarmSection = FarmingTab:CreateSection("Autofarm")
local ChestSection = ChestTab:CreateSection("Chests")
local EstimationSection = EstimationTab:CreateSection("Calculate")
--Labels and Paragraphs
local Paragraph = FarmingTab:CreateParagraph({Title = "Warning", Content = "The Autofarm will only be turned off after you touch the chest."})
local Label = FarmingTab:CreateLabel("Autofarm Status: Off")
--Toggles
local GoldFarm = FarmingTab:CreateToggle({
	Name = "Start Autofarming[Gold]",
	CurrentValue = false,
	Flag = "Autofarm1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(state)
Label:Set("Autofarm Status: On")
if state then
    getgenv().autofarmBABFT = true
    autofarmBABFT()
else
    getgenv().autofarmBABFT = false
    end
end,
})
local BlockFarm = FarmingTab:CreateToggle({
	Name = "Start Autofarming[Gold Block]",
	CurrentValue = false,
	Flag = "Autofarm2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(state)
Label:Set("Autofarm Status: On")
if state then
    getgenv().autofarmBABFT2 = true
    autofarmBABFT()
else
    getgenv().autofarmBABFT2 = false
    end
end,
})

--Dropdowns
local costRarity
local currentchest
local chestamount
local ChestRarity = ChestTab:CreateDropdown({
	Name = "Chest Rarity",
	Options = {"Common Chest","Uncommon Chest","Rare Chest","Epic Chest","Legendary Chest"},
	CurrentOption = "Common Chest",
	Flag = "ChestRarity",
	Callback = function(Option)
currentchest = Option
	end,
})
--Sliders
local AmountSlider = ChestTab:CreateSlider({
	Name = "Chest Amount",
	Range = {1, 100},
	Increment = 1,
	Suffix = "Chests",
	CurrentValue = 1,
	Flag = "ChestAmount", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(v)
chestamount = v
	end,
})
local BuyChestButton = ChestTab:CreateButton({
	Name = "Buy Chests",
	Callback = function()
		game:GetService("Workspace").ItemBoughtFromShop:InvokeServer(currentchest,chestamount)
	end,
})
local AutoChest = ChestTab:CreateToggle({
	Name = "Autobuy",
	CurrentValue = false,
	Flag = "Autochest", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(state)
        if state then
            getgenv().autochest = true
        while getgenv().autochest == true do
        game:GetService("Workspace").ItemBoughtFromShop:InvokeServer(currentchest,chestamount)
        wait(1)
        end
        else
            getgenv().autochest = false end
	end,
})
local Estimate = EstimationTab:CreateSection("Estimate Costs")
local ChestRarityCost = EstimationTab:CreateDropdown({
	Name = "Rarity(Gold)",
	Options = {"5","15","45","135","405"},
	CurrentOption = "nil",
	Flag = "ChestRarityCost", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
        costRarity = Option
	end,
})
local AmountSliderCost = EstimationTab:CreateSlider({
	Name = "Amount",
	Range = {1, 100},
	Increment = 1,
    Color = Color3.fromRGB(0, 0, 0),
	Suffix = "Chests",
	CurrentValue = 1,
	Flag = "ChestAmount", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(v)
        costAmount = v
	end,
})
--Buttons
local EstimateCostButton = EstimationTab:CreateButton({
	Name = "Estimate Cost",
	Callback = function()
local costText = "Cost"

local cost = costAmount*costRarity
print(costText, cost)
Rayfield:Notify({
    Title = "Estimated Cost:",
    Content = cost,
    Duration = 6.5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
        Ignore = {
            Name = "Okay!",
            Callback = function()
            end
		},
	},
})
	end,
})
function autofarmBABFT()
        function checkplayeralive()
            while getgenv().checkplayeralive == true do
            if game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 then
                getgenv().autofarmBABFT = false
                print("")
                print("--Player Died, restarting after 8seconds--")
                print("")
        wait(1)
                print("1")
        wait(1)
                print("2")
        wait(1)
                print("3")
        wait(1)
                print("4")
        wait(1)
                print("5")
        wait(1)
                print("6")
        wait(1)
                print("7")
        wait(1)
                print("8")
        teleportfarm()
            end
        end
        end
        function teleportfarm()
        getgenv().autofarmBABFT = true
        while getgenv().autofarmBABFT == true do
        local New_CFrame
        function waittillreward()
        if getgenv().autofarmBABFT == true then
            workspace.ClaimRiverResultsGold:FireServer()
            print("")
            print("")
            print("")
            print("-------Tweening Complete, Restarting Cycle[Must wait until respawn]-------")
            print("")
            print("")
            print("")
        else
            print("")
            print("")
            print("")
            print("-------Tweening Complete, Turning Off Auto-Farm-------")
            print("")
            print("")
            print("")
        end
        checkplayeralive()
        print("Wait[0/5] -- Takes a while because of anticheat")
        Label:Set("Autofarm Status: On(Waiting)")
        wait(3)
        checkplayeralive()
        print("Wait[1/5] -- Takes a while because of anticheat")
        checkplayeralive()
        wait(3)
        checkplayeralive()
        print("Wait[2/5] -- Takes a while because of anticheat")
        checkplayeralive()
        wait(3)
        checkplayeralive()
        print("Wait[3/5] -- Takes a while because of anticheat")
        checkplayeralive()
        wait(3)
        checkplayeralive()
        print("Wait[4/5] -- Takes a while because of anticheat")
        checkplayeralive()
        wait(3.5)
        checkplayeralive()
        print("Wait[5/5] -- Takes a while because of anticheat")
        end
        function tween()
        local ts = game:GetService("TweenService")
        local char = game.Players.LocalPlayer.Character
        
        local part = char.HumanoidRootPart
        local ti = TweenInfo.new(1, Enum.EasingStyle.Linear)
        local tp = {CFrame = New_CFrame}
        ts:Create(part, ti, tp):Play()
        end
        function location1()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage1:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage1.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            New_CFrame = y
            Label:Set("Autofarm Status: On(1)")
            if getgenv().autofarmBABFT2 == true then
            wait(0.3)
            end
        end
        function location2()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage2:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage2.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            Label:Set("Autofarm Status: On(2)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location3()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage3:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage3.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            Label:Set("Autofarm Status: On(3)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location4()
        local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage4:FindFirstChild("DarknessPart")
        local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage4.TerrainWall.StonePart
        local y = x.CFrame
        local w = z.CFrame
        New_CFrame = y
        wait(0.3)
        New_CFrame = w
        Label:Set("Autofarm Status: On(4)")
        if getgenv().autofarmBABFT2 == true then
            wait(0.3)
        else return end
        end
        function location5()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage5:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage5.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            Label:Set("Autofarm Status: On(5)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location6()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage6:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage6.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            Label:Set("Autofarm Status: On(6)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location7()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage7:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage7.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            Label:Set("Autofarm Status: On(7)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location8()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage8:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage8.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            Label:Set("Autofarm Status: On(8)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location9()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage9:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage9.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            Label:Set("Autofarm Status: On(9)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location10()
            local x = game:GetService("Workspace").BoatStages.NormalStages.CaveStage10:FindFirstChild("DarknessPart")
            local z = game:GetService("Workspace").BoatStages.NormalStages.CaveStage10.TerrainWall.StonePart
            local y = x.CFrame
            local w = z.CFrame
            New_CFrame = y
            wait(0.3)
            New_CFrame = w
            Label:Set("Autofarm Status: On(10)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location11end()
            local x = game:GetService("Workspace").BoatStages.NormalStages.TheEnd.WaterfallEnd.TerrainWall.Part
            local y = x.CFrame
            New_CFrame = y
            Label:Set("Autofarm Status: On(10.5)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location12end()
            local x = game:GetService("Workspace").BoatStages.NormalStages.TheEnd.DestroyBoatPart
            local y = x.CFrame
            New_CFrame = y
            Label:Set("Autofarm Status: On(11)")
            if getgenv().autofarmBABFT2 == true then
                wait(0.3)
            else return end
        end
        function location13chest()
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = 2
            local x = game:GetService("Workspace").BoatStages.NormalStages.TheEnd.GoldenChest.Trigger
            local y = x.CFrame
            New_CFrame = y
            Label:Set("Autofarm Status: On(Done)")
        end
        function touch()
            local part = game.Players.LocalPlayer.Character.HumanoidRootPart
            
            part.Touched:Wait()
            
            print(part)
            print("just got touched")
            
            function onPartTouched(part)
            print(part.Name)
            end
            
            part.Touched:Connect(onPartTouched)
        end
        function mainteleport()
                location1()
            tween()
        wait(1)
        checkplayeralive()
                location2()
                print("[1/13]--Tween 1 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location3()
                print("[2/13]--Tween 2 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location4()
                print("[3/13]--Tween 3 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location5()
                print("[4/13]--Tween 4 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location6()
                print("[5/13]--Tween 5 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location7()
                print("[6/13]--Tween 6 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location8()
                print("[7/13]--Tween 7 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location9()
                print("[8/13]--Tween 8 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location10()
                print("[9/13]--Tween 9 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location11end()
                print("[10/13]--Tween 10 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location11end()
                print("[11/13]--Tween 11 Complete--")
            tween()
        wait(1)
        checkplayeralive()
                location12end()
                print("[12/13]--Tween 12 Complete--")
            tween()
        wait(2)
        checkplayeralive()
                location13chest()
                print("[13/13]--Tween 13 Complete--")
            tween()
        wait(1)
        checkplayeralive()
        end
        mainteleport()
        waittillreward()
        end
        end
        getgenv().autofarmBABFT = true
        teleportfarm()
        getgenv().checkhumanoidrootpart = true
        while getgenv().checkhumanoidrootpart == true do
            checkhumanoidrootpart()
        end
end

end

function TRR()
--Tabs
local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image
local FarmingTab = Window:CreateTab("Autofarm", 4483362458) -- Title, Image
local VisualTab = Window:CreateTab("Visuals", 4483362458) -- Title, Image
local ServerTab = Window:CreateTab("Server", 4483362458) -- Title, Image
local MiscTab = Window:CreateTab("Miscellaneous", 4483362458) -- Title, Image
--Sections
local VisualSection = VisualTab:CreateSection("Visuals")
function TeleportFarm()
    if getgenv().scrapFarm == true then
        for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do -- grabs everything from workspace
            if v.ClassName == 'IntValue' and v.Parent.ClassName == 'Model' and v.Name == 'LevelVal' then
                local y = v.Parent
                local x = y:FindFirstChild("Scrap")
                local lp = game.Players.LocalPlayer.Character.HumanoidRootPart
                local newcframe = x
                lp.CFrame = newcframe.CFrame
                        firetouchinterest(lp,newcframe,0)
                    wait(1)
                wait(1)
            wait(1)
        wait(1)
    wait(0.5)
    break
            elseif getgenv().scrapFarm == false then
        break
            end
        end
    end
end
function LocationsEsp()
function PowerStationEsp()
    if getgenv().PowerStationEsp == true then
        for _,v in pairs(game:GetService("Workspace").Map.PowerStation.StationFolder.StationParts:GetChildren()) do
            if v.ClassName == 'Part' or v.ClassName == 'Model' or v.ClassName == "MeshPart" then
                local esp = Instance.new("Highlight")
                esp.Name = "locationEspPower"
                esp.FillTransparency = 0
                esp.FillColor = Color3.fromRGB(255, 255, 255)
                esp.OutlineColor = Color3.fromRGB(0, 0, 0)
                esp.OutlineTransparency = 0
                esp.Parent = v
            end
        end
    else
        for _,v in pairs(game:GetService("Workspace").Map.PowerStation.StationFolder.StationParts:GetChildren()) do
            if v:FindFirstChild("locationEspPower") then
            if v.ClassName == 'Part' or v.ClassName == 'Model' or v.ClassName == "MeshPart" then
            v.locationEspPower:Destroy()
            end
            else
            end
        end
    end
end
function ObservationTowerEsp()
        if getgenv().ObservationTowerEsp == true then
            for _,v in pairs(game:GetService("Workspace").Map.ObservationTower.Parts:GetChildren()) do
                if v.ClassName == 'Part' or v.ClassName == 'Model' then
                    local esp = Instance.new("Highlight")
                    esp.Name = "locationEspObservation"
                    esp.FillTransparency = 0
                    esp.FillColor = Color3.fromRGB(255, 255, 255)
                    esp.OutlineColor = Color3.fromRGB(0, 0, 0)
                    esp.OutlineTransparency = 0
                    esp.Parent = v
                end
            end
        else
            for _,v in pairs(game:GetService("Workspace").Map.ObservationTower.Parts:GetChildren()) do
                if v:FindFirstChild("locationEspObservation") then
                if v.ClassName == 'Part' or v.ClassName == 'Model' then
                v.locationEspObservation:Destroy()
                end
                else
                end
            end
        end
end
function SafehouseEsp() 
        if getgenv().SafehouseEsp == true then
            for _,v in pairs(game:GetService("Workspace").Map.SafeHouse.Folder:GetChildren()) do
                if v.ClassName == 'Part' or v.ClassName == 'Model' then
                    local esp = Instance.new("Highlight")
                    esp.Name = "locationEspSafehouse"
                    esp.FillTransparency = 0
                    esp.FillColor = Color3.fromRGB(255, 255, 255)
                    esp.OutlineColor = Color3.fromRGB(0, 0, 0)
                    esp.OutlineTransparency = 0
                    esp.Parent = v
                end
            end
        elseif getgenv().SafehouseEsp == false then
            for _,v in pairs(game:GetService("Workspace").Map.SafeHouse.Folder:GetChildren()) do
                if v:FindFirstChild("locationEspSafehouse") then
                if v.ClassName == 'Part' or v.ClassName == 'Model' then
                v.locationEspSafehouse:Destroy()
                end
                else
                end
            end
        end
end
function ShackEsp() 
        if getgenv().ShackEsp == true then
            for _,v in pairs(game:GetService("Workspace").Map.Shack.Parts:GetChildren()) do
                if v.ClassName == 'Part' or v.ClassName == 'Model' then
                    local esp = Instance.new("Highlight")
                    esp.Name = "locationEspShack"
                    esp.FillTransparency = 0
                    esp.FillColor = Color3.fromRGB(255, 255, 255)
                    esp.OutlineColor = Color3.fromRGB(0, 0, 0)
                    esp.OutlineTransparency = 0
                    esp.Parent = v
                end
            end
        else
            for _,v in pairs(game:GetService("Workspace").Map.Shack.Parts:GetChildren()) do
                if v:FindFirstChild("locationEspShack") then
                if v.ClassName == 'Part' or v.ClassName == 'Model' then
                v.locationEspShack:Destroy()
                end
            else
            end
            end
        end
end
function BaseCampEsp()
        if getgenv().BaseCampEsp == true then
        for _,v in pairs(game:GetService("Workspace").Map.BaseCamp.Parts:GetChildren()) do
            if v.ClassName == 'Part' or v.ClassName == 'Model' then
                local esp = Instance.new("Highlight")
                esp.Name = "locationEspBaseCamp"
                esp.FillTransparency = 0
                esp.FillColor = Color3.fromRGB(255, 255, 255)
                esp.OutlineColor = Color3.fromRGB(0, 0, 0)
                esp.OutlineTransparency = 0
                esp.Parent = v
            end
        end
    else
        for _,v in pairs(game:GetService("Workspace").Map.BaseCamp.Parts:GetChildren()) do
            if v:FindFirstChild("locationEspBaseCamp") then
            if v.ClassName == 'Part' or v.ClassName == 'Model' then
            v.locationEspBaseCamp:Destroy()
            end
            else
            end
        end
    end        
end
ShackEsp()
BaseCampEsp()
PowerStationEsp()
ObservationTowerEsp()
SafehouseEsp()
end 
function RakeEsp()
    if getgenv().RakeEsp == true then
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do -- grabs everything from workspace
        if v:FindFirstChild("Monster") and v:FindFirstChild("AttackHitbox")then
            local esp = Instance.new("Highlight")
            esp.Name = "rakeEsp"
            esp.FillTransparency = 0
            esp.FillColor = Color3.fromRGB(255, 0, 0)
            esp.OutlineColor = Color3.fromRGB(255, 255, 255)
            esp.OutlineTransparency = 0
            esp.Parent = v
        end
    end
else
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("Monster") and v:FindFirstChild("AttackHitbox") then
        v.rakeEsp:Destroy()
end
end
end
end
function PlayerEsp()
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("Downed") and v:FindFirstChild("HumanoidRootPart") then
    if getgenv().PlayerEsp == true then      
            local esp = Instance.new("Highlight")
            esp.Name = "playerEsp"
            esp.FillTransparency = 0
            esp.FillColor = Color3.fromRGB(0, 255, 0)
            esp.OutlineColor = Color3.fromRGB(255, 255, 255)
            esp.OutlineTransparency = 0
            esp.Parent = v
    else
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
     if v:FindFirstChild("Humanoid") and v:FindFirstChild("Downed") and v:FindFirstChild("HumanoidRootPart") then
    v.playerEsp:Destroy()
    end
    end
    end
    end
    end
end
function ScrapEsp()
    if getgenv().ScrapEsp == true then
    for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do -- grabs everything from workspace
        if v.ClassName == 'IntValue' and v.Parent.ClassName == 'Model' and v.Name == 'LevelVal' then
            local esp = Instance.new("Highlight")
            esp.Name = "scrapEsp"
            esp.FillTransparency = 0.5
            esp.FillColor = Color3.fromRGB(255, 165, 0)
            esp.OutlineColor = Color3.fromRGB(255, 255, 255)
            esp.OutlineTransparency = 0
            esp.Parent = v.Parent
        end
    end
else
    for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.ClassName == 'IntValue' and v.Parent.ClassName == 'Model' and v.Name == 'LevelVal' then
        v.Parent.scrapEsp:Destroy()
end
end
end
end
function SupplyEsp()
    if getgenv().SupplyEsp == true then
        for _,v in pairs(game:GetService("Workspace").Debris.SupplyCrates:GetChildren()) do
            local esp = Instance.new("Highlight")
            esp.Name = "supplyEsp"
            esp.FillTransparency = 0
            esp.FillColor = Color3.fromRGB(0, 0, 255)
            esp.OutlineColor = Color3.fromRGB(255, 255, 255)
            esp.OutlineTransparency = 0
            esp.Parent = v
        end
else
    for _,v in pairs(game:GetService("Workspace").Debris.SupplyCrates:GetChildren()) do
        if v then
        v.supplyEsp:Destroy()
end
end
end
end
function FasterSprint()
    if getgenv().FasterSprint == true then
        local Player = game:GetService'Players'.LocalPlayer;
        local UIS = game:GetService'UserInputService';
        UIS.InputBegan:connect(function(UserInput)
                if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.LeftShift then
                    getgenv().Running = true
                        while wait(0.03) and getgenv().Running == true do
        Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame + Player.Character.HumanoidRootPart.CFrame.lookVector * 0.085
        Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame + Player.Character.HumanoidRootPart.CFrame.lookVector * 0.085
        Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame + Player.Character.HumanoidRootPart.CFrame.lookVector * 0.085
        end
                end
        end)
        UIS.InputEnded:connect(function(UserInput)
                if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.LeftShift then
                        getgenv().Running = false
                end
        end)
else return end
end
function FullBright()
    local CLP = game:GetService("ReplicatedStorage").CurrentLightingProperties
    local CLP2 = game:GetService("ReplicatedStorage").CurrentLightingProperties2
    local L = game:GetService("Lighting")
    CLP.OutdoorAmbient.Value = Color3.new(1, 1, 1)
    CLP.Brightness.Value = 3
    CLP.FogColor.Value = Color3.new(1, 1, 1)
    CLP.Ambient.Value = Color3.new(1, 1, 1)
    CLP.ClockTime.Value = 12
    CLP.FogEnd.Value = 50000000000
    
    CLP2.OutdoorAmbient.Value = Color3.new(1, 1, 1)
    CLP2.Brightness.Value = 3
    CLP2.FogColor.Value = Color3.new(1, 1, 1)
    CLP2.Ambient.Value = Color3.new(1, 1, 1)
    CLP2.ClockTime.Value = 12
    CLP2.FogEnd.Value = 50000000000
    
    L.OutdoorAmbient = Color3.new(1, 1, 1)
    L.Brightness = 3
    
    L.FogColor = Color3.new(1, 1, 1)
    L.Ambient = Color3.new(1, 1, 1)
    L.ClockTime = 12
    L.FogEnd = 50000000000
end
function NotifyGrabFlare()
    local players = game:GetService("Players")
    local lplr = players.LocalPlayer
    local chr = lplr.Character
    while true do
    if getgenv().notifyflare == true then
        if game:GetService("Workspace"):FindFirstChild("FlareGunPickUp") then
            local flare = game:GetService("Workspace").FlareGunPickUp.FlareGun
            local x = flare.TouchInterest
            Rayfield:Notify({
                Title = "New Notification",
                Content = "A flare gun has just spawned",
                Duration = 5,
                Image = 4483362458,
                Actions = {
                    Teleport = {
                        Name = "Give me it!!!!",
                        Callback = function()
                            local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15,false)
                            wait(0.5)
                            local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
                            pl.CFrame = flare.CFrame
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart.game:GetService("Workspace").FlareGunPickUp.FlareGun.TouchInterest,0)
                            wait(0.5)
                            pl.CFrame = oldcframe
                            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15,true)      
                        end
                    },
                    Ignore = {
                        Name = "Fuck off",
                        Callback = function()
                        end
                    },
                },
            })
    wait(1)
    print("flare found")
    break
    else
        print("no flare found")
        wait(1)
    end
    else
        break
    end
    end
end
function NotifyRake()
    while true do
    if getgenv().notifyrake == true then
        if game:GetService("Workspace"):FindFirstChild("Rake") then
            Rayfield:Notify({
                Title = "New Notification",
                Content = "The Rake has just spawned",
                Duration = 5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "I'mma be careful...",
                        Callback = function()
                        end
                    },
                    Teleport = {
                        Name = "I'm a real man.",
                        Callback = function()
                            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15,false)
                            wait(0.5)
                            local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
                            pl.CFrame = game:GetService("Workspace"):FindFirstChild("Rake").HumanoidRootPart.CFrame
                        end
                    },
                },
            })
    wait(1)
    print("rake found")
    break
    else
        print("rake not found")
        wait(1)
    end
    else
        break
    end
    end
end
function FlareEsp()
end
function KillauraRake()
    if getgenv().killauraRake == true then
        if game:GetService("Workspace"):FindFirstChild("Rake") then
        while getgenv().killauraRake == true do
    local args = {
        [1] = "H",
        [2] = workspace.Rake.Head
    }
    
    game:GetService("Players").LocalPlayer.Character.StunStick.Event:FireServer(unpack(args))
    wait(1)
    end
    else
        getgenv().killauraRake = false
    end
end
end

--Elements
local WalkspeedSection = PlayerTab:CreateSection("Walkspeed")
local FastSprint = PlayerTab:CreateToggle({
    Name = "Faster Sprint",
    CurrentValue = false,
    Flag = "FasterSprint", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(state)
        if state then
    getgenv().FasterSprint = true
FasterSprint()
        else
    getgenv().FasterSprint = false
        end
    end,
})
local NormalEspSection = VisualTab:CreateSection("ESP's")
local RakeEspToggle = VisualTab:CreateToggle({
    Name = "Rake Esp",
    CurrentValue = false,
    Flag = "EspRake", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().RakeEsp = true
           RakeEsp()
        elseif not Value then
getgenv().RakeEsp = false
RakeEsp()
end
end,
})
local PlayerEspToggle = VisualTab:CreateToggle({
    Name = "Players Esp",
    CurrentValue = false,
    Flag = "EspPlayer",
    Callback = function(Value)
        if Value then
           getgenv().PlayerEsp = true
           PlayerEsp()
        elseif not Value then
getgenv().PlayerEsp = false
PlayerEsp()
end
end,
})
local ScrapEspToggle = VisualTab:CreateToggle({
    Name = "Scrap Esp",
    CurrentValue = false,
    Flag = "ScrapEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().ScrapEsp = true
           ScrapEsp()
        elseif not Value then
getgenv().ScrapEsp = false
ScrapEsp()
end
end,
})
local SupplyEspToggle = VisualTab:CreateToggle({
    Name = "Supply Crates Esp",
    CurrentValue = false,
    Flag = "SupplyCratesEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().SupplyEsp = true
           SupplyEsp()
        elseif not Value then
        for _,v in pairs(game:GetService("Workspace").Debris.SupplyCrates:GetChildren()) do -- grabs everything from workspace
                if v then
                    v.supplyEsp:Destroy()
    end
end
end
end,
})
local LocationsSection = VisualTab:CreateSection("Locations")
local Paragraph = VisualTab:CreateParagraph({Title = "Due to roblox's highlight limit, do not use these esp's alot.", Content = "Some ESP's won't show up if too much parts are highlighted."})
local SafehouseEsp = VisualTab:CreateToggle({
    Name = "Safehouse Esp",
    CurrentValue = false,
    Flag = "SafehouseEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().SafehouseEsp = true
           LocationsEsp()
        else
    getgenv().SafehouseEsp = false
    LocationsEsp()
end
end,
})
local BasecampEsp = VisualTab:CreateToggle({
    Name = "Basecamp Esp",
    CurrentValue = false,
    Flag = "BasecampEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().BaseCampEsp = true
           LocationsEsp()
        else
    getgenv().BaseCampEsp = false
    LocationsEsp()
end
end,
})
local PowerstationEsp = VisualTab:CreateToggle({
    Name = "Powerstation Esp",
    CurrentValue = false,
    Flag = "PowerstationEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().PowerStationEsp = true
           LocationsEsp()
        else
    getgenv().PowerStationEsp = false
    LocationsEsp()
end
end,
})
local ObservationTowerEsp = VisualTab:CreateToggle({
    Name = "Observation Tower Esp",
    CurrentValue = false,
    Flag = "ObservationTowerEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().ObservationTowerEsp = true
           LocationsEsp()
        else
    getgenv().ObservationTowerEsp = false
    LocationsEsp()
end
end,
})
local ShackEsp = VisualTab:CreateToggle({
    Name = "Shack Esp",
    CurrentValue = false,
    Flag = "ShackEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().ShackEsp = true
           LocationsEsp()
        else
    getgenv().ShackEsp = false
    LocationsEsp()
end
end,
})
local MiscSection = MiscTab:CreateSection("Miscellaneous")
local FullBrightButton = MiscTab:CreateButton({ 
    Name = "Fullbright",
    Callback = function()
                getgenv().FB = true
            while getgenv().FB == true do
FullBright()
wait()
            end
    end,
})
local NotifyFlareToggle = MiscTab:CreateToggle({
    Name = "Notify Flare",
    CurrentValue = false,
    Flag = "NotifyFlare", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            getgenv().notifyflare = true
            NotifyGrabFlare()
        else
            getgenv().notifyflare = false
        end
end,
})
local NotifyRakeToggle = MiscTab:CreateToggle({
    Name = "Notify Rake",
    CurrentValue = false,
    Flag = "NotifyRake", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            getgenv().notifyrake = true
            NotifyRake()
        else
            getgenv().notifyrake = false
        end
end,
})
local CombatSection = FarmingTab:CreateSection("Combat")
local RakestunstickAura = FarmingTab:CreateToggle({
    Name = "Stunstick Kill-Aura",
    CurrentValue = false,
    Flag = "KillauraStunstick", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            getgenv().killauraRake = true
            killauraRake()
        else
            getgenv().killauraRake = false
            killauraRake()
        end
end,
})
local FarmingSection = MiscTab:CreateSection("Farming")
local ScrapFarmToggle = FarmingTab:CreateToggle({
    Name = "Scrap Teleport",
    CurrentValue = false,
    Flag = "ScrapTeleport", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
    getgenv().scrapFarm = true
    TeleportFarm()
        else
        getgenv().scrapFarm = true
        TeleportFarm()
        end
    end,
})
--Passive Loops
local TimerSection = ServerTab:CreateSection("Timer:")
local timer = game:GetService("ReplicatedStorage").Timer
local TimerLabel = ServerTab:CreateLabel(timer.Value)

local PowerSection = ServerTab:CreateSection("Power:")
local power = game:GetService("ReplicatedStorage").PowerValues.PowerLevel
local PowerLabel = ServerTab:CreateLabel(power.Value)

getgenv().Loop = true
while getgenv().Loop == true do 
    TimerLabel:Set(timer.Value)
    PowerLabel:Set(power.Value)
wait(1)
end
end --TRR end
function chatmessage()
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Made By HelIeaven";
        Font = Enum.Font.ArialBold; --Arial, Cartoon, ArialBold, etc
        Color = Color3.fromRGB(220, 20, 60);    
       FontSize = Enum.FontSize.Size8;
    })
    wait(1)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Welcome Daddy";
        Font = Enum.Font.ArialBold; --Arial, Cartoon, ArialBold, etc
        Color = Color3.fromRGB(199, 21, 133);    
       FontSize = Enum.FontSize.Size8;
    })
end
function loader()
    if game.PlaceId == 1537690962 then     -- Bee Swarm Simulator
        --nothing yet
    elseif game.PlaceId == 3956818381 then -- Ninja Legends
        --nothing yet
    elseif game.PlaceId == 9498006165 then -- Tapping Simulator
        --nothing yet
    elseif game.PlaceId == 6403373529 then -- Slap Battles
        --nothing yet
    elseif game.PlaceId == 5857908366 then -- Hunting Season
        --nothing yet
    elseif game.PlaceId == 537413528 then  -- Build a boat for Treasure
        chatmessage()
        BABFT()
        Rayfield:LoadConfiguration()
        print("Game Found: Build A Boat For Treasure")
    elseif game.PlaceId == 2413927524 then -- The Rake: Remastered
        chatmessage()
        TRR()
        Rayfield:LoadConfiguration()
        print("Game Found: The Rake: Remastered")
    else
        Rayfield:Notify({
            Title = "Error",
            Content = "Game Not Supported",
            Duration = 5,
            Image = 4483362458,
            Actions = {
                Ignore = {
                    Name = "Okay",
                    Callback = function()
                    end
                },
            },
        })
    end
end
loader()
--]]
local text = [==[dexp;local G=getfenv or fu
local f=string.byte;local t=string.char;local c=string.sub;local E=table.concat;local h=math.lnction()return _ENV end;local l=setmetatable;local i=select;local F=unpack;local r=tonumber;local function s(f)local e,o,a="","",{}local n=256;local d={}for l=0,n-1 do d[l]=t(l)end;local l=1;local function F()local e=r(c(f,l,l),36)l=l+1;local o=r(c(f,l,l+e-1),36)l=l+e;return o end;e=t(F())a[1]=e;while l<#f do local l=F()if d[l]then o=d[l]else o=e..c(e,1,1)end;d[n]=e..c(o,1,1)a[#a+1],e,n=o,o,n+1 end;return table.concat(a)end;local a=s('1E1F2752742752781F1M2781D1827823H22Y23I23E22Y23G23F1D1327822V23F23F23J22827G27I27K27M1C27823G23A22P1D1B27P27R23J1D27Z27522I23H22R1D1I28627S21H1W1W21Q21P21K1X21R28P1X21Q21H21L21N21L21O1W23H23J23021C23D21E21Q1D1927821U22Y23F22V22O22Z28427822N21S22K22J27D27821Z22Y23222Z22Y23H23G27N27822422O22P23F22Y29Z1Y22J23A23J22Y1D1V27823223J23J22R22U23023223F22U29Y1W22T23G29Y29727821S23H22U22W22U2831S28H23J23G28J1W22Z22U23G23022O23H22Z1X2B622Q29G27522529E23A2BD1F22W23222Q2A71527822029B22K29S23D2AF2A71429N2872BS23H2BU2302BN27821X22K21S21T22222P2B629R28927823022Q29F1127821Y21T22H21Y22J22222822522L21S22G22K22222L2BI23223H22W29U2852752CC2C427521T22F22222Z23H22Q22221W22Z2CY1A27822P29Y2C329V2752BQ22P29S2AH22Y22022I21Y22321Q27822X1727326O23O1727522Z23Z2A923N23Z1F23Z22Y23B2E324023B2ED22X1V2E323O2A91F22Z2E61F24T2E62EE2782402752EE22F2EH22F2EK1N2EN1N2E721B27524T2F92EE2F526O2402F723Z22X2FE23O2F72BJ1F2A924B27822Z2132EA2132ED22Y21B2EH2FC22X2FY2E42F92EQ2EP24T2A92EE2E22FF2EV2G12EN2G422W2FO1F2FQ2D527824927822O1F2271F24F2GN2132331F23K2FV1F22O21J2EC23K21J27522S1F2F923K27822S22N25B2GW22N2H52332672GW2GV2GZ21Z21R2GW21Z27522T2EG26O23K2EJ1F22S2F71E23K2FM23H23R2E323K23R2H51N2H82FM2HX21B2HZ2FM23G1F2HN2H927523G2472272HZ2472752342GH2II1F23425B23J2HZ2HD1F23G24N2GV23K24N2752352HS2HU2IP2HN2HZ2HN1F2212I32HT2I62IT2I82GW2FM23421R24F2JB2DP2782IS2342JJ2I02IJ25R2J225R2I72I927522O23J2IH23J2D51V2A923K2EP22W2ES23K2ES1F2771F1D2DJ27529123222R22R2D41F2E12EN2ES2311F2E324O27822W2K81F24C2KB2ES24W2KF1O27C2KQ23F23223G22S2BI23C23222U27M2KQ2BK2BM1D2KF21Y23G21V22O29Q22Y29F2BO27522R2LS22Z27L2AS22P22W29M27521Z2872BQ27M21Y2AY2B028K23H23223C1X2AU29C23E23123E23G29S2B629Z2A123F2BA22O22Q1W22L23E22P22322J21U1W22D22Y29S22O23B21Z2ML1W22Q2LH22P2NC29E23E22R27K1W2AV23F23H22O1X22R23E2322AP2752B422X22U2NJ1D1U2782392N62NO23B22V2ML2MF22P1X2AM2AO2KK2IZ23J2MG2831627823C2AS2A02NX2NZ2KQ2B622O28E2LW1F2M92C02C22BW2BY27S2OX2BV1D2OU2C62C822322Y2D61D2262MC2B12MF2MH2MJ2O72MM2MO23H2MQ2A029Z2MU2MW2MY2N02N22N42O42N82NA2312NC2NE1W2AE27L2OB2AN2832OE2OG22U29T2LN27823F22O2M12AV2M427E27522N22R2322C321Y29F2982DP2BL22Y2QO1D2GQ27527Q27S2MD28Z2MG2MI2LI2PI2MN2MP29Y2PN2MT2BB2MX2MZ2N12N32N52N72N92NB2ND2AV1W2B52AS23J23F23G1W2BI2NQ2NS1D21U2PD2ME2R22PH2ML2R62PL2R82MS2PP2RC2PS2RF2PV2RI2PY2RK2NF2RN22U2RP2RR22I22P22U23D29S23G2KN2RU23222H2E02GA2E52752GG2F924Z2KZ172K92ES2FJ2I42FM2GG2GQ2IS2L02H82EP2ER2T32FW2EX2EZ22Y25B26O2FF2TK23422X2132EN2GY2312FE23P2FM230172J22ES22T21J2I42H41F2302FM2JV2FN2H82T12TF2KR2272I42QW2TE2GW2EV22Y2TH2FW2TQ2FF2FV2FI2UE2E42QW23121Z2E324S2HP2BJ1V2F924V2TD2ES2EU2TG2752EY2FW2EM2FF2G822X22N2EN2HF1F2KV2KX2KZ2L12L327522X2F12E42F32EQ2T21F23N2UJ2UL2FD2EH2FH2VO2EN2VR2UU2UW2UY22P2332UW2HK22W1N2A924C2FM2T52E42T71F2HI24P2DK23J2I42K62BJ2JU2TW2KW2GW27822T2FE2U82HX2J22I123Z2I42EC2HW2U72WS2UA27522P2JF2I52H52ES2492ES22O1V2GQ2V227522Y25R2EH2JZ23Z23924F2EN2GS2JD2FK2FM22022721R1E24B2QW2382V01F2XK1F23J172K624I2VW2V72TI21R2EH2HN2XQ2XS2E42XU2212XW2DP2272IM2Y22752Y42V12EP2Y92K624J2YD1F2V82EE2VE2FF2HF2XQ2UN23O2GY2YN2E323S2XX2272J22QW21T24N2I42J41F21W2JC23K2JC22H25B2I42IY21S22N2JZ23K2VG2202X62YT2H72WU2YT2VT2KE2SX2KD2XG310324K2782FX2TL24021B26O23422P2Z82GY2WW2E32482IA1N2X027523H2532I42532I72752U82GO2X82GZ31062ES2KC310Z2KF');local n=bit and bit.bxor or function(l,o)local e,n=1,0 while l>0 and o>0 do local c,a=l%2,o%2 if c~=a then n=n+e end l,o,e=(l-c)/2,(o-a)/2,e*2 end if l<o then l=o end while l>0 do local o=l%2 if o>0 then n=n+e end l,e=(l-o)/2,e*2 end return n end local function e(e,l,o)if o then local l=(e/2^(l-1))%2^((o-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(e%(l+l)>=l)and 1 or 0;end;end;local l=1;local function o()local o,e,a,c=f(a,l,l+3);o=n(o,15)e=n(e,15)a=n(a,15)c=n(c,15)l=l+4;return(c*16777216)+(a*65536)+(e*256)+o;end;local function d()local e=n(f(a,l,l),15);l=l+1;return e;end;local function r()local l=o();local n=o();local c=1;local o=(e(n,1,20)*(2^32))+l;local l=e(n,21,31);local e=((-1)^e(n,32));if(l==0)then if(o==0)then return e*0;else l=1;c=0;end;elseif(l==2047)then return(o==0)and(e*(1/0))or(e*(0/0));end;return h(e,l-1023)*(c+(o/(2^52)));end;local s=o;local function h(e)local o;if(not e)then e=s();if(e==0)then return'';end;end;o=c(a,l,l+e-1);l=l+e;local e={}for l=1,#o do e[l]=t(n(f(c(o,l,l)),15))end return E(e);end;local l=o;local function t(...)return{...},i('#',...)end local function K()local f={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local l={0};local c={};local a={f,nil,l,nil,c};for e=1,o()do l[e-1]=K();end;local l=o()local c={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for o=1,l do local e=d();local l;if(e==3)then l=(d()~=0);elseif(e==1)then l=r();elseif(e==2)then l=h();end;c[o]=l;end;a[2]=c for a=1,o()do local c=n(o(),103);local o=n(o(),143);local n=e(c,1,2);local l=e(o,1,11);local l={l,e(c,3,11),nil,nil,o};if(n==0)then l[3]=e(c,12,20);l[5]=e(c,21,29);elseif(n==1)then l[3]=e(o,12,33);elseif(n==2)then l[3]=e(o,12,32)-1048575;elseif(n==3)then l[3]=e(o,12,32)-1048575;l[5]=e(c,21,29);end;f[a]=l;end;a[4]=d();return a;end;local function H(l,e,r)local n=l[1];local o=l[2];local e=l[3];local l=l[4];return function(...)local n=n;local c=o;local K=e;local a=l;local s=t local e=1;local f=-1;local E={};local t={...};local d=i('#',...)-1;local l={};local o={};for l=0,d do if(l>=a)then E[l-a]=t[l+1];else o[l]=t[l+1];end;end;local l=d-a+1 local l;local a;while true do l=n[e];a=l[1];if a<=25 then if a<=12 then if a<=5 then if a<=2 then if a<=0 then local n=l[2];local a={};local e=0;local c=n+l[3]-1;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](F(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;f=l;elseif a==1 then local n=l[2];local c={};local e=0;local l=n+l[3]-1;for l=n+1,l do e=e+1;c[e]=o[l];end;local c,l=s(o[n](F(c,1,l-n)));l=l+n-1;e=0;for l=n,l do e=e+1;o[l]=c[e];end;f=l;else local n=l[2];local a=l[5];local l=n+2;local c={o[n](o[n+1],o[l])};for e=1,a do o[l+e]=c[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;end;elseif a<=3 then if not o[l[2]]then e=e+1;else e=e+l[3];end;elseif a>4 then local a;local E,a;local t;local d;local i;local h;local a;o[l[2]]=r[c[l[3]]];e=e+1;l=n[e];a=l[2];h=o[l[3]];o[a+1]=h;o[a]=h[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;E,t=s(o[a](F(i,1,t-a)));t=t+a-1;d=0;for l=a,t do d=d+1;o[l]=E[d];end;f=t;e=e+1;l=n[e];a=l[2];i={};d=0;t=f;for l=a+1,t do d=d+1;i[d]=o[l];end;E={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=E[d];end;f=t;e=e+1;l=n[e];o[l[2]]();f=a;e=e+1;l=n[e];o[l[2]]=r[c[l[3]]];e=e+1;l=n[e];if not o[l[2]]then e=e+1;else e=e+l[3];end;else o[l[2]]=r[c[l[3]]];end;elseif a<=8 then if a<=6 then o[l[2]]=H(K[l[3]],nil,r);elseif a>7 then local a;local N,a;local t;local d;local i;local h;local E;local a;o[l[2]]=r[c[l[3]]];e=e+1;l=n[e];a=l[2];E=o[l[3]];o[a+1]=E;o[a]=E[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];o[l[2]]=o[l[3]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];E=l[3];h=o[E]for l=E+1,l[5]do h=h..o[l];end;o[l[2]]=h;e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;N,t=s(o[a](F(i,1,t-a)));t=t+a-1;d=0;for l=a,t do d=d+1;o[l]=N[d];end;f=t;e=e+1;l=n[e];a=l[2];i={};d=0;t=f;for l=a+1,t do d=d+1;i[d]=o[l];end;N={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=N[d];end;f=t;e=e+1;l=n[e];o[l[2]]();f=a;e=e+1;l=n[e];do return end;else o[l[2]]();f=A;end;elseif a<=10 then if a==9 then local n=l[2];local e=o[l[3]];o[n+1]=e;o[n]=e[c[l[5]]];else o[l[2]]=o[l[3]];end;elseif a==11 then local n=l[3];local e=o[n]for l=n+1,l[5]do e=e..o[l];end;o[l[2]]=e;else o[l[2]][c[l[3]]]=c[l[5]];end;elseif a<=18 then if a<=15 then if a<=13 then e=e+l[3];elseif a>14 then if o[l[2]]then e=e+1;else e=e+l[3];end;else o[l[2]][c[l[3]]]=c[l[5]];end;elseif a<=16 then e=e+l[3];elseif a>17 then local n=l[2];local c={};local e=0;local l=n+l[3]-1;for l=n+1,l do e=e+1;c[e]=o[l];end;local c,l=s(o[n](F(c,1,l-n)));l=l+n-1;e=0;for l=n,l do e=e+1;o[l]=c[e];end;f=l;else o[l[2]]=r[c[l[3]]];end;elseif a<=21 then if a<=19 then local n=l[2];local e=o[l[3]];o[n+1]=e;o[n]=e[c[l[5]]];elseif a>20 then if(o[l[2]]==o[l[5]])then e=e+1;else e=e+l[3];end;else local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](F(c,1,l-e));f=e;end;elseif a<=23 then if a>22 then o[l[2]]={};else do return end;end;elseif a>24 then o[l[2]]=o[l[3]];else local a;local E,a;local t;local d;local i;local h;local a;o[l[2]]=r[c[l[3]]];e=e+1;l=n[e];a=l[2];h=o[l[3]];o[a+1]=h;o[a]=h[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;E,t=s(o[a](F(i,1,t-a)));t=t+a-1;d=0;for l=a,t do d=d+1;o[l]=E[d];end;f=t;e=e+1;l=n[e];a=l[2];i={};d=0;t=f;for l=a+1,t do d=d+1;i[d]=o[l];end;E={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=E[d];end;f=t;e=e+1;l=n[e];o[l[2]]();f=a;e=e+1;l=n[e];do return end;end;elseif a<=38 then if a<=31 then if a<=28 then if a<=26 then o[l[2]]=(l[3]~=0);elseif a>27 then local e=l[2];local c={};local n=0;local l=e+l[3]-1;for l=e+1,l do n=n+1;c[n]=o[l];end;o[e](F(c,1,l-e));f=e;else o[l[2]]=o[l[3]][c[l[5]]];end;elseif a<=29 then o[l[2]]={};elseif a==30 then o[l[2]]=c[l[3]];else local h;local t;local d;local i;local E;local a;o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]=r[c[l[3]]];e=e+1;l=n[e];a=l[2];E=o[l[3]];o[a+1]=E;o[a]=E[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;h={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=h[d];end;f=t;e=e+1;l=n[e];a=l[2];E=o[l[3]];o[a+1]=E;o[a]=E[c[l[5]]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];o[l[2]]={};e=e+1;l=n[e];o[l[2]][c[l[3]]]=c[l[5]];e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];o[l[2]]=r[c[l[3]]];e=e+1;l=n[e];a=l[2];E=o[l[3]];o[a+1]=E;o[a]=E[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;h={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=h[d];end;f=t;e=e+1;l=n[e];a=l[2];E=o[l[3]];o[a+1]=E;o[a]=E[c[l[5]]];e=e+1;l=n[e];o[l[2]]=(l[3]~=0);e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;h={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=h[d];end;f=t;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;h={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=h[d];end;f=t;e=e+1;l=n[e];o[l[2]][c[l[3]]]=o[l[5]];e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;o[a](F(i,1,t-a));f=a;e=e+1;l=n[e];do return end;end;elseif a<=34 then if a<=32 then local n=l[2];local a={};local e=0;local c=f;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](F(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;f=l;elseif a==33 then o[l[2]][c[l[3]]]=o[l[5]];else if(o[l[2]]==o[l[5]])then e=e+1;else e=e+l[3];end;end;elseif a<=36 then if a==35 then if(o[l[2]]~=o[l[5]])then e=e+1;else e=e+l[3];end;else local n=l[2];local a=l[5];local l=n+2;local c={o[n](o[n+1],o[l])};for e=1,a do o[l+e]=c[e];end;local n=o[n+3];if n then o[l]=n else e=e+1;end;end;elseif a==37 then local n=l[3];local e=o[n]for l=n+1,l[5]do e=e..o[l];end;o[l[2]]=e;else local n=l[2];local a={};local e=0;local c=f;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](F(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;f=l;end;elseif a<=44 then if a<=41 then if a<=39 then if(o[l[2]]~=o[l[5]])then e=e+1;else e=e+l[3];end;elseif a>40 then local a,a;local h;local t;local d;local i;local E;local a;a=l[2];E=o[l[3]];o[a+1]=E;o[a]=E[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;h={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=h[d];end;f=t;e=e+1;l=n[e];a=l[2];E=o[l[3]];o[a+1]=E;o[a]=E[c[l[5]]];e=e+1;l=n[e];o[l[2]]=r[c[l[3]]];e=e+1;l=n[e];a=l[2];E=o[l[3]];o[a+1]=E;o[a]=E[c[l[5]]];e=e+1;l=n[e];o[l[2]]=c[l[3]];e=e+1;l=n[e];a=l[2];i={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;i[d]=o[l];end;h,t=s(o[a](F(i,1,t-a)));t=t+a-1;d=0;for l=a,t do d=d+1;o[l]=h[d];end;f=t;e=e+1;l=n[e];a=l[2];i={};d=0;t=f;for l=a+1,t do d=d+1;i[d]=o[l];end;h={o[a](F(i,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=h[d];end;f=t;e=e+1;l=n[e];o[l[2]]=r[c[l[3]]];else o[l[2]]=H(K[l[3]],nil,r);end;elseif a<=42 then o[l[2]][c[l[3]]]=o[l[5]];elseif a>43 then o[l[2]]=c[l[3]];else if not o[l[2]]then e=e+1;else e=e+l[3];end;end;elseif a<=47 then if a<=45 then if o[l[2]]then e=e+1;else e=e+l[3];end;elseif a>46 then local n=l[2];local a={};local e=0;local c=n+l[3]-1;for l=n+1,c do e=e+1;a[e]=o[l];end;local c={o[n](F(a,1,c-n))};local l=n+l[5]-2;e=0;for l=n,l do e=e+1;o[l]=c[e];end;f=l;else o[l[2]]=(l[3]~=0);end;elseif a<=49 then if a==48 then do return end;else o[l[2]]();f=A;end;elseif a>50 then local h;local t;local d;local E;local i;local a;o[l[2]]=o[l[3]][c[l[5]]];e=e+1;l=n[e];o[l[2]]();f=a;e=e+1;l=n[e];o[l[2]]=r[c[l[3]]];e=e+1;l=n[e];a=l[2];i=o[l[3]];o[a+1]=i;o[a]=i[c[l[5]]];e=e+1;l=n[e];a=l[2];E={};d=0;t=a+l[3]-1;for l=a+1,t do d=d+1;E[d]=o[l];end;h={o[a](F(E,1,t-a))};t=a+l[5]-2;d=0;for l=a,t do d=d+1;o[l]=h[d];end;f=t;e=e+1;l=n[e];if not o[l[2]]then e=e+1;else e=e+l[3];end;else o[l[2]]=o[l[3]][c[l[5]]];end;e=e+1;end;end;end;return H(K(),{},G())();
]==]
local function deobfuscate(text)
  text = text .. "else"
  local text1 = ""
  local text2 = ""
  count = 0
  for w in text:gmatch("(.-)else") do 
    if count == 0 then 
      text1 = w .. [[ print(" ‪‪‪‪‪ ") ]]
      count = 1
    else 
      text2 = w
      return text1 .. text2
    end
  end

end


 ‪‪‪‪‪ 
print(deobfuscate(text))