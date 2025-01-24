---@class BetterBags: AceAddon
local addon = LibStub("AceAddon-3.0"):GetAddon("BetterBags")

---@class Categories: AceModule
local categories = addon:GetModule("Categories")

---@type Database
local Database = Database -- Ensure database is loaded

local L = _G.L -- Import localization

----------------------------------
-- This is where the magic happens
----------------------------------

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

-- Categories to update
local CategoriesToUpdate = {
    "Remix",
    "Meta Gems",
    "Cogwheel Gems",
    "Tinker Gems",
    "Prismatic Gems",
    "Enhancements",
    "Utilities",
    "Consumables",
    "Noblegarden",
    "Darkmoon Faire",
    "Lunar Festival",
    L("Noblegarden"),
    L("Darkmoon Faire"),
    L("Lunar Festival"),
    L("Remix"),
    L("Midsummer Fire Festival"),
    L("Radiant Echoes"),
    L("Brewfest"),
    L("20th Anniversary"),
    L("Hallow's End"),
    L("Feast of Winter Veil")
}

-- Delete outdated categories
for _, category in ipairs(CategoriesToUpdate) do
    categories:DeleteCategory(category)
end

-- Add items to categories
for _, mapping in ipairs(categoryMappings) do
    for _, ItemID in pairs(mapping.list) do
        categories:AddItemToCategory(ItemID, mapping.category)
    end
end