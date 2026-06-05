#!/bin/bash

use_input="not set" #valid or error as needed...
choice=""
# Replace the fragile $0-based path with BASH_SOURCE
#export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/save/save_game.sh"
source "$GAME_ROOT/save/load_game.sh"
source "$GAME_ROOT/screens/character_select_screen.sh"

display_title(){
	echo -e "
██████╗  ██████╗   ██████╗ ██╗   ██╗ ███████╗ ██╗      ██╗ ██╗  ██╗ ███████╗
██╔══██╗██╔═══██╗ ██╔════╝ ██║   ██║ ██╔════╝ ██║      ██║ ██║ ██╔╝ ██╔════╝
██████╔╝██║   ██║ ██║  ███╗██║   ██║ █████╗   ██║      ██║ █████╔╝  █████╗  
██╔══██╗██║   ██║ ██║   ██║██║   ██║ ██╔══╝   ██║      ██║ ██╔═██╗  ██╔══╝  
██║  ██║╚██████╔╝ ╚██████╔╝╚██████╔╝ ███████╗ ███████╗ ██║ ██║  ██╗ ███████╗
╚═╝  ╚═╝ ╚═════╝   ╚═════╝  ╚═════╝  ╚══════╝ ╚══════╝ ╚═╝ ╚═╝  ╚═╝ ╚══════╝

███╗   ██╗███████╗██╗    ██╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ████████╗ ██████╗ ███╗   ██╗
████╗  ██║██╔════╝██║    ██║██╔══██╗██║   ██║██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ╚══██╔══╝██╔═══██╗████╗  ██║
██╔██╗ ██║█████╗  ██║ █╗ ██║██║  ██║██║   ██║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗   ██║   ██║   ██║██╔██╗ ██║
██║╚██╗██║██╔══╝  ██║███╗██║██║  ██║██║   ██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║   ██║   ██║   ██║██║╚██╗██║
██║ ╚████║███████╗╚███╔███╔╝██████╔╝╚██████╔╝╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝   ██║   ╚██████╔╝██║ ╚████║
╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝ ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═══╝
"
}

display_inital_menu()
{
		echo ""
	echo "╔══════════════════════════════════════╗"
	echo "║            [1] START GAME            ║"
	echo "╠══════════════════════════════════════╣"
	echo "║          [2] SAVE PROGRESS           ║"
	echo "╠══════════════════════════════════════╣"
	echo "║            [3] LOAD GAME             ║"
	echo "╠══════════════════════════════════════╣"
	echo "║             [4] EXIT GAME            ║"
	echo "╚══════════════════════════════════════╝"

	echo ""
}

get_user_option()
{
	get_and_check_input_is_valid
	
	
	case $choice in
	    1)
	        echo "Starting game..."
	        sleep 2
	        display_character_select_title
	        ;;
	    2)
	        echo "Saving progress..."
	        export_player_data
	        sleep 2
	        ;;
	    3)
	        echo "Loading game..."
	        load_player_data
	        sleep 2
	        ;;
	    4)
	        echo "Goodbye!"
	        exit 0
	        ;;
	    *)
	        echo -e "Oops! Something went wrong :( \nPlease use only numbers from the menu options :D"
	        sleep 2
	        ;;
	esac
}

get_and_check_input_is_valid()
{
	read -p "ENTER CHOICE: " choice
	#use logic to test that the users input is valid for our use. Is only a single digit number for example...
}

