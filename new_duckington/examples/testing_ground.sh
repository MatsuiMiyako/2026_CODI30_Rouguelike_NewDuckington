#!/bin/bash
set -e
source new_duckington/main.sh
source "$GAME_ROOT/save/save_game.sh"
source "$GAME_ROOT/save/load_game.sh"
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/items/items_manager.sh"
source "$GAME_ROOT//data/skill-cards/skills_manager.sh"

load_player_data
use_item "tome_of_knowledge"
