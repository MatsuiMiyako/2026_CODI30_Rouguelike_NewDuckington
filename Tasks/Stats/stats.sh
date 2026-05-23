#!/bin/bash

lvl=1
current_xp=0
max_xp=10
current_hp=100
max_hp=100
atk=10
def=10
current_nrg=10
max_nrg=10
spd=10
lck=2

display_stats() {
    echo "╔══════════════════════════════╗"
    echo "║       PLAYER  STATS          ║"
    echo "╠══════════════════════════════╣"
    printf "║  LVL: %d        XP: %d/%d       ║\n" "lvl" "current_xp" "max_xp"
    printf "║  HP : %d/%d                    ║\n" "current_hp" "max_hp"
    printf "║  NRG: %d/%d                    ║\n" "current_nrg" "max_nrg"
    printf "║  ATK: %d        DEF: %d        ║\n" "atk" "def"
    printf "║  SPD: %d        LCK: %d%%       ║\n" "spd" "lck"
    echo "╚══════════════════════════════╝"
}

display_stats