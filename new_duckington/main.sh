#!/bin/bash
export GAME_ROOT="$(dirname "$0")"
source "$GAME_ROOT/screens/main_menu.sh"

# main game loop
display_title
display_inital_menu
get_user_option
