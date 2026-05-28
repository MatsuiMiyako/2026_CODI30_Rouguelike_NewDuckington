#!/bin/bash
source new_duckington/main.sh
source "$GAME_ROOT/system/stats.sh"

ITEM_NAME="Potion"
ITEM_TYPE="Consumable"
ITEM_DESC="A mysterious concoction that is made from bear guts and dragon scales. Heals 20 HP."
item_effect() {
    if [[ "$PLAYER_HP + 20" -ge "$PLAYER_HP_MAX" ]]; then
        health_restored=$((PLAYER_HP_MAX - PLAYER_HP))
        PLAYER_HP=$PLAYER_HP_MAX
        echo "You used $ITEM_NAME, and you restored $health_restored HP. Your HP is now full at $PLAYER_HP/$PLAYER_HP_MAX."
    else
        PLAYER_HP=$((PLAYER_HP + 20))
        echo "You used $ITEM_NAME, and Your HP is now at $PLAYER_HP/$PLAYER_HP_MAX."
    fi

    # save the game
    save_player_data
}
ITEM_RARITY="Common"
ITEM_NUMBER=003