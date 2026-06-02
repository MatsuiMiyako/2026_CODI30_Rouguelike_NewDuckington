#!/bin/bash
# Enemy data file — only stores enemy stats, no logic here

declare -A BEAR_GRUNT=(
    [name]="THE BIG BAD BROWN BEAST"
    [hp]=110
    [hp_max]=110
    [atk]=16
    [def]=11
    [attack]="Ferocious Prowl"
)

declare -A EARTH_BEAR=(
    [name]="Earth Bear"
    [hp]=160
    [hp_max]=160
    [atk]=14
    [def]=22
    [attack]="Boulder Smash"
)

declare -A IRON_BEAR=(
    [name]="Ironbear"
    [hp]=150
    [hp_max]=150
    [atk]=20
    [def]=18
    [attack]="Ironslam"
)

declare -A GRIM_BEAR=(
    [name]="Grimbear"
    [hp]=110
    [hp_max]=110
    [atk]=16
    [def]=11
    [attack]="Grimsweep"
)

declare -A HOLLOW_BEAR=(
    [name]="Hollowbear"
    [hp]=180
    [hp_max]=180
    [atk]=24
    [def]=15
    [attack]="Soul Crush"
)

declare -A GRIZZLED_MAULER=(
    [name]="Grizzled Mauler"
    [hp]=75
    [hp_max]=75
    [atk]=13
    [def]=6
    [attack]="Mauling Frenzy"
)

declare -A WATER_BEAR=(
    [name]="Waterbear"
    [hp]=80
    [hp_max]=80
    [atk]=10
    [def]=8
    [attack]="Cutting Wave"
)

declare -A FIRE_BEAR=(
    [name]="Firebear"
    [hp]=90
    [hp_max]=90
    [atk]=18
    [def]=5
    [attack]="Inferno Beam"
)

declare -A AIR_BEAR=(
    [name]="Airbear"
    [hp]=65
    [hp_max]=65
    [atk]=14
    [def]=4
    [attack]="Galestrike"
)
