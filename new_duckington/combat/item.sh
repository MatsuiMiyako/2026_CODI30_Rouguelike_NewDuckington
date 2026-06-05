#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/main.sh"
source "$GAME_ROOT/system/stats.sh"
source "$GAME_ROOT/data/items/items_manager.sh"

item() {
    display_player_items
    # if the player enters show_item <item name>, show the item description
    # if the player enters use_item <item name>, use the item
    # take the user input and parse it
    while true; do
        read -p "Enter command: " cmd arg
        case "$cmd" in
            show_item)
                get_item_description "$arg"
                ;;
            use_item)
                use_item "$arg"
                break
                ;;
            *)
                echo "Invalid command. Use 'show_item <item name>' or 'use_item <item name>'."
                ;;
        esac
    done
}
