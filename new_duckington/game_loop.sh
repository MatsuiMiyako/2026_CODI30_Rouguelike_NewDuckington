#!/bin/bash
# NEW DUCKINGTON - MAIN GAME LOOP
# This runs after character selection and handles all floor/room progression

export GAME_ROOT="$(dirname "$0")"

# Source required systems
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/system/levels.sh"
source "$GAME_ROOT/data/enemy_data.sh"
source "$GAME_ROOT/data/items/items_manager.sh"
source "$GAME_ROOT/data/skill-cards/skills_manager.sh"
source "$GAME_ROOT/rooms/roomgenerator.sh"
source "$GAME_ROOT/combat/combat_manager.sh"
source "$GAME_ROOT/screens/win_screen.sh"
source "$GAME_ROOT/screens/lose_screen.sh"

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m'

# ============================================================
# GAME STATE
# ============================================================
current_floor=1
game_over=false
game_won=false

# ============================================================
# MAIN GAME LOOP
# ============================================================
start_game_loop() {
    # Load the player data that was saved during character selection
    load_player_data
    
    # Initialize progression systems
    levels_sync_progression
    
    clear
    echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}     WELCOME TO NEW DUCKINGTON, $PLAYER_NAME${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
    echo
    echo -e "You stand before the Bear Fortress."
    echo -e "Ten floors of challenges await you."
    echo -e "Good luck, and may the asteroid power guide you."
    echo
    read -p "Press Enter to begin your descent..."
    
    # MAIN FLOOR LOOP (Floors 1-10)
    while [[ $current_floor -le 10 ]] && [[ $game_over == false ]]; do
        run_floor "$current_floor"
        
        if [[ $game_over == true ]]; then
            break
        fi
        
        ((current_floor++))
        PLAYER_FLOOR=$current_floor
        save_player_data
    done
    
    # Check win condition (beat floor 10)
    if [[ $current_floor -gt 10 ]] && [[ $game_over == false ]]; then
        game_won=true
        display_victory_screen
    fi
}

# ============================================================
# RUN A SINGLE FLOOR
# ============================================================
run_floor() {
    local floor_num=$1
    
    clear
    echo -e "${CYAN}╔════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║              FLOOR $floor_num                          ║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════╝${NC}"
    echo
    
    # Source the floor script
    if [[ -f "$GAME_ROOT/rooms/floors/floor${floor_num}.sh" ]]; then
        source "$GAME_ROOT/rooms/floors/floor${floor_num}.sh"
        # Assumes floor script defines run_floor function
        run_floor
    else
        echo "Error: Floor $floor_num script not found!"
        game_over=true
        return
    fi
}

# ============================================================
# VICTORY SCREEN
# ============================================================
display_victory_screen() {
    clear
    echo -e "${GREEN}"
    echo "--------------------------------------------------------------------------------
    ██╗   ██╗██╗ ██████╗████████╗ ██████╗ ██████╗ ██╗   ██╗
    ██║   ██║██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝
    ██║   ██║██║██║        ██║   ██║   ██║██████╔╝ ╚████╔╝ 
    ╚██╗ ██╔╝██║██║        ██║   ██║   ██║██╔══██╗  ╚██╔╝  
     ╚████╔╝ ██║╚██████╗   ██║   ╚██████╔╝██║  ██║   ██║   
      ╚═══╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
    --------------------------------------------------------------------------------"
    echo -e "${NC}"
    echo
    echo "You have defeated the Bear and Dragon duo!"
    echo "Vengeance has been served."
    echo
    echo -e "${YELLOW}═══ FINAL STATS ═══${NC}"
    echo "Level: $PLAYER_LEVEL"
    echo "Total Experience: $PLAYER_XP"
    echo "Gold Collected: $PLAYER_GOLD"
    echo
    echo "New Duckington is saved!"
    echo
    read -p "Press Enter to return to main menu..."
}

# ============================================================
# DEFEAT HANDLER
# ============================================================
handle_defeat() {
    game_over=true
    lose_screen
    
    echo
    read -p "Would you like to restart? (yes/no): " restart_choice
    
    if [[ "$restart_choice" == "yes" ]] || [[ "$restart_choice" == "y" ]]; then
        # Reset to floor 1 but keep level
        current_floor=1
        PLAYER_FLOOR=1
        game_over=false
        game_won=false
        save_player_data
        start_game_loop
    else
        echo "Thanks for playing New Duckington!"
        exit 0
    fi
}

# ============================================================
# EXPORT FUNCTIONS FOR FLOORS TO USE
# ============================================================
export -f handle_defeat

# ============================================================
# START THE GAME
# ============================================================
start_game_loop