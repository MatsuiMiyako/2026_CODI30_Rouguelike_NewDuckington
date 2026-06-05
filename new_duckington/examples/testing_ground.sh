#!/bin/bash
set -e
export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/main.sh"
source "$GAME_ROOT/save/save_game.sh"
source "$GAME_ROOT/save/load_game.sh"
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/items/items_manager.sh"
source "$GAME_ROOT/data/skill-cards/skills_manager.sh"

give_item "potion"