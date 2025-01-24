---@type BetterBags
local BetterBags = LibStub('AceAddon-3.0'):GetAddon("BetterBags")
assert(BetterBags, "BetterBags_WorldEvents requires BetterBags")

---@type Categories: AceModule
local Categories = BetterBags:GetModule('Categories')

---@type Config: AceModule
local Config = BetterBags:GetModule('Config')

---@type Events: AceModule
local Events = BetterBags:GetModule('Events')

---@type Context: AceModule
local Context = BetterBags:GetModule('Context')

---@type Database
local Database = Database -- Ensure database is loaded



-- Import localization
local L = _G.L 

-- Color Categories
local colorPrefix = "|cff1DDB7F"
local colorPrefix_20thAnniversary = "|cff1dc7db"
local resetColor = "|r"

-- Category Mapping
local categoryMappings = {
    {list = Database.Noblegarden, category = L("Noblegarden")},
    {list = Database.Darkmoonfaire, category = L("Darkmoon Faire")},
    {list = Database.LunarFestival, category = L("Lunar Festival")},
    {list = Database.MidsummerFireFestival, category = L("Midsummer Fire Festival")},
    {list = Database.Brewfest, category = L("Brewfest")},
    {list = Database.WoWRemixMoP, category = colorPrefix .. L("MoP Remix") .. resetColor},
    {list = Database.RadiantEchoes, category = L("Radiant Echoes")},
    {list = Database.WoW20thAnniversary, category = colorPrefix_20thAnniversary .. L("20th Anniversary") .. resetColor},
    {list = Database.HallowsEnd, category = L("Hallow's End")},
    {list = Database.FeastOfWinterVeil, category = L("Feast of Winter Veil")},
}

-- Ensure BetterBagsDB exists
BetterBagsDB = BetterBagsDB or {} 
BetterBagsDB.categories = BetterBagsDB.categories or {}

-- Initialize all categories to true if they are nil
for _, mapping in ipairs(categoryMappings) do
    local categoryName = mapping.category
    if BetterBagsDB.categories[categoryName] == nil then
        BetterBagsDB.categories[categoryName] = true -- Default enabled
    end
end

-- Function to update item categories based on user settings
local function updateCategories()
    for _, mapping in ipairs(categoryMappings) do
        local categoryName = mapping.category
        if BetterBagsDB.categories[categoryName] then
            for _, ItemID in pairs(mapping.list) do
                Categories:AddItemToCategory(ItemID, categoryName)
            end
        else
            for _, ItemID in pairs(mapping.list) do
                Categories:RemoveItemFromCategory(ItemID, categoryName)
            end
        end
    end

    -- Use BetterBags event system to refresh bags
    if Events and Context then
        local ctx = Context:New('BBWorldEvents_RefreshAll')
        Events:SendMessage(ctx, 'bags/FullRefreshAll')
    end
end

-- Initialize categories when game loads
local function InitializeCategories()
    updateCategories()
end

-- Event handler for game events
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("GET_ITEM_INFO_RECEIVED")
frame:SetScript("OnEvent", function(self, event, itemID, success)
    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(0.5, InitializeCategories)
    elseif event == "GET_ITEM_INFO_RECEIVED" and success then
        updateCategories()
    end
end)

-- Register plugin with BetterBags
local options = {
    EventCategories = {
        type = "group",
        name = "World Events",
        order = 1,
        inline = true,
        args = {}
    }
}

-- Add each event category as a toggle option
for _, mapping in ipairs(categoryMappings) do
    local categoryName = mapping.category
    options.EventCategories.args[categoryName] = {
        type = "toggle",
        name = categoryName,
        desc = "Enable or disable this category",
        order = 10,
        get = function() return BetterBagsDB.categories[categoryName] or false end,
        set = function(_, value)
            BetterBagsDB.categories[categoryName] = value
            C_Timer.After(0.1, updateCategories)
        end
    }
end

Config:AddPluginConfig("World Events", options)
