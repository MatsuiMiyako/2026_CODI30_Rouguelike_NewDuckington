#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/main.sh"
source "$GAME_ROOT/save/save_game.sh"
source "$GAME_ROOT/save/load_game.sh"
source "$GAME_ROOT/system/stats.sh"

learn_skill() {
    local SKILL_ID="$1"
    local SKILL_FILE="$GAME_ROOT/data/skill-cards/unequipped/$SKILL_ID.sh"
    local EQUIPPED_DIRECTORY="$GAME_ROOT/data/skill-cards/equipped"

    if [ ! -e "$SKILL_FILE" ]; then
        echo "You already have this skill equipped!"
        echo "Try selling this instead!"
        return
    fi

    mv "$SKILL_FILE" "$EQUIPPED_DIRECTORY"

    # Format name for display
    local DISPLAY_NAME="${SKILL_ID//_/ }"
    DISPLAY_NAME=$(echo "$DISPLAY_NAME" | sed 's/\b\(.\)/\u\1/g')

    if [[ -z "$PLAYER_SKILL_CARDS" ]]; then
        PLAYER_SKILL_CARDS="$DISPLAY_NAME"
    else
        PLAYER_SKILL_CARDS="$PLAYER_SKILL_CARDS, $DISPLAY_NAME"
    fi

    save_player_data
    echo "You used $DISPLAY_NAME and learned the $DISPLAY_NAME skill card!"
}