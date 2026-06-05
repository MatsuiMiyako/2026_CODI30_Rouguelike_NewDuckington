#!/bin/bash

load_player_data(){
    source "$GAME_ROOT/data/player_data.sh"
}

save_player_data() {
    cat > "$GAME_ROOT/data/player_data.sh" << EOF
#!/bin/bash
 
PLAYER_NAME="$PLAYER_NAME"
PLAYER_LEVEL=$PLAYER_LEVEL
PLAYER_XP=$PLAYER_XP
PLAYER_XP_NEXT=$PLAYER_XP_NEXT
PLAYER_STAT_POINTS=$PLAYER_STAT_POINTS
PLAYER_GOLD=$PLAYER_GOLD
PLAYER_FLOOR=$PLAYER_FLOOR
 
PLAYER_HP=$PLAYER_HP
PLAYER_HP_MAX=$PLAYER_HP_MAX
PLAYER_ATK=$PLAYER_ATK
PLAYER_DEF=$PLAYER_DEF
PLAYER_NRG=$PLAYER_NRG
PLAYER_NRG_MAX=$PLAYER_NRG_MAX
PLAYER_SPD=$PLAYER_SPD
PLAYER_LCK=$PLAYER_LCK
 
PLAYER_WEAPON="$PLAYER_WEAPON"
PLAYER_ARMOR="$PLAYER_ARMOR"
PLAYER_HAT="$PLAYER_HAT"
 
PLAYER_ITEMS="$PLAYER_ITEMS"
PLAYER_SKILL_CARDS="$PLAYER_SKILL_CARDS"
EOF
}

source "$GAME_ROOT/data/enemy_data.sh"

animated_hp_bar_line() {
    # Source: https://github.com/extensionsapp/progre.sh
    # Claude is a genius for this one
    local current=$1
    local max=$2
    local width=20
    local delay=0.01

    [ "$max" -le 0 ] && max=1
    [ "$current" -lt 0 ] && current=0
    [ "$current" -gt "$max" ] && current=$max

    local percent=$(( current * 100 / max ))
    local filled=$(( current * width / max ))

    # Colors
    local RED='\033[1;31m'
    local YELLOW='\033[1;33m'
    local GREEN='\033[1;32m'
    local RESET='\033[0m'

    local color
    if [ "$percent" -ge 70 ]; then
        color=$GREEN
    elif [ "$percent" -ge 30 ]; then
        color=$YELLOW
    else
        color=$RED
    fi

    # Build the bar once
    local bar=""
    local empty=""
    
    for ((i=0; i<filled; i++)); do
        bar="${bar}█"
    done
    
    for ((i=0; i<width-filled; i++)); do
        empty="${empty}░"
    done

    # Animate by printing progressively
    for ((i=0; i<=filled; i++)); do
        local partial_bar=""
        for ((j=0; j<i; j++)); do
            partial_bar="${partial_bar}█"
        done
        for ((j=i; j<width; j++)); do
            partial_bar="${partial_bar}░"
        done
        
        printf "\rHP [${color}%s${RESET}] %3d%% (%d/%d)" "$partial_bar" "$percent" "$current" "$max"
        sleep "$delay"
    done
    
    # Return the final bar with newline
    printf "HP [${color}%s${RESET}] %3d%% (%d/%d)\n" "$bar$empty" "$percent" "$current" "$max"
}


display_player_stats() {
    echo "╔══════════════════════════════╗"
    echo "║       PLAYER  STATS          ║"
    echo "╠══════════════════════════════╣"
    printf "║  LVL: %3d   XP: %5d/%-5d  ║\n" "$PLAYER_LEVEL" "$PLAYER_XP" "$PLAYER_XP_NEXT"
    printf "║  HP : %5d/%-5d            ║\n" "$PLAYER_HP" "$PLAYER_HP_MAX"
    printf "║  NRG: %5d/%-5d            ║\n" "$PLAYER_NRG" "$PLAYER_NRG_MAX"
    printf "║  ATK: %3d   DEF: %3d         ║\n" "$PLAYER_ATK" "$PLAYER_DEF"
    printf "║  SPD: %3d   LCK: %3d%%        ║\n" "$PLAYER_SPD" "$PLAYER_LCK"
    echo "╚══════════════════════════════╝"

}

display_player_equipment() {
    echo "╔══════════════════════════════╗"
    echo "║       PLAYER  EQUIPMENT      ║"
    echo "╠══════════════════════════════╣"
    printf "║  WEAPON: %-19s ║\n" "$PLAYER_WEAPON"
    printf "║  ARMOR : %-19s ║\n" "$PLAYER_ARMOR"
    printf "║  HAT   : %-19s ║\n" "$PLAYER_HAT"
    echo "╚══════════════════════════════╝"
}

display_player_items() {
    echo "╔═══════════════════════════════════════════╗"
    echo "║              PLAYER  ITEMS                ║"
    echo "╠═══════════════════════════════════════════╣"

    if [ ${#PLAYER_ITEMS[@]} -eq 0 ]; then
        printf "║  %-40s ║\n" "None"
    fi
    
    local i=1
    for item in "${PLAYER_ITEMS[@]}"; do
        printf "║  [%2d] %-35.35s ║\n" "$i" "$item"
        ((i++))
    done

    echo "╠═══════════════════════════════════════════╣"
    echo "║  show_item <item name>                    ║"
    echo "║  use_item <item name>                     ║"
    echo "╚═══════════════════════════════════════════╝"
}

display_player_skill_cards() {
    echo "╔═══════════════════════════════════════════╗"
    echo "║            PLAYER  SKILL CARDS            ║"
    echo "╠═══════════════════════════════════════════╣"

    if [ ${#PLAYER_SKILL_CARDS[@]} -eq 0 ]; then
        printf "║  %-40s ║\n" "None"
    fi
    
    local i=1
    for item in "${PLAYER_SKILL_CARDS[@]}"; do
        printf "║  [%2d] %-35.35s ║\n" "$i" "$item"
        ((i++))
    done

    echo "╠═══════════════════════════════════════════╣"
    echo "║  show_card <card name>                    ║"
    echo "╚═══════════════════════════════════════════╝"
}

display_enemy_stats() {
    local -n enemy="$1"
    echo "╔═════════════════════════════════════════╗"
    printf "║  ENEMY: %-31s ║\n" "${enemy[name]}"
    echo "╠═════════════════════════════════════════╣"
    printf "║  HP : %5d/%-5d                       ║\n" "${enemy[hp]}" "${enemy[hp_max]}"
    printf "║  ATK: %3d   DEF: %3d                    ║\n" "${enemy[atk]}" "${enemy[def]}"
    printf "║  BASIC ATK: %-16s            ║\n" "${enemy[attack_name]}"
    echo "╚═════════════════════════════════════════╝"

}

