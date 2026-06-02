#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/enemy_data.sh"
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/combat/attack.sh"
source "$GAME_ROOT/combat/flee.sh"
source "$GAME_ROOT/combat/item.sh"
source "$GAME_ROOT/combat/skill.sh"
source "$GAME_ROOT/screens/lose_screen.sh"
source "$GAME_ROOT/screens/win_screen.sh"

load_player_data

player_turn=true
base_flee_chance=10
battle_end=false

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

clear

# Accepts an enemy as the first arguement when running the script but also defaults if empty, ADD HANDLING FOR INVALID LATER
declare -n current_enemy="${1:-BEAR_GRUNT}"

action_selection() {

	read -p "Enter choice: " action

	case $action in
	        1|attack|Attack)
	            echo -e "${RED}You attack the enemy!${NC}"
	            attack
	            ;;
	            
			2|skill)
				echo -e "${BLUE}You prepare a skill...${NC}"
				bash "$GAME_ROOT/combat/skill.sh"
	            ;;
	            
			3|item)
				echo -e "${YELLOW}Opening inventory...${NC}"
				bash "$GAME_ROOT/combat/item.sh"
	            ;;
	            
			4|flee)
				echo -e "${GREEN}You attempt to flee!${NC}"
				bash "$GAME_ROOT/combat/flee.sh"
	            ;;
	            
	        *)
	            echo
	            echo -e "Invalid option. Try again."
	            sleep 2
	            
	            action_selection
	            ;;
	    esac
}


while [[ $battle_end == false ]]; do
	
# player turn loop
	while [[ $player_turn == true ]]; do

		
	    echo -e "${CYAN}========================================${NC}"
	    echo -e "${YELLOW}         ⚔ YOUR TURN ⚔${NC}"
	    echo -e "${CYAN}========================================${NC}"

	    paste -d ' ' \
    	<(display_player_stats) \
    	<(display_enemy_stats "current_enemy")

	    echo -e "Choose your action:${NC}"
	    echo -e "${RED}[1] Attack${NC}"
	    echo -e "${BLUE}[2] Skill${NC}"
	    echo -e "${YELLOW}[3] Item${NC}"
	    echo -e "${GREEN}[4] Flee${NC} (your flee chance is $(( $base_flee_chance + $PLAYER_SPD*PLAYER_LCK/2 ))%)"
	    echo



	    action_selection

	    sleep 1

	    player_turn=false
	    
	done



	while [[ $player_turn != true ]]; do

		if [[ ${current_enemy[hp]} != 0 ]]; then

		
			echo -e "${YELLOW}========================================${NC}"
			echo -e "${RED}         ⚔ ENEMY TURN ⚔${NC}"
		    echo -e "${YELLOW}========================================${NC}"
		 	

		    echo -e "${RED}${current_enemy[name]} has used ${current_enemy[attack_name]:-"claw"}${NC}"

		    DAMAGE_TAKEN=$((${current_enemy[atk]} - $PLAYER_DEF))

			echo -e "the enemy has ${current_enemy[atk]} damage and you have $PLAYER_DEF def"
		    echo -e "you have taken $DAMAGE_TAKEN damage"
		    PLAYER_HP=$(($PLAYER_HP-$DAMAGE_TAKEN))

			if [[ $PLAYER_HP -lt 1 ]]; then
			  	PLAYER_HP=0
			fi


			read -p "press enter to continue: " hi
		    player_turn=true

		    if [[ $PLAYER_HP == 0 ]]; then
		    	battle_end=true
		    	lose_screen
		
			fi
		    break
	    fi
	done

done

