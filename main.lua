---@class BetterBags: AceAddon
local addon = LibStub('AceAddon-3.0'):GetAddon("BetterBags")

---@class Categories: AceModule
local categories = addon:GetModule('Categories')

---@class Localization: AceModule
local L = addon:GetModule('Localization')

--Noblegarden
local Noblegarden = {
	45072, --Brightly Colored Egg
  44791, --Noblegarden Chocolate
  
}

local allItems = {
    Noblegarden,
}

for _, itemList in pairs(allItems) do
    for _, ItemID in pairs(itemList) do
        categories:AddItemToCategory(ItemID, "Battle Pet")
    end
end
