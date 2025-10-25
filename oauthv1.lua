local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local KEY = "0028-1247-1624-8217" -- local fallback key
local SCRIPT_URL = "https://raw.githubusercontent.com/SolentraXminishakk/The-Vortix-Script/refs/heads/main/loader.lua"

local Window = Rayfield:CreateWindow({
    Name = "vortix authenticator",
    Icon = nil,
    LoadingTitle = "auth",
    LoadingSubtitle = "verification made to slow down nukers",
    ShowText = "Rayfield",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = true, -- enable Rayfield key system
    KeySettings = {
        Title = "Verification",
        Subtitle = "Authenticator System",
        Note = "Verification Key: " .. KEY,
        FileName = "Key",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = { KEY }
    }
})

local Tab = Window:CreateTab("launch script", 4483362458)

getgenv().isWhitelisted = false

Tab:CreateButton({
    Name = "Load Vortix Loader",
    Callback = function()
        getgenv().isWhitelisted = true
        local ok, result = pcall(function()
            return loadstring(game:HttpGet(SCRIPT_URL))()
        end)

        if not ok then
            warn("Failed to load loader.lua:", result)
            Rayfield:Notify({
                Title = "Load failed",
                Content = "Could not fetch loader.lua. Check URL or your executor's HTTP permissions.",
                Duration = 6
            })
            return
        end

        if Rayfield.Destroy then
            Rayfield:Destroy()
        end
    end
})
