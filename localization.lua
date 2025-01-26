-- localization.lua
local L = {}

-- Localization table
L.locales = {
    ["enUS"] = {
        ["Noblegarden"] = "Noblegarden",
        ["Darkmoon Faire"] = "Darkmoon Faire",
        ["Lunar Festival"] = "Lunar Festival",
        ["Midsummer Fire Festival"] = "Midsummer Fire Festival",
        ["Remix MoP"] = "Remix MoP",
        ["Radiant Echoes"] = "Radiant Echoes",
        ["Brewfest"] = "Brewfest",
        ["20th Anniversary"] = "20th Anniversary",
        ["Hallow's End"] = "Hallow's End",
        ["Feast of Winter Veil"] = "Feast of Winter Veil",
    },
    ["frFR"] = {
        ["Noblegarden"] = "Le Jardin des nobles",
        ["Darkmoon Faire"] = "Foire de Sombrelune",
        ["Lunar Festival"] = "Fête lunaire",
        ["Midsummer Fire Festival"] = "Fête du Feu du solstice d'été",
        ["Remix MoP"] = "MoP Remix",
        ["Radiant Echoes"] = "Échos radieux",
        ["Brewfest"] = "Fête des Brasseurs",
        ["20th Anniversary"] = "20e anniversaire",
        ["Hallow's End"] = "Sanssaint",
        ["Feast of Winter Veil"] = "Voile d'hiver",
    },
    ["deDE"] = {
        ["Noblegarden"] = "Nobelgartenfest",
        ["Darkmoon Faire"] = "Dunkelmond-Jahrmarkt",
        ["Lunar Festival"] = "Mondfest",
        ["Midsummer Fire Festival"] = "Sonnenwendfest",
        ["Remix MoP"] = "Remix MoP",
        ["Radiant Echoes"] = "Strahlenden Echos",
        ["Brewfest"] = "Braufest",
        ["20th Anniversary"] = "Der 20. Geburtstag",
        ["Hallow's End"] = "Schlotternechte",
        ["Feast of Winter Veil"] = "Winterhauchfest",
    },
    ["ptBR"] = {
        ["Noblegarden"] = "Jardinova",
        ["Darkmoon Faire"] = "Feira de Negraluna",
        ["Lunar Festival"] = "Festival da Lua",
        ["Midsummer Fire Festival"] = "Festival do Fogo do Solstício",
        ["Remix MoP"] = "Remix MoP",
        ["Radiant Echoes"] = "Ecos Radiantes",
        ["Brewfest"] = "CervaFest",
        ["20th Anniversary"] = "20º Aniversário",
        ["Hallow's End"] = "Noturnália",
        ["Feast of Winter Veil"] = "Festa do Véu de Inverno",
    }
}

-- Detects current language
L.currentLocale = GetLocale()

-- Function to get the translation
function L:Get(key)
    return self.locales[self.currentLocale] and self.locales[self.currentLocale][key] or self.locales["enUS"][key]
end

-- Global L Expose
_G.L = L