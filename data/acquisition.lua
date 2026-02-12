--[[
* Grimoire - Spell Acquisition Data
* Maps spell names to acquisition sources (vendors, quests, drops).
* Focused on 75-era content. Check BG-Wiki for the most current info.
*
* Fields:
*   vendor = NPC name (Location)
*   quest  = Quest name or description
*   drop   = Monster names / zones
*   other  = Auction House, crafting, etc.
--]]

local acq = {};

----------------------------------------------------------------------------------------------------
-- Healing Magic
----------------------------------------------------------------------------------------------------

acq["Cure"]       = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Cure II"]    = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Cure III"]   = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Cure IV"]    = { vendor = "Quelpia (Lower Jeuno) / Macki (Aht Urhgan Whitegate)", other = "Auction House" };
acq["Cure V"]     = { other = "Auction House", drop = "Various high-level mobs" };
acq["Cure VI"]    = { other = "Auction House", drop = "Ix'DRG (Abyssea)" };
acq["Curaga"]     = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Curaga II"]  = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Curaga III"] = { other = "Auction House", drop = "Various high-level mobs" };
acq["Curaga IV"]  = { other = "Auction House", drop = "Various high-level mobs" };
acq["Curaga V"]   = { other = "Auction House (rare)" };
acq["Regen"]      = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Regen II"]   = { other = "Auction House", drop = "Various high-level mobs" };
acq["Regen III"]  = { other = "Auction House", drop = "Various high-level mobs" };

----------------------------------------------------------------------------------------------------
-- Raise / Reraise / Arise
----------------------------------------------------------------------------------------------------

acq["Raise"]       = { vendor = "Regine (Port San d'Oria) / Quelpia (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Raise II"]    = { other = "Auction House", drop = "Various high-level mobs" };
acq["Raise III"]   = { other = "Auction House (very rare)", drop = "Various HNMs" };
acq["Reraise"]     = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Reraise II"]  = { other = "Auction House", drop = "Various high-level mobs" };
acq["Reraise III"] = { other = "Auction House (rare)", drop = "Various HNMs" };

----------------------------------------------------------------------------------------------------
-- Divine Magic
----------------------------------------------------------------------------------------------------

acq["Banish"]      = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Banish II"]   = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Banish III"]  = { other = "Auction House", drop = "Various high-level mobs" };
acq["Banishga"]    = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno)" };
acq["Banishga II"] = { other = "Auction House" };
acq["Holy"]        = { other = "Auction House", drop = "Various high-level mobs" };
acq["Flash"]       = { quest = "Shining Souls (San d'Oria)", other = "Auction House" };
acq["Reprisal"]    = { other = "Auction House" };
acq["Crusade"]     = { other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Status Removal (White)
----------------------------------------------------------------------------------------------------

acq["Poisona"]  = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Paralyna"] = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Blindna"]  = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Silena"]   = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Stona"]    = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Viruna"]   = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Cursna"]   = { other = "Auction House", drop = "Various high-level mobs" };
acq["Erase"]    = { other = "Auction House", drop = "Various high-level mobs" };
acq["Esuna"]    = { other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Enhancing Magic (Protect/Shell)
----------------------------------------------------------------------------------------------------

acq["Protect"]      = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Protect II"]   = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Protect III"]  = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Protect IV"]   = { other = "Auction House", drop = "Various high-level mobs" };
acq["Protect V"]    = { other = "Auction House (rare)" };
acq["Shell"]        = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Shell II"]     = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Shell III"]    = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Shell IV"]     = { other = "Auction House", drop = "Various high-level mobs" };
acq["Shell V"]      = { other = "Auction House (rare)" };
acq["Protectra"]    = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Protectra II"] = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno)" };
acq["Protectra III"]= { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Protectra IV"] = { other = "Auction House", drop = "Various high-level mobs" };
acq["Protectra V"]  = { other = "Auction House (rare)" };
acq["Shellra"]      = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Shellra II"]   = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Shellra III"]  = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Shellra IV"]   = { other = "Auction House", drop = "Various high-level mobs" };
acq["Shellra V"]    = { other = "Auction House (rare)" };

----------------------------------------------------------------------------------------------------
-- Enhancing Magic (Buffs)
----------------------------------------------------------------------------------------------------

acq["Blink"]        = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Stoneskin"]    = { quest = "The Rumor (Selbina)", other = "Auction House" };
acq["Phalanx"]     = { other = "Auction House", drop = "Various high-level mobs" };
acq["Phalanx II"]  = { other = "Auction House" };
acq["Aquaveil"]    = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Haste"]       = { other = "Auction House", drop = "Various high-level mobs" };
acq["Refresh"]     = { other = "Auction House", drop = "Various high-level mobs" };
acq["Invisible"]   = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Sneak"]       = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Deodorize"]   = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Auspice"]     = { other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Enhancing Magic (Bar-spells)
----------------------------------------------------------------------------------------------------

acq["Barfire"]      = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Barblizzard"]  = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Baraero"]      = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Barstone"]     = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Barthunder"]   = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Barwater"]     = { vendor = "Regine (Port San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Barsleep"]     = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barpoison"]    = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barparalyze"]  = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barblind"]     = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barsilence"]   = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barpetrify"]   = { other = "Auction House" };
acq["Barvirus"]     = { other = "Auction House" };
acq["Barfira"]      = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barblizzara"]  = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Baraera"]      = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barstonra"]    = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barthundra"]   = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barwatera"]    = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Barsleepra"]   = { vendor = "Hasim (Lower Jeuno)" };
acq["Barpoisonra"]  = { vendor = "Hasim (Lower Jeuno)" };
acq["Barparalyzra"] = { vendor = "Hasim (Lower Jeuno)" };
acq["Barblindra"]   = { vendor = "Hasim (Lower Jeuno)" };
acq["Barsilencera"] = { vendor = "Hasim (Lower Jeuno)" };
acq["Barpetra"]     = { vendor = "Hasim (Lower Jeuno)" };
acq["Barvira"]      = { vendor = "Hasim (Lower Jeuno)" };

----------------------------------------------------------------------------------------------------
-- Enhancing Magic (En-spells)
----------------------------------------------------------------------------------------------------

acq["Enfire"]       = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Enblizzard"]   = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Enaero"]       = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Enstone"]      = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Enthunder"]    = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Enwater"]      = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Enfire II"]    = { other = "Auction House" };
acq["Enblizzard II"]= { other = "Auction House" };
acq["Enaero II"]    = { other = "Auction House" };
acq["Enstone II"]   = { other = "Auction House" };
acq["Enthunder II"] = { other = "Auction House" };
acq["Enwater II"]   = { other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Teleport / Recall / Warp
----------------------------------------------------------------------------------------------------

acq["Warp"]          = { vendor = "Chutarmire (Upper Jeuno)", other = "Auction House" };
acq["Warp II"]       = { other = "Auction House", quest = "Wonder Wands (Windurst)" };
acq["Escape"]        = { other = "Auction House" };
acq["Retrace"]       = { other = "Auction House" };
acq["Teleport-Dem"]  = { quest = "Teleport quest chain (Windurst)" };
acq["Teleport-Holla"]= { quest = "Teleport quest chain (San d'Oria)" };
acq["Teleport-Mea"]  = { quest = "Teleport quest chain (Bastok)" };
acq["Teleport-Yhoat"]= { quest = "Teleport quest (Kazham)" };
acq["Teleport-Altep"]= { quest = "Teleport quest (Rabao)" };
acq["Teleport-Vahzl"]= { quest = "Teleport quest (Beaucedine)" };
acq["Recall-Jugner"] = { other = "Auction House" };
acq["Recall-Pashh"]  = { other = "Auction House" };
acq["Recall-Meriph"] = { other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Enfeebling Magic (White)
----------------------------------------------------------------------------------------------------

acq["Dia"]         = { vendor = "Cesse (S. San d'Oria) / Hasim (Lower Jeuno) / Zafif (Windurst Waters)" };
acq["Dia II"]      = { vendor = "Regine (Port San d'Oria) / Quelpia (Lower Jeuno)" };
acq["Dia III"]     = { other = "Auction House (rare)", drop = "Various HNMs" };
acq["Diaga"]       = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Slow"]        = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Slow II"]     = { other = "Auction House" };
acq["Paralyze"]    = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Paralyze II"] = { other = "Auction House" };
acq["Silence"]     = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };
acq["Repose"]      = { other = "Auction House (rare)" };
acq["Addle"]       = { other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Elemental Magic (Tiers)
----------------------------------------------------------------------------------------------------

-- Fire
acq["Fire"]         = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Fire II"]      = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Fire III"]     = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Fire IV"]      = { other = "Auction House", drop = "Various high-level mobs" };
acq["Fire V"]       = { other = "Auction House (rare)" };
acq["Firaga"]       = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Firaga II"]    = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Firaga III"]   = { other = "Auction House", drop = "Various high-level mobs" };
-- Blizzard
acq["Blizzard"]     = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Blizzard II"]  = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Blizzard III"] = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Blizzard IV"]  = { other = "Auction House", drop = "Various high-level mobs" };
acq["Blizzard V"]   = { other = "Auction House (rare)" };
acq["Blizzaga"]     = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Blizzaga II"]  = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Blizzaga III"] = { other = "Auction House", drop = "Various high-level mobs" };
-- Aero
acq["Aero"]         = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Aero II"]      = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Aero III"]     = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Aero IV"]      = { other = "Auction House", drop = "Various high-level mobs" };
acq["Aero V"]       = { other = "Auction House (rare)" };
acq["Aeroga"]       = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Aeroga II"]    = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Aeroga III"]   = { other = "Auction House", drop = "Various high-level mobs" };
-- Stone
acq["Stone"]        = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Stone II"]     = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Stone III"]    = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Stone IV"]     = { other = "Auction House", drop = "Various high-level mobs" };
acq["Stone V"]      = { other = "Auction House (rare)" };
acq["Stonega"]      = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Stonega II"]   = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Stonega III"]  = { other = "Auction House", drop = "Various high-level mobs" };
-- Thunder
acq["Thunder"]      = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Thunder II"]   = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Thunder III"]  = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Thunder IV"]   = { other = "Auction House", drop = "Various high-level mobs" };
acq["Thunder V"]    = { other = "Auction House (rare)" };
acq["Thundaga"]     = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Thundaga II"]  = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Thundaga III"] = { other = "Auction House", drop = "Various high-level mobs" };
-- Water
acq["Water"]        = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Water II"]     = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Water III"]    = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Water IV"]     = { other = "Auction House", drop = "Various high-level mobs" };
acq["Water V"]      = { other = "Auction House (rare)" };
acq["Waterga"]      = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Waterga II"]   = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Waterga III"]  = { other = "Auction House", drop = "Various high-level mobs" };

----------------------------------------------------------------------------------------------------
-- Elemental Magic (Ancient / Special)
----------------------------------------------------------------------------------------------------

acq["Flare"]    = { other = "Auction House (rare)", drop = "Various HNMs" };
acq["Freeze"]   = { other = "Auction House (rare)", drop = "Various HNMs" };
acq["Tornado"]  = { other = "Auction House (rare)", drop = "Various HNMs" };
acq["Quake"]    = { other = "Auction House (rare)", drop = "Various HNMs" };
acq["Burst"]    = { other = "Auction House (rare)", drop = "Various HNMs" };
acq["Flood"]    = { other = "Auction House (rare)", drop = "Various HNMs" };
acq["Flare II"] = { other = "Auction House (very rare)" };
acq["Freeze II"]= { other = "Auction House (very rare)" };
acq["Tornado II"]={ other = "Auction House (very rare)" };
acq["Quake II"] = { other = "Auction House (very rare)" };
acq["Burst II"] = { other = "Auction House (very rare)" };
acq["Flood II"] = { other = "Auction House (very rare)" };
acq["Comet"]    = { other = "Auction House (rare)" };
acq["Meteor"]   = { other = "Auction House (very rare)" };

----------------------------------------------------------------------------------------------------
-- Enfeebling Magic (Black)
----------------------------------------------------------------------------------------------------

acq["Poison"]      = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Poison II"]   = { other = "Auction House" };
acq["Poisonga"]    = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Bio"]         = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Bio II"]      = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Bio III"]     = { other = "Auction House (rare)" };
acq["Blind"]       = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Blind II"]    = { other = "Auction House" };
acq["Bind"]        = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Gravity"]     = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Sleep"]       = { vendor = "Armentho (N. San d'Oria) / Akeem (Bastok Mines) / Kisana (Windurst Waters)" };
acq["Sleep II"]    = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Sleepga"]     = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Sleepga II"]  = { other = "Auction House", drop = "Various high-level mobs" };
acq["Dispel"]      = { other = "Auction House", drop = "Various high-level mobs" };
acq["Break"]       = { other = "Auction House" };
acq["Breakga"]     = { other = "Auction House" };
acq["Drain"]       = { vendor = "Promurouve (Lower Jeuno)", other = "Auction House" };
acq["Drain II"]    = { other = "Auction House" };
acq["Aspir"]       = { other = "Auction House" };
acq["Aspir II"]    = { other = "Auction House" };
acq["Tractor"]     = { vendor = "Quelpia (Lower Jeuno)", other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Dark Magic
----------------------------------------------------------------------------------------------------

acq["Stun"]     = { other = "Auction House", drop = "Various high-level mobs" };
acq["Absorb-STR"] = { other = "Auction House" };
acq["Absorb-DEX"] = { other = "Auction House" };
acq["Absorb-VIT"] = { other = "Auction House" };
acq["Absorb-AGI"] = { other = "Auction House" };
acq["Absorb-INT"] = { other = "Auction House" };
acq["Absorb-MND"] = { other = "Auction House" };
acq["Absorb-CHR"] = { other = "Auction House" };
acq["Absorb-ACC"] = { other = "Auction House" };
acq["Absorb-TP"]  = { other = "Auction House" };
acq["Dread Spikes"]= { other = "Auction House (rare)" };

----------------------------------------------------------------------------------------------------
-- Ninjutsu
----------------------------------------------------------------------------------------------------

acq["Utsusemi: Ichi"]  = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Utsusemi: Ni"]    = { other = "Auction House", drop = "Tonberry mobs (Temple of Uggalepih)" };
acq["Tonko: Ichi"]     = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Tonko: Ni"]       = { other = "Auction House" };
acq["Monomi: Ichi"]    = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Jubaku: Ichi"]    = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Hojo: Ichi"]      = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Hojo: Ni"]        = { other = "Auction House" };
acq["Kurayami: Ichi"]  = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Kurayami: Ni"]    = { other = "Auction House" };
acq["Dokumori: Ichi"]  = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Katon: Ichi"]     = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Katon: Ni"]       = { other = "Auction House" };
acq["Hyoton: Ichi"]    = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Hyoton: Ni"]      = { other = "Auction House" };
acq["Huton: Ichi"]     = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Huton: Ni"]       = { other = "Auction House" };
acq["Doton: Ichi"]     = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Doton: Ni"]       = { other = "Auction House" };
acq["Raiton: Ichi"]    = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Raiton: Ni"]      = { other = "Auction House" };
acq["Suiton: Ichi"]    = { vendor = "Achille/Vuliaie (Norg)", other = "Auction House" };
acq["Suiton: Ni"]      = { other = "Auction House" };
acq["Migawari: Ichi"]  = { other = "Auction House" };
acq["Myoshu: Ichi"]    = { other = "Auction House" };
acq["Kakka: Ichi"]     = { other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Songs (Bard)
----------------------------------------------------------------------------------------------------

acq["Foe Requiem"]       = { vendor = "Mertaire (Upper Jeuno) / Baren-Mansen (Windurst Waters)" };
acq["Foe Requiem II"]    = { vendor = "Mertaire (Upper Jeuno) / Baren-Mansen (Windurst Waters)" };
acq["Foe Requiem III"]   = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Foe Requiem IV"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Foe Requiem V"]     = { other = "Auction House" };
acq["Foe Requiem VI"]    = { other = "Auction House" };
acq["Foe Requiem VII"]   = { other = "Auction House (rare)" };
acq["Army's Paeon"]      = { vendor = "Mertaire (Upper Jeuno) / Baren-Mansen (Windurst Waters)" };
acq["Army's Paeon II"]   = { vendor = "Mertaire (Upper Jeuno) / Baren-Mansen (Windurst Waters)" };
acq["Army's Paeon III"]  = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Army's Paeon IV"]   = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Army's Paeon V"]    = { other = "Auction House" };
acq["Army's Paeon VI"]   = { other = "Auction House (rare)" };
acq["Mage's Ballad"]     = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Mage's Ballad II"]  = { other = "Auction House" };
acq["Mage's Ballad III"] = { other = "Auction House (rare)" };
acq["Knight's Minne"]    = { vendor = "Mertaire (Upper Jeuno) / Baren-Mansen (Windurst Waters)" };
acq["Knight's Minne II"] = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Knight's Minne III"]= { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Knight's Minne IV"] = { other = "Auction House" };
acq["Knight's Minne V"]  = { other = "Auction House (rare)" };
acq["Valor Minuet"]      = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Valor Minuet II"]   = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Valor Minuet III"]  = { other = "Auction House" };
acq["Valor Minuet IV"]   = { other = "Auction House" };
acq["Valor Minuet V"]    = { other = "Auction House (rare)" };
acq["Sword Madrigal"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Blade Madrigal"]    = { other = "Auction House" };
acq["Hunter's Prelude"]  = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Archer's Prelude"]  = { other = "Auction House" };
acq["Advancing March"]   = { other = "Auction House" };
acq["Victory March"]     = { other = "Auction House (rare)" };
acq["Honor March"]       = { other = "Auction House (very rare)" };
acq["Battlefield Elegy"] = { other = "Auction House" };
acq["Carnage Elegy"]     = { other = "Auction House" };
acq["Foe Lullaby"]       = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Foe Lullaby II"]    = { other = "Auction House" };
acq["Horde Lullaby"]     = { other = "Auction House" };
acq["Horde Lullaby II"]  = { other = "Auction House (rare)" };
acq["Magic Finale"]      = { other = "Auction House" };
acq["Chocobo Mazurka"]   = { quest = "Chocobo's Wounds (Upper Jeuno)" };
acq["Raptor Mazurka"]    = { other = "Auction House" };
acq["Sheepfoe Mambo"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Dragonfoe Mambo"]   = { other = "Auction House" };

-- Etudes
acq["Sinewy Etude"]      = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Herculean Etude"]   = { other = "Auction House" };
acq["Dextrous Etude"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Uncanny Etude"]     = { other = "Auction House" };
acq["Vivacious Etude"]   = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Vital Etude"]       = { other = "Auction House" };
acq["Quick Etude"]       = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Swift Etude"]       = { other = "Auction House" };
acq["Learned Etude"]     = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Sage Etude"]        = { other = "Auction House" };
acq["Spirited Etude"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Logical Etude"]     = { other = "Auction House" };
acq["Enchanting Etude"]  = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Bewitching Etude"]  = { other = "Auction House" };

-- Carols
acq["Fire Carol"]        = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Fire Carol II"]     = { other = "Auction House" };
acq["Ice Carol"]         = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Ice Carol II"]      = { other = "Auction House" };
acq["Wind Carol"]        = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Wind Carol II"]     = { other = "Auction House" };
acq["Earth Carol"]       = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Earth Carol II"]    = { other = "Auction House" };
acq["Lightning Carol"]   = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Lightning Carol II"]= { other = "Auction House" };
acq["Water Carol"]       = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Water Carol II"]    = { other = "Auction House" };
acq["Light Carol"]       = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Light Carol II"]    = { other = "Auction House" };
acq["Dark Carol"]        = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Dark Carol II"]     = { other = "Auction House" };

-- Threnodies
acq["Fire Threnody"]     = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Ice Threnody"]      = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Wind Threnody"]     = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Earth Threnody"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Ltng. Threnody"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Water Threnody"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Light Threnody"]    = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };
acq["Dark Threnody"]     = { vendor = "Mertaire (Upper Jeuno)", other = "Auction House" };

----------------------------------------------------------------------------------------------------
-- Summoning Magic
----------------------------------------------------------------------------------------------------

acq["Carbuncle"]       = { quest = "The Carbuncle Debacle (Windurst)" };
acq["Fire Spirit"]     = { vendor = "Mapitoto (Windurst Walls)" };
acq["Ice Spirit"]      = { vendor = "Mapitoto (Windurst Walls)" };
acq["Air Spirit"]      = { vendor = "Mapitoto (Windurst Walls)" };
acq["Earth Spirit"]    = { vendor = "Mapitoto (Windurst Walls)" };
acq["Thunder Spirit"]  = { vendor = "Mapitoto (Windurst Walls)" };
acq["Water Spirit"]    = { vendor = "Mapitoto (Windurst Walls)" };
acq["Light Spirit"]    = { vendor = "Mapitoto (Windurst Walls)" };
acq["Dark Spirit"]     = { vendor = "Mapitoto (Windurst Walls)" };
acq["Ifrit"]           = { quest = "Trial by Fire (Cloister of Flames)" };
acq["Shiva"]           = { quest = "Trial by Ice (Cloister of Frost)" };
acq["Garuda"]          = { quest = "Trial by Wind (Cloister of Gales)" };
acq["Titan"]           = { quest = "Trial by Earth (Cloister of Tremors)" };
acq["Ramuh"]           = { quest = "Trial by Lightning (Cloister of Storms)" };
acq["Leviathan"]       = { quest = "Trial by Water (Cloister of Tides)" };
acq["Fenrir"]          = { quest = "The Moonlit Path (Full Moon Fountain)" };
acq["Diabolos"]        = { quest = "Waking Dreams (Pso'Xja)" };
acq["Alexander"]       = { quest = "Divine Might (Ru'Aun Gardens)" };
acq["Odin"]            = { quest = "The Dark Divide (Hazhalm Testing Grounds)" };

return acq;
