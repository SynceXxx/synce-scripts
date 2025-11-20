-- Load saved theme or use default
local savedTheme = "Amethyst"
pcall(function()
   if readfile and isfile and isfile("SynceScript_Theme.txt") then
      savedTheme = readfile("SynceScript_Theme.txt")
   end
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Synce Script | Kayak and surf [OP]",
   Icon = "settings",
   LoadingTitle = "⚡ Synce Script ⚡",
   LoadingSubtitle = "Professional Script Hub | Loading Resources...",
   Theme = savedTheme,

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "SynceScriptGui"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false
})

Rayfield:Notify({
   Title = "🎉 Welcome!",
   Content = "Synce Script Loaded Successfully!",
   Duration = 6.5,
   Image = nil,
})

-- Variables to store input values
local candyAmount = 1
local moneyAmount = 0.15
local winAmount = 15
local spinRewardChoice = 2
local spinAmountValue = 1

-- Tab Main (NEW)
local MainTab = Window:CreateTab("🎮 Main", nil)

-- CANDY SECTION
local CandySection = MainTab:CreateSection("🍬 Candy")

local CandyInput = MainTab:CreateInput({
   Name = "Candy Amount",
   PlaceholderText = "Enter amount",
   RemoveTextAfterFocusLost = false,
   Flag = "CandyInput",
   Callback = function(Text)
      local value = tonumber(Text)
      if value then
         candyAmount = value
      end
   end,
})

MainTab:CreateButton({
   Name = "Claim Candy",
   Callback = function()
      local args = {
         "candy",
         candyAmount
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Eco"):WaitForChild("AddEcoRE"):FireServer(unpack(args))
   end,
})

-- MONEY SECTION
local MoneySection = MainTab:CreateSection("💰 Money")

local MoneyInput = MainTab:CreateInput({
   Name = "Money Amount",
   PlaceholderText = "Enter amount (e.g., 0.15)",
   RemoveTextAfterFocusLost = false,
   Flag = "MoneyInput",
   Callback = function(Text)
      local value = tonumber(Text)
      if value then
         moneyAmount = value
      end
   end,
})

MainTab:CreateButton({
   Name = "Claim Money",
   Callback = function()
      local args = {
         {
            Number = moneyAmount,
            Type = "ClimbPercent",
            ID = ""
         }
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Reward"):WaitForChild("ClaimRewardRE"):FireServer(unpack(args))
   end,
})

-- WIN SECTION
local WinSection = MainTab:CreateSection("🏆 Win")

local WinInput = MainTab:CreateInput({
   Name = "Win Amount",
   PlaceholderText = "Enter amount",
   RemoveTextAfterFocusLost = false,
   Flag = "WinInput",
   Callback = function(Text)
      local value = tonumber(Text)
      if value then
         winAmount = value
      end
   end,
})

MainTab:CreateButton({
   Name = "Claim Win",
   Callback = function()
      local args = {
         "win",
         winAmount
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Eco"):WaitForChild("AddEcoRE"):FireServer(unpack(args))
   end,
})

-- SPIN REWARD SECTION
local SpinRewardSection = MainTab:CreateSection("🎰 Spin Reward")

local SpinRewardInput = MainTab:CreateInput({
   Name = "Spin Reward Choice (1-6)",
   PlaceholderText = "Enter choice 1-6",
   RemoveTextAfterFocusLost = false,
   Flag = "SpinRewardInput",
   Callback = function(Text)
      local value = tonumber(Text)
      if value and value >= 1 and value <= 6 then
         spinRewardChoice = value
      end
   end,
})

MainTab:CreateButton({
   Name = "Claim Spin Reward",
   Callback = function()
      local args = {
         spinRewardChoice
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Spin"):WaitForChild("GetReward"):InvokeServer(unpack(args))
   end,
})

-- SPIN AMOUNT SECTION
local SpinAmountSection = MainTab:CreateSection("🎡 Spin Amount")

local SpinAmountInput = MainTab:CreateInput({
   Name = "Spin Amount",
   PlaceholderText = "Enter amount",
   RemoveTextAfterFocusLost = false,
   Flag = "SpinAmountInput",
   Callback = function(Text)
      local value = tonumber(Text)
      if value then
         spinAmountValue = value
      end
   end,
})

MainTab:CreateButton({
   Name = "Claim Spin Amount",
   Callback = function()
      local args = {
         {
            Number = spinAmountValue,
            Type = "Spin",
            ID = ""
         }
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Reward"):WaitForChild("ClaimRewardRE"):FireServer(unpack(args))
   end,
})

local MainCredits = MainTab:CreateSection("⚡ Synce Script ⚡")

-- Tab Boat (NEW) - MENU BARU UNTUK BOAT
local BoatTab = Window:CreateTab("⛵ Boat", nil)

-- BUY BOAT SECTION
local BuyBoatSection = BoatTab:CreateSection("💰 Buy Boat")

local buyBoatID = nil  -- Set to nil agar harus input dulu

local BuyBoatInput = BoatTab:CreateInput({
   Name = "Boat ID (1-41, 1001, 1002, 1101, 1102)",
   PlaceholderText = "Enter boat ID",
   RemoveTextAfterFocusLost = false,
   Flag = "BuyBoatInput",
   Callback = function(Text)
      if Text and Text ~= "" then
         buyBoatID = Text
      end
   end,
})

BoatTab:CreateButton({
   Name = "Buy Boat",
   Callback = function()
      if not buyBoatID or buyBoatID == "" then
         Rayfield:Notify({
            Title = "⚠️ Error",
            Content = "Please enter Boat ID first!",
            Duration = 3,
         })
         return
      end
      
      local args = {
         buyBoatID
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Wings"):WaitForChild("TryBuyAndUseWingsRF"):InvokeServer(unpack(args))
      
      Rayfield:Notify({
         Title = "✅ Success",
         Content = "Boat ID " .. buyBoatID .. " purchased!",
         Duration = 3,
      })
   end,
})

-- EQUIP BOAT SECTION
local EquipBoatSection = BoatTab:CreateSection("✨ Equip Boat")

local equipBoatID = nil  -- Set to nil agar harus input dulu

local EquipBoatInput = BoatTab:CreateInput({
   Name = "Boat ID (1-41, 1001, 1002, 1101, 1102)",
   PlaceholderText = "Enter boat ID",
   RemoveTextAfterFocusLost = false,
   Flag = "EquipBoatInput",
   Callback = function(Text)
      if Text and Text ~= "" then
         equipBoatID = Text
      end
   end,
})

BoatTab:CreateButton({
   Name = "Equip Boat",
   Callback = function()
      if not equipBoatID or equipBoatID == "" then
         Rayfield:Notify({
            Title = "⚠️ Error",
            Content = "Please enter Boat ID first!",
            Duration = 3,
         })
         return
      end
      
      local args = {
         equipBoatID
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Wings"):WaitForChild("[C-S]EquipPlayerWings"):FireServer(unpack(args))
      
      Rayfield:Notify({
         Title = "✅ Success",
         Content = "Boat ID " .. equipBoatID .. " equipped!",
         Duration = 3,
      })
   end,
})

local BoatCredits = BoatTab:CreateSection("⚡ Synce Script ⚡")

-- Tab Pet (NEW)
local PetTab = Window:CreateTab("🐾 Pet", nil)

-- ROBUX PET SECTION
local RobuxPetSection = PetTab:CreateSection("💎 Robux Pet")

local robuxPetChoice = nil  -- Set to nil agar harus input dulu

local RobuxPetInput = PetTab:CreateInput({
   Name = "Robux Pet (1-10)",
   PlaceholderText = "Enter choice 1-10",
   RemoveTextAfterFocusLost = false,
   Flag = "RobuxPetInput",
   Callback = function(Text)
      if Text and Text ~= "" then
         robuxPetChoice = Text
      end
   end,
})

PetTab:CreateButton({
   Name = "Claim Robux Pet",
   Callback = function()
      if not robuxPetChoice or robuxPetChoice == "" then
         Rayfield:Notify({
            Title = "⚠️ Error",
            Content = "Please enter Pet ID first!",
            Duration = 3,
         })
         return
      end
      
      local args = {
         {
            Number = 0,
            Type = "Pet",
            ID = "Robux_" .. robuxPetChoice
         }
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Reward"):WaitForChild("ClaimRewardRE"):FireServer(unpack(args))
      
      Rayfield:Notify({
         Title = "✅ Success",
         Content = "Robux Pet " .. robuxPetChoice .. " claimed!",
         Duration = 3,
      })
   end,
})

-- SHOP PET SECTION
local ShopPetSection = PetTab:CreateSection("🏪 Shop Pet")

local shopPetChoice = nil  -- Set to nil agar harus input dulu

local ShopPetInput = PetTab:CreateInput({
   Name = "Shop Pet (1-4)",
   PlaceholderText = "Enter choice 1-4",
   RemoveTextAfterFocusLost = false,
   Flag = "ShopPetInput",
   Callback = function(Text)
      if Text and Text ~= "" then
         shopPetChoice = Text
      end
   end,
})

PetTab:CreateButton({
   Name = "Claim Shop Pet",
   Callback = function()
      if not shopPetChoice or shopPetChoice == "" then
         Rayfield:Notify({
            Title = "⚠️ Error",
            Content = "Please enter Pet ID first!",
            Duration = 3,
         })
         return
      end
      
      local args = {
         {
            Number = 0,
            Type = "Pet",
            ID = "Shop_" .. shopPetChoice
         }
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Reward"):WaitForChild("ClaimRewardRE"):FireServer(unpack(args))
      
      Rayfield:Notify({
         Title = "✅ Success",
         Content = "Shop Pet " .. shopPetChoice .. " claimed!",
         Duration = 3,
      })
   end,
})

-- HALLOWEEN PET SECTION
local HalloweenPetSection = PetTab:CreateSection("🎃 Halloween Pet")

local halloweenPetChoice = nil  -- Set to nil agar harus input dulu

local HalloweenPetInput = PetTab:CreateInput({
   Name = "Halloween Pet (1-10)",
   PlaceholderText = "Enter choice 1-10",
   RemoveTextAfterFocusLost = false,
   Flag = "HalloweenPetInput",
   Callback = function(Text)
      if Text and Text ~= "" then
         halloweenPetChoice = Text
      end
   end,
})

PetTab:CreateButton({
   Name = "Claim Halloween Pet",
   Callback = function()
      if not halloweenPetChoice or halloweenPetChoice == "" then
         Rayfield:Notify({
            Title = "⚠️ Error",
            Content = "Please enter Pet ID first!",
            Duration = 3,
         })
         return
      end
      
      local args = {
         {
            Number = 0,
            Type = "Pet",
            ID = "Halloween_" .. halloweenPetChoice
         }
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Reward"):WaitForChild("ClaimRewardRE"):FireServer(unpack(args))
      
      Rayfield:Notify({
         Title = "✅ Success",
         Content = "Halloween Pet " .. halloweenPetChoice .. " claimed!",
         Duration = 3,
      })
   end,
})

local PetCredits = PetTab:CreateSection("⚡ Synce Script ⚡")

-- Tab Boost (NEW) - MENU BARU UNTUK BOOST
local BoostTab = Window:CreateTab("⚡ Boost", nil)

-- Variables for boost
local selectedBoost = "Luck"
local boostTime = 300
local boostValue = 0.5

-- Select Boost Dropdown
local BoostDropdown = BoostTab:CreateDropdown({
   Name = "Select Boost",
   Options = {"Coin", "Luck", "Speed", "Win", "Stamina", "Luckx2"},
   CurrentOption = {"Luck"},
   MultipleOptions = false,
   Flag = "BoostDropdown",
   Callback = function(Option)
      selectedBoost = Option[1]
   end,
})

-- Boost Time Input
local BoostTimeInput = BoostTab:CreateInput({
   Name = "Boost Time (seconds)",
   PlaceholderText = "300",
   RemoveTextAfterFocusLost = false,
   Flag = "BoostTimeInput",
   Callback = function(Text)
      local value = tonumber(Text)
      if value then
         boostTime = value
      end
   end,
})

-- Boost Value Input
local BoostValueInput = BoostTab:CreateInput({
   Name = "Boost Value",
   PlaceholderText = "0.5",
   RemoveTextAfterFocusLost = false,
   Flag = "BoostValueInput",
   Callback = function(Text)
      local value = tonumber(Text)
      if value then
         boostValue = value
      end
   end,
})

-- Activate Boost Button
BoostTab:CreateButton({
   Name = "Activate Boost",
   Callback = function()
      local args = {
         {
            Number = boostTime,
            Type = "Boost",
            ID = selectedBoost
         }
      }
      game:GetService("ReplicatedStorage"):WaitForChild("E&F"):WaitForChild("Reward"):WaitForChild("ClaimRewardRE"):FireServer(unpack(args))
      
      Rayfield:Notify({
         Title = "✅ Boost Activated!",
         Content = selectedBoost .. " boost for " .. boostTime .. " seconds",
         Duration = 3,
      })
   end,
})

local BoostInfo = BoostTab:CreateParagraph({
   Title = "ℹ️ Boost Information",
   Content = "Available Boosts:\n• Coin - Increase coin gain\n• Luck - Increase luck stats\n• Speed - Increase movement speed\n• Win - Increase win rate\n• Stamina - Increase stamina\n• Luckx2 - Double luck boost"
})

local BoostCredits = BoostTab:CreateSection("⚡ Synce Script ⚡")

-- Tab Theme Changer
local ThemeTab = Window:CreateTab("🎨 Themes", nil)
local ThemeSection = ThemeTab:CreateSection("✨ Choose Your Theme")

local ThemeLabel = ThemeTab:CreateLabel("Current Theme: " .. savedTheme)

local ThemeInfo = ThemeTab:CreateParagraph({
   Title = "ℹ️ How to Change Theme",
   Content = "Click on any theme button below to save it. Close and reopen the script to see the new theme applied!"
})

-- Theme buttons
ThemeTab:CreateButton({
   Name = "🔵 Default Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "Default")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Default theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

ThemeTab:CreateButton({
   Name = "🟠 Amber Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "Amber")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Amber theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

ThemeTab:CreateButton({
   Name = "💜 Amethyst Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "Amethyst")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Amethyst theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

ThemeTab:CreateButton({
   Name = "🌸 Bloom Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "Bloom")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Bloom theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

ThemeTab:CreateButton({
   Name = "🌊 Dark Blue Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "DarkBlue")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Dark Blue theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

ThemeTab:CreateButton({
   Name = "🟢 Green Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "Green")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Green theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

ThemeTab:CreateButton({
   Name = "⚪ Light Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "Light")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Light theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

ThemeTab:CreateButton({
   Name = "🌊 Ocean Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "Ocean")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Ocean theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

ThemeTab:CreateButton({
   Name = "🔴 Sentinel Theme",
   Callback = function()
      pcall(function()
         if writefile then
            writefile("SynceScript_Theme.txt", "Sentinel")
            Rayfield:Notify({
               Title = "✅ Theme Saved!",
               Content = "Sentinel theme saved. Reopen script to apply!",
               Duration = 4,
            })
         end
      end)
   end,
})

local ThemeCredits = ThemeTab:CreateSection("⚡ Synce Script ⚡")

-- Tab Information
local InfoTab = Window:CreateTab("ℹ️ Information", nil)

-- Script Owner Section
local OwnerSection = InfoTab:CreateSection("👑 Script Owner")

local OwnerInfo = InfoTab:CreateParagraph({
   Title = "Developer",
   Content = "This script is created and maintained by Synce Script. A dedicated developer focused on creating high-quality Roblox scripts with user-friendly interfaces and powerful features."
})

-- Script Features Section
local FeaturesSection = InfoTab:CreateSection("⚡ Script Features")

local FeaturesList = InfoTab:CreateParagraph({
   Title = "Available Features",
   Content = "• Get Candy (Custom Amount)\n• Get Money (Custom Amount)\n• Get Win (Custom Amount)\n• Get Spin Reward (Choice 1-6)\n• Get Spin Amount (Custom Amount)\n• Boost System (6 boost types)\n• Buy & Equip Boat (Separate Tab)\n• Pet Collection System\n• Theme Customization (9 themes)\n• Configuration Saving\n• User-Friendly Interface"
})

-- Coming Soon Section
local ComingSoonSection = InfoTab:CreateSection("🔮 Coming Soon")

local UpcomingFeatures = InfoTab:CreateParagraph({
   Title = "Upcoming Updates",
   Content = "More features will be added in future updates. Stay tuned for exciting new additions!"
})

-- Version Info Section
local VersionSection = InfoTab:CreateSection("📌 Version Information")

local VersionInfo = InfoTab:CreateParagraph({
   Title = "Current Version",
   Content = "Version: 1.6.0\nRelease Date: November 2025\nStatus: Stable\nNew: Boost System Added!"
})

-- Support Section
local SupportSection = InfoTab:CreateSection("💬 Support & Feedback")

local SupportInfo = InfoTab:CreateParagraph({
   Title = "Need Help?",
   Content = "If you encounter any bugs or have suggestions for new features, please report them through our feedback system. Your feedback helps us improve the script!"
})

local InfoCredits = InfoTab:CreateSection("⚡ Thank You for Using Synce Script! ⚡")