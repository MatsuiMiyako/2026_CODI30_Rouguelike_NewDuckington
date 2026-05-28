#!/bin/bash
set -e
source new_duckington/main.sh
source "$GAME_ROOT/save/save_game.sh"
source "$GAME_ROOT/save/load_game.sh"
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/items/items_manager.sh"

load_player_data
display_player_stats
get_item_description funny_snack
test_use_item funny_snack
display_player_stats
get_item_description potion
test_use_item potion
display_player_stats
