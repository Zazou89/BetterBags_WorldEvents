---@class BetterBags: AceAddon
local addon = LibStub('AceAddon-3.0'):GetAddon("BetterBags")

---@class Categories: AceModule
local categories = addon:GetModule('Categories')

---@class Localization: AceModule
local L = addon:GetModule('Localization')

--Noblegarden
local Noblegarden = {
    116258, --Mystical Spring Bouquet
    216874, --Loot-Filled Basket
    155905, --Cursed Rabbit's Foot
    45072,  --Brightly Colored Egg
    72145,  --Swift Springstrider
    44791,  --Noblegarden Chocolate
    213428, --Loot-Stuffed Basket
    116371, --Magnificently-Painted Egg 
    116370, --Intricately-Painted Egg
    44793,  --Tome of Polymorph: Rabbit 
    44806,  --Brightly Colored Shell Fragment
    116369, --Poorly-Painted Egg
    44794,  --Spring Rabbit's Foot
    44803,  --Spring Circlet
    6835,   --Black Tuxedo Pants
    19028,  --Elegant Dress
    45073,  --Spring Flowers
    45067,  --Egg Basket 
    74283,  --Pink Spring Circlet
    44792,  --Blossoming Branch
    74282,  --Black Spring Circlet
    44800,  --Spring Robes
    44818,  --Noblegarden Egg
    6833,   --White Tuxedo Shirt
    44802,  --Borrowed Egg Basket
    212599, --Noble Flying Carpet
    212786, --Lovely Duckling
    216881, --Duck Disguiser
    212701, --Spring Reveler's Turquoise Boots
    212711, --Spring Reveler's Turquoise Dress
    212985, --Spring Reveler's Turquoise Pants
    212698, --Spring Reveler's Turquoise Attire
    212699, --Spring Reveler's Turquoise Belt
    212715, --Spring Reveler's Turquoise Sun Hat
    116357, --Poorly-Painted Egg
    116358, --Intricately-Painted Egg
    116359, --Magnificently-Painted Egg
    141532, --Noblegarden Bunny
    151804, --Black Tuxedo Pants
    151806, --Elegant Dress
    164922, --Blue Spring Circlet
    164923, --Brown Spring Circlet
    164924, --Yellow Spring Circlet
    165802, --Noble Gardener's Hearthstone
    188694, --Spring Florist's Pouch
    204675, --A Drake's Big Basket of Eggs
    216898, --Mallard Duck Disguise
    216901, --White Duck Disguise
    216890, --Black Duck Disguise
    216897, --Brown Duck Disguise
    216902, --Yellow Duck Disguise
    216900, --Pink Duck Disguise
}

for _, ItemID in pairs(Noblegarden) do
	categories:AddItemToCategory(ItemID, "Noblegarden")
end
