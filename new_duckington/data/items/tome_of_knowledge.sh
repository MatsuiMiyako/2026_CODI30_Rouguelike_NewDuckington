#!/bin/bash

source new_duckington/main.sh
source "$GAME_ROOT/data/lore/tome_of_knowledge.sh"

ITEM_NAME="Tome of Knowledge"
ITEM_TYPE="Book"
ITEM_DESC="All the answers to why we don't talk about *that*"
item_effect() {
    if [[ "$PART_1" == "true" ]]; then
        echo "Long ago, in the Kingdom of Duckington...
        There lived a royal family headed by their majesty, Queen Avian. She was beloved by all ducks of their home in Whispering Waters. This pond was serene and fair, well-known for the kingdom's diplomacy across all the lands.
        The royal family had headed their dynasty with justice, pride, and honour for generations prior, since the founding of Duckington. They had done this with the help of their brawny neighbours, the bears, to whom the ducks attributed great respect and gratitiude.
        They lived in peace and harmony until the fall of Old Duckington. 
        Queen Avian had once been a beautiful and kind princess"
        # maybe even a story event function from source "$GAME_ROOT/data/lore/tome_of_knowledge.sh"

    elif [[ "$PART_2" == "true" ]]; then
        echo "part 2 story placeholder"

    elif [[ "$PART_3" == "true" ]]; then
        echo "The truth is not as it seems... 
        in the aftermath of the Great Massacre of Whispering Waters, New Duckington was created. To keep the resistance alive, New Duckington buried their dead-- and the truth. They did not want the other ducks to find that we COULD live peacefully with the bears.
        They antagonized them for all ducks today, under the guise of: 'one cannot speak of Old Duckington.'"

    else
        echo "You don't actually know or remember anything. Your mind has been blank as a canvas. Since the asteriod hit and you were recruited to New Duckington."
    fi
}
ITEM_RARITY="Legendary"
ITEM_NUMBER=011
ITEM_COST=0
ITEM_SELL=0
