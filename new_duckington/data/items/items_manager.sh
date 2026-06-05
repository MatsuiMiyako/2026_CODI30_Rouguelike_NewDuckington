#!/bin/bash

# This file gets all the items under the data/items folder and put them into the variable ITEMS_POOL, 
# which will be used in the game to generate random items for the player.

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/main.sh"
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/player_data.sh"

ITEMS_POOL=()
for item_file in "$GAME_ROOT"/data/items/*; do
    if [[ -f "$item_file" ]] && [[ "$item_file" != "$GAME_ROOT"/data/items/items_manager.sh ]]; then
        item_name=$(basename "$item_file")
        ITEMS_POOL+=("$item_name")
    fi
done

get_item_pool() {
    # get rid of the .sh suffix and display the item names in the pool
    echo "Items Pool:"
    for item in "${ITEMS_POOL[@]}"; do
        echo "- ${item%.sh}"
    done
}

get_item_description() {
    # get item description by sourcing the item file and echoing the ITEM_DESC variable
    local item_name="$1"
    local item_file="$GAME_ROOT/data/items/$item_name.sh"
    if [[ -f "$item_file" ]]; then
        source "$item_file"
        echo "$ITEM_DESC"
    else
        echo "Item file $item_file not found!"
    fi
}

use_item() {
    # testing the use of an item
    # the item you want to test stored in the variable TEST_ITEM from the item pool, and find the path of the item file, 
    # then source it to use the item_effect function.
    TEST_ITEM="$1.sh" # takes the item name as an argument, for example "potion.sh"
    local item_file="$GAME_ROOT/data/items/$TEST_ITEM"
    if [[ -f "$item_file" ]]; then
        source "$item_file"
        item_effect
    else
        echo "Item file $item_file not found!"
    fi
}

add_item_to_inventory() {
    local item_name="$1"
    if [[ -z "$PLAYER_ITEMS" ]]; then
        PLAYER_ITEMS="$item_name"
        echo "You have added $item_name to your inventory!"
        save_player_data
    else
        PLAYER_ITEMS="$PLAYER_ITEMS, $item_name"
        echo "You have added $item_name to your inventory!"
        save_player_data
    fi
}

give_item() {
    # give the player a specific item, for testing purposes, the item name is stored in the variable TEST_ITEM, and the item file is sourced to give the item to the player.
    TEST_ITEM="$1" # takes the item name as an argument, for example "potion.sh"
    local item_file="$GAME_ROOT/data/items/$TEST_ITEM.sh"
    if [[ -f "$item_file" ]]; then
        source "$item_file"
        add_item_to_inventory "$TEST_ITEM"
        echo "You have received a $TEST_ITEM!"
    else
        echo "Item file $item_file not found!"
    fi
}