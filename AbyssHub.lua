local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Abyss Hub",
	LoadingTitle = "Abyss Hub - idk yet",
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
		Subtitle = "idk yet",
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
Rayfield:LoadConfiguration()
end --BABFT end

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
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
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
            v.supplyEsp:Destroy()
            wait()
        end
else
    for _,v in pairs(game:GetService("Workspace").Debris.SupplyCrates:GetChildren()) do
        if v then
        v.supplyEsp:Destroy()
end
end
end
end
function FlareEsp()
    if getgenv().FlareEsp == true then
    if game:GetService("Workspace"):FindFirstChild("FlareGunPickUp") then
    local flare = game:GetService("Workspace").FlareGunPickUp.FlareGun
    local esp = Instance.new("Highlight")
    esp.Name = "flareEsp"
    esp.FillTransparency = 0
    esp.FillColor = Color3.fromRGB(255, 200, 200)
    esp.OutlineColor = Color3.fromRGB(255, 255, 255)
    esp.OutlineTransparency = 0
    esp.Parent = flare
    flare.flareEsp:Destroy()
    wait()
    end
    else
        getgenv().FlareEsp = false
        if game:GetService("Workspace"):FindFirstChild("FlareGunPickUp") then
        game:GetService("Workspace").FlareGunPickUp.FlareGun.flareEsp:Destroy()
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
                        while getgenv().Running == true do
                            if getgenv().Running == false and getgenv().FasterSprint == false then break end
                            wait(0.03)
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
else
    getgenv().FasterSprint = false
    getgenv().Running = false
end
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
                            repeat
                            local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15,false)
                            wait(0.5)
                            local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
                            pl.CFrame = flare.CFrame
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,x,0)
                            wait(0.5)
                            pl.CFrame = oldcframe
                            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15,true)      
                            until game.Players.LocalPlayer.Character.BackPack:FindFirstChild("Flare Gun")
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
function KillauraRake()
    local x = game:GetService("Workspace"):FindFirstChild("Rake")
    local mainPart = x.Head
    local part = game.Players.LocalPlayer.Character.HumanoidRootPart

    local distance = (part.Position - mainPart.Position).magnitude
    local distanceround = math.round(distance)
    if getgenv().killauraRake == true then
        if game:GetService("Workspace"):FindFirstChild("Rake") then
            if distanceround<10 then
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
end
function NotifyBox()
    if game:GetService("Workspace").Debris.SupplyCrates.Box["Items_Folder"]:GetChildren() then
    for _,v in pairs(game:GetService("Workspace").Debris.SupplyCrates.Box["Items_Folder"]:GetChildren()) do
        Rayfield:Notify({
                       Title = "Item inside the box:",
                       Content = v.Name,
                       Duration = 5,
                       Image = 4483362458,
                       Actions = {
                           Ignore = {
                               Name = "Alright",
                               Callback = function()
                               end
                           },
                       },
                   })
       end
end
end
function FullBright()
    while getgenv().FB == true do
    wait()
    local CLP = game:GetService("ReplicatedStorage").CurrentLightingProperties
    local CLP2 = game:GetService("ReplicatedStorage").CurrentLightingProperties2
    local L = game:GetService("Lighting")

local DA = game:GetService("ReplicatedStorage").DayProperties.Ambient
local DB = game:GetService("ReplicatedStorage").DayProperties.Brightness
local DFC = game:GetService("ReplicatedStorage").DayProperties.FogColor
local DOA = game:GetService("ReplicatedStorage").DayProperties.OutdoorAmbient
local DFE = game:GetService("ReplicatedStorage").DayProperties.FogEnd
local DCT = game:GetService("ReplicatedStorage").DayProperties.ClockTime

local NA = game:GetService("ReplicatedStorage").NightProperties.Ambient
local NB = game:GetService("ReplicatedStorage").NightProperties.Brightness
local NFC = game:GetService("ReplicatedStorage").NightProperties.FogColor
local NOA = game:GetService("ReplicatedStorage").NightProperties.OutdoorAmbient
local NFE = game:GetService("ReplicatedStorage").NightProperties.FogEnd
local NCT = game:GetService("ReplicatedStorage").NightProperties.ClockTime

    if getgenv().FB == true then
    CLP.OutdoorAmbient.Value = Color3.fromRGB(255,255,255)
    CLP.Ambient.Value = Color3.fromRGB(255,255,255)
    CLP.Brightness.Value = 4
    CLP.ClockTime.Value = 12
    CLP.FogEnd.Value = 50000000000
    
    CLP2.OutdoorAmbient.Value = Color3.fromRGB(255,255,255)
    CLP2.Ambient.Value = Color3.fromRGB(255,255,255)
    CLP2.Brightness.Value = 4
    CLP2.ClockTime.Value = 12
    CLP2.FogEnd.Value = 50000000000
    
    L.OutdoorAmbient = Color3.fromRGB(255,255,255)
    L.Ambient = Color3.fromRGB(255,255,255)
    L.Brightness = 4
    L.ClockTime = 12
    L.FogEnd = 50000000000
    else
    if game:GetService("ReplicatedStorage").Night.Value == true then
    CLP.OutdoorAmbient.Value = NOA.Value
    CLP.Ambient.Value = NA.Value
    CLP.Brightness.Value = NB.Value
    CLP.ClockTime.Value =  NCT.Value
    CLP.FogColor.Value = NFC.Value
    CLP.FogEnd.Value = NFE.Value
    
    CLP2.OutdoorAmbient.Value = NOA.Value
    CLP2.Ambient.Value = NA.Value
    CLP2.Brightness.Value = NB.Value
    CLP2.ClockTime.Value =  NCT.Value
    CLP2.FogColor.Value = NFC.Value
    CLP2.FogEnd.Value = NFE.Value

    L.OutdoorAmbient = NOA.Value
    L.Ambient = NA.Value
    L.Brightness = NB.Value
    L.ClockTime = NCT.Value
    L.FogColor = NFC.Value
    L.FogEnd = NFE.Value
    elseif game:GetService("ReplicatedStorage").Night.Value == false then
    CLP.OutdoorAmbient.Value = NOA.Value
    CLP.Ambient.Value = NA.Value
    CLP.Brightness.Value = NB.Value
    CLP.ClockTime.Value =  NCT.Value
    CLP.FogColor.Value = DFC.Value
    CLP.FogEnd.Value = NFE.Value
        
    CLP2.OutdoorAmbient.Value = DOA.Value
    CLP2.Ambient.Value = DA.Value
    CLP2.Brightness.Value = DB.Value
    CLP2.ClockTime.Value =  DCT.Value
    CLP2.FogColor.Value = DFC.Value
    CLP2.FogEnd.Value = DFE.Value
    
    L.OutdoorAmbient = DOA.Value
    L.Ambient = DA.Value
    L.Brightness = DB.Value
    L.ClockTime = DCT.Value
    L.FogColor = DFC.Value
    L.FogEnd = DFE.Value
end
end
end
end
--Retoggles the rake distance if rake is going away
function Rake2()
local x = game:GetService("Workspace"):FindFirstChild("Rake")
local mainPart = x.Head
local part = game.Players.LocalPlayer.Character.HumanoidRootPart

local distance = (part.Position - mainPart.Position).magnitude
local distanceround = math.round(distance)
if game:GetService("Workspace"):FindFirstChild("Rake") then
    if getgenv().rake2 == true then
        if distanceround == 255 or distanceround>255 then
            RakeDistance()
            wait(5)
        end
    end
end
end
function RakeDistance()
if getgenv().RakeDistance == true then
while getgenv().RakeDistance == true do
wait()
if game:GetService("Workspace"):FindFirstChild("Rake") then
    local char = game.Players.LocalPlayer.Character
    game:GetService("Workspace"):WaitForChild(tostring(char))
    local x = game:GetService("Workspace"):FindFirstChild("Rake")
    local mainPart = x.Head
    local part = game.Players.LocalPlayer.Character.HumanoidRootPart

    local distance = (part.Position - mainPart.Position).magnitude
    local distanceround = math.round(distance)

        if distanceround == 250 or distanceround<250 then
            Rayfield:Notify({
                Title = "Warning!",
                Content = "Rake is close",
                Duration = 5,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "Alright",
                        Callback = function()
                        end
                            },
                          },
            })
            getgenv().rake2 = true
            Rake2()
        break
        else getgenv().RakeDistance = false
end
end
end
else getgenv().RakeDistance = false
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
    getgenv().Running = false
    FasterSprint()
        end
    end,
})
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
            getgenv().SupplyEsp = true
            SupplyEsp()
end
end,
})
local FlareEspToggle = VisualTab:CreateToggle({
    Name = "Flare Esp",
    CurrentValue = false,
    Flag = "ObservationTowerEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().FlareEsp = true
           FlareEsp()
        else
    getgenv().FlareEsp = false
    FlareEsp()
end
end,
})
local LocationsSection = VisualTab:CreateSection("Locations")
local Paragraph = VisualTab:CreateParagraph({Title = "Roblox has a limit for highlighted parts.", Content = "Some ESP's won't show up if too much parts are highlighted."})
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
local FullBrightToggle = MiscTab:CreateToggle({
    Name = "FullBright",
    CurrentValue = false,
    Flag = "FullBrightToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            getgenv().FB = true
            FullBright()
        else
            getgenv().FB = false
            FullBright()
        end
end,
})
local UnlockChatToggle = MiscTab:CreateToggle({
    Name = "Show Chat",
    CurrentValue = false,
    Flag = "Unlockchat", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            game:GetService("Players").HelIeaven.PlayerGui.Chat.Frame.Visible = true
            game:GetService("Players").HelIeaven.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true
        else
            game:GetService("Players").HelIeaven.PlayerGui.Chat.Frame.Visible = false
            game:GetService("Players").HelIeaven.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = false
        end
    end,
})
local NotifyBoxButton = MiscTab:CreateButton({
    Name = "Send SupplyCrate Content",
    Callback = function()
   NotifyBox()
    end,
 })
local NotifySection = MiscTab:CreateSection("Notifications")
local NotifyFlareToggle = MiscTab:CreateToggle({
    Name = "Notify Flare",
    CurrentValue = true,
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
    Name = "Notify Rake Spawn",
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
local RakeDistanceToggle = MiscTab:CreateToggle({
    Name = "Notify Rake Distance",
    CurrentValue = true,
    Flag = "RakeDistance", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
           getgenv().RakeDistance = true
           RakeDistance()
        else
    getgenv().RakeDistance = false
    RakeDistance()
end
end,
})
local CombatSection = FarmingTab:CreateSection("Combat")
local RakestunstickAura = FarmingTab:CreateToggle({
    Name = "Stunstick Kill-Aura doesnt work yet btw",
    CurrentValue = false,
    Flag = "KillauraStunstick", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            getgenv().killauraRake = true
            KillauraRake()
        else
            getgenv().killauraRake = false
            KillauraRake()
        end
end,
})
local FarmingSection = FarmingTab:CreateSection("Farming")
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
local CurrentTimeSection = ServerTab:CreateSection("Game Status:")
local CurrentTimeLabel = ServerTab:CreateLabel("placeholder")

local RakeDistance = ServerTab:CreateSection("Rake Distance")
local RakeDistanceLabel = ServerTab:CreateLabel("None")

local TimerSection = ServerTab:CreateSection("Timer:")
local timer = game:GetService("ReplicatedStorage").Timer
local TimerLabel = ServerTab:CreateLabel(timer.Value)

local PowerSection = ServerTab:CreateSection("Power:")
local power = game:GetService("ReplicatedStorage").PowerValues.PowerLevel
local PowerLabel = ServerTab:CreateLabel(power.Value)

getgenv().Loop = true
--[[
while getgenv().Loop == true do 
game:GetService("Workspace"):WaitForChild(game.Players.LocalPlayer.Character.HumanoidRootPart)
local x = game:GetService("Workspace"):FindFirstChild("Rake")
local mainPart = x.Head
local part = game.Players.LocalPlayer.Character.HumanoidRootPart
local distance = (part.Position - mainPart.Position).magnitude
local distanceround = math.round(distance)
RakeDistanceLabel:Set(tostring(distanceround))
end
]]
while getgenv().Loop == true  do 
    wait(1)
    TimerLabel:Set(timer.Value)
    PowerLabel:Set(power.Value)
    
    if game:GetService("ReplicatedStorage").Night.Value == false then
    CurrentTimeLabel:Set("Day Time")
    elseif game:GetService("ReplicatedStorage").Night.Value == true then
    CurrentTimeLabel:Set("Night Time")
end
end
Rayfield:LoadConfiguration()
end --TRR end

function chatmessage()
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Made By HelIeaven";
        Font = Enum.Font.ArialBold; --Arial, Cartoon, ArialBold, etc
        Color = Color3.fromRGB(0, 0, 0);    
       FontSize = Enum.FontSize.Size8;
    })
    wait(1)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Matt is kinda gay ngl";
        Font = Enum.Font.ArialBold; --Arial, Cartoon, ArialBold, etc
        Color = Color3.fromRGB(0, 0, 0),
       FontSize = Enum.FontSize.Size8;
    })
    local bannedplayers = "nil"
    if game.Players.LocalPlayer.Name == tostring(bannedplayers) then 
    game.Players.LocalPlayer:Kick("You have been permanently banned from: The Rake REMASTERED - Don't exploit!")
end
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
        print("Game Found: Build A Boat For Treasure")
    elseif game.PlaceId == 2413927524 then -- The Rake: Remastered
        chatmessage()
        TRR()
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
--[[
local Player = game:GetService("Workspace").CurrentCamera
local UIS = game:GetService'UserInputService';
UIS.InputBegan:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.W then
            getgenv().Running = true
                while wait(0.03) and getgenv().Running == true do
Player.CFrame = Player.CFrame + Vector3.new(0.5,0,0)
Player.CFrame = Player.CFrame + Vector3.new(0.5,0,0)
Player.CFrame = Player.CFrame + Vector3.new(0.5,0,0)
end
        end
end)
UIS.InputEnded:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.W then
                getgenv().Running = false
        end
end)



        UIS.InputBegan:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.S then
            getgenv().Running2 = true
                while wait(0.03) and getgenv().Running2 == true do
Player.CFrame = Player.CFrame + Vector3.new(0,0.5,0)
Player.CFrame = Player.CFrame + Vector3.new(0,0.5,0)
Player.CFrame = Player.CFrame + Vector3.new(0,0.5,0)
end
        end
end)
UIS.InputEnded:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.S then
                getgenv().Running2 = false
        end
end)



UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.D then
        getgenv().Running3 = true
            while wait(0.03) and getgenv().Running3 == true do
Player.CFrame = Player.CFrame + Vector3.new(0,0,0.5)
Player.CFrame = Player.CFrame + Vector3.new(0,0,0.5)
Player.CFrame = Player.CFrame + Vector3.new(0,0,0.5)
end
    end
end)
UIS.InputEnded:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.D then
            getgenv().Running3 = false
    end
end)
--]]
