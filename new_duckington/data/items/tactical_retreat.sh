#!/bin/bash

# import what you need here, for example:
export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/main.sh"
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/skill-cards/skills_manager.sh"

ITEM_NAME="Tactical Retreat" # Name of the item that will be displayed by the game
ITEM_TYPE="Skill Card" # Type of the item, which can be "Consumable", "Junk", "Skill Card", "Book"
ITEM_DESC="You live to fight another day"
item_effect() {
    learn_skill tactical_retreat
}
ITEM_RARITY="Rare"
ITEM_NUMBER=012
ITEM_COST=0
ITEM_SELL=800