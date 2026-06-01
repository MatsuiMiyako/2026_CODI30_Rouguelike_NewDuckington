#!/bin/bash

source new_duckington/main.sh
source "$GAME_ROOT/data/lore/tome_of_knowledge.sh"

ITEM_NAME="Tome of Knowledge"
ITEM_TYPE="Book"
ITEM_DESC="All the answers to why we don't talk about *that*"
item_effect() {
    if [[ "$PART_1" == "true" ]]; then
        echo "part 1 story placeholder"
        # maybe even a story event function from source "$GAME_ROOT/data/lore/tome_of_knowledge.sh"

    elif [[ "$PART_2" == "true" ]]; then
        echo "part 2 story placeholder"

    elif [[ "$PART_3" == "true" ]]; then
        echo "part 3 story placeholder"

    else
        echo "You don't actually know or remember anything. Your mind is blank as a canvas."
    fi
}
ITEM_RARITY="Legendary"
ITEM_NUMBER=011
ITEM_COST=0
ITEM_SELL=0