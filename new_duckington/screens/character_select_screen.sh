#!/bin/bash

export GAME_ROOT="$(dirname "${BASH_SOURCE[0]}")/.."
source "$GAME_ROOT/save/save_game.sh"
source "$GAME_ROOT/save/load_game.sh"
source "$GAME_ROOT/data/player_data.sh"

choice=""
selected_character=""

# placeholder character names for now
character_1="Bill Muscovski"
character_2="Crystal Quacker"
character_3="Kyle Pekins"

display_character_select_title()
{
	echo ""
	echo "╔══════════════════════════════════════╗"
	echo "║         CHOOSE YOUR CHARACTER        ║"
	echo "╚══════════════════════════════════════╝"
	echo ""
}

display_character_select_menu()
{
	echo "╔═════════════════════════════════════╗"
	printf "║           [1] $character_1        ║\n"
	echo "╠═════════════════════════════════════╣"
	printf "║           [2] $character_2       ║\n"
	echo "╠═════════════════════════════════════╣"
	printf "║           [3] $character_3           ║\n"
	echo "╚═════════════════════════════════════╝"
	echo ""
}

get_and_check_input_is_valid()
{
	while true
	do
		read -p "ENTER CHOICE (1-3): " choice

		if [[ "$choice" =~ ^[1-3]$ ]]
		then
			break
		else
			echo -e "Oops! Invalid choice :(\nPlease use only 1, 2, or 3."
			sleep 1
		fi
	done
}

get_character_selection()
{
	get_and_check_input_is_valid

	case $choice in
		1)
			selected_character="$character_1"
			;;
		2)
			selected_character="$character_2"
			;;
		3)
			selected_character="$character_3"
			;;
	esac

	echo "You selected: $selected_character"
	# Player data initialization based on character selection
	PLAYER_NAME="$selected_character"
	save_player_data # Save the selected character's data
	sleep 1
}

run_character_select_screen()
{
	display_character_select_title
	display_character_select_menu
	get_character_selection

	if [[ -f "$GAME_ROOT/game_loop.sh" ]]; then
		bash "$GAME_ROOT/game_loop.sh"
	else
		echo "Error: game_loop.sh not found!"
		echo "Make sure game_loop.sh exists in $GAME_ROOT"
		exit 1
	fi
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]
then
	run_character_select_screen
fi

