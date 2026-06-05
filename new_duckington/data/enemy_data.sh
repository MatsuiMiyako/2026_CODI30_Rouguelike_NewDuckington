#!/bin/bash
# Enemy data file — only stores enemy stats, no logic here
 
# ============================================================
#  BEAR GRUNT LINE  (base → commander → elite → boss)
# ============================================================
declare -A BEAR_GRUNT=(
    [name]="THE BIG BAD BROWN BEAST"
    [hp]=110
    [hp_max]=110
    [atk]=16
    [def]=11
    [attack_name]="Ferocious Prowl"
)
declare -A BEAR_GRUNT_COMMANDER=(
    [name]="Rampaging Brown Brute"
    [hp]=175
    [hp_max]=175
    [atk]=24
    [def]=17
    [attack_name]="Savage Charge"
)
declare -A BEAR_GRUNT_ELITE=(
    [name]="Crimson Fang Beast"
    [hp]=260
    [hp_max]=260
    [atk]=34
    [def]=24
    [attack_name]="Blood Frenzy Pounce"
)
declare -A BEAR_GRUNT_BOSS=(
    [name]="APEX BROWN BEHEMOTH"
    [hp]=420
    [hp_max]=420
    [atk]=48
    [def]=33
    [attack_name]="Unstoppable Rampage"
)
 
# ============================================================
#  EARTH BEAR LINE  (tanky / defensive)
# ============================================================
declare -A EARTH_BEAR=(
    [name]="Earth Bear"
    [hp]=160
    [hp_max]=160
    [atk]=14
    [def]=22
    [attack_name]="Boulder Smash"
)
declare -A EARTH_BEAR_COMMANDER=(
    [name]="Stone-Hide Bear"
    [hp]=240
    [hp_max]=240
    [atk]=20
    [def]=32
    [attack_name]="Rockslide Slam"
)
declare -A EARTH_BEAR_ELITE=(
    [name]="Granite Colossus Bear"
    [hp]=360
    [hp_max]=360
    [atk]=28
    [def]=44
    [attack_name]="Tectonic Crush"
)
declare -A EARTH_BEAR_BOSS=(
    [name]="LIVING MOUNTAIN BEAR"
    [hp]=580
    [hp_max]=580
    [atk]=40
    [def]=60
    [attack_name]="Earthsplitter"
)
 
# ============================================================
#  IRON BEAR LINE  (balanced power)
# ============================================================
declare -A IRON_BEAR=(
    [name]="Iron Bear"
    [hp]=150
    [hp_max]=150
    [atk]=20
    [def]=18
    [attack_name]="Ironslam"
)
declare -A IRON_BEAR_COMMANDER=(
    [name]="Steel Bear"
    [hp]=225
    [hp_max]=225
    [atk]=30
    [def]=26
    [attack_name]="Steel Crash"
)
declare -A IRON_BEAR_ELITE=(
    [name]="Titanium War Bear"
    [hp]=340
    [hp_max]=340
    [atk]=42
    [def]=36
    [attack_name]="Titanfall Strike"
)
declare -A IRON_BEAR_BOSS=(
    [name]="DREADNOUGHT IRON LORD"
    [hp]=550
    [hp_max]=550
    [atk]=60
    [def]=50
    [attack_name]="Oblivion Slam"
)
 
# ============================================================
#  GRIM BEAR LINE  (dark / cursed theme)
# ============================================================
declare -A GRIM_BEAR=(
    [name]="Grim Bear"
    [hp]=110
    [hp_max]=110
    [atk]=16
    [def]=11
    [attack_name]="Grimsweep"
)
declare -A GRIM_BEAR_COMMANDER=(
    [name]="Dread Bear"
    [hp]=175
    [hp_max]=175
    [atk]=24
    [def]=17
    [attack_name]="Dread Cleave"
)
declare -A GRIM_BEAR_ELITE=(
    [name]="Cursed Reaper Bear"
    [hp]=260
    [hp_max]=260
    [atk]=34
    [def]=23
    [attack_name]="Reaper's Harvest"
)
declare -A GRIM_BEAR_BOSS=(
    [name]="HERALD OF THE GRIM VOID"
    [hp]=430
    [hp_max]=430
    [atk]=50
    [def]=32
    [attack_name]="Void Oblivion"
)
 
# ============================================================
#  HOLLOW BEAR LINE  (soul / spirit theme, high HP)
# ============================================================
declare -A HOLLOW_BEAR=(
    [name]="Hollow Bear"
    [hp]=180
    [hp_max]=180
    [atk]=24
    [def]=15
    [attack_name]="Soul Crush"
)
declare -A HOLLOW_BEAR_COMMANDER=(
    [name]="Soulless Bear"
    [hp]=270
    [hp_max]=270
    [atk]=34
    [def]=22
    [attack_name]="Spirit Drain"
)
declare -A HOLLOW_BEAR_ELITE=(
    [name]="Specter Bear"
    [hp]=400
    [hp_max]=400
    [atk]=46
    [def]=30
    [attack_name]="Phantom Rend"
)
declare -A HOLLOW_BEAR_BOSS=(
    [name]="THE SOULLESS COLOSSUS"
    [hp]=650
    [hp_max]=650
    [atk]=65
    [def]=42
    [attack_name]="Eternal Soul Shatter"
)
 
# ============================================================
#  GRIZZLED MAULER LINE  (feral / berserker theme)
# ============================================================
declare -A GRIZZLED_MAULER=(
    [name]="Grizzled Mauler"
    [hp]=75
    [hp_max]=75
    [atk]=13
    [def]=6
    [attack_name]="Mauling Frenzy"
)
declare -A GRIZZLED_MAULER_COMMANDER=(
    [name]="Scarred Berserker Bear"
    [hp]=120
    [hp_max]=120
    [atk]=20
    [def]=10
    [attack_name]="Berserker Frenzy"
)
declare -A GRIZZLED_MAULER_ELITE=(
    [name]="Bloodsoaked Ravager"
    [hp]=185
    [hp_max]=185
    [atk]=30
    [def]=14
    [attack_name]="Gore Tornado"
)
declare -A GRIZZLED_MAULER_BOSS=(
    [name]="WARLORD OF THE WILD MAUL"
    [hp]=310
    [hp_max]=310
    [atk]=46
    [def]=20
    [attack_name]="Annihilation Frenzy"
)
 
# ============================================================
#  WATER BEAR LINE  (tide / ocean theme)
# ============================================================
declare -A WATER_BEAR=(
    [name]="Water Bear"
    [hp]=80
    [hp_max]=80
    [atk]=10
    [def]=8
    [attack_name]="Cutting Wave"
)
declare -A WATER_BEAR_COMMANDER=(
    [name]="Tidal Bear"
    [hp]=130
    [hp_max]=130
    [atk]=16
    [def]=13
    [attack_name]="Tidal Surge"
)
declare -A WATER_BEAR_ELITE=(
    [name]="Tempest Leviathan Bear"
    [hp]=200
    [hp_max]=200
    [atk]=24
    [def]=19
    [attack_name]="Maelstrom Slash"
)
declare -A WATER_BEAR_BOSS=(
    [name]="THE ABYSSAL TIDE LORD"
    [hp]=340
    [hp_max]=340
    [atk]=38
    [def]=28
    [attack_name]="Ocean's Wrath"
)
 
# ============================================================
#  FIRE BEAR LINE  (flame / inferno theme, high ATK)
# ============================================================
declare -A FIRE_BEAR=(
    [name]="Fire Bear"
    [hp]=90
    [hp_max]=90
    [atk]=18
    [def]=5
    [attack_name]="Inferno Beam"
)
declare -A FIRE_BEAR_COMMANDER=(
    [name]="Blazing Bear"
    [hp]=145
    [hp_max]=145
    [atk]=28
    [def]=8
    [attack_name]="Scorching Blast"
)
declare -A FIRE_BEAR_ELITE=(
    [name]="Magma Fury Bear"
    [hp]=220
    [hp_max]=220
    [atk]=40
    [def]=12
    [attack_name]="Volcanic Eruption"
)
declare -A FIRE_BEAR_BOSS=(
    [name]="THE ETERNAL INFERNO KING"
    [hp]=370
    [hp_max]=370
    [atk]=58
    [def]=18
    [attack_name]="Solar Flare Annihilation"
)
 
# ============================================================
#  AIR BEAR LINE  (wind / storm theme, low HP / high ATK)
# ============================================================
declare -A AIR_BEAR=(
    [name]="Air Bear"
    [hp]=65
    [hp_max]=65
    [atk]=14
    [def]=4
    [attack_name]="Galestrike"
)
declare -A AIR_BEAR_COMMANDER=(
    [name]="Cyclone Bear"
    [hp]=105
    [hp_max]=105
    [atk]=22
    [def]=7
    [attack_name]="Cyclone Slash"
)
declare -A AIR_BEAR_ELITE=(
    [name]="Thunderstorm Bear"
    [hp]=160
    [hp_max]=160
    [atk]=32
    [def]=10
    [attack_name]="Thunder Vortex"
)
declare -A AIR_BEAR_BOSS=(
    [name]="THE HURRICANE SOVEREIGN"
    [hp]=270
    [hp_max]=270
    [atk]=48
    [def]=15
    [attack_name]="Eye of the Storm"
)