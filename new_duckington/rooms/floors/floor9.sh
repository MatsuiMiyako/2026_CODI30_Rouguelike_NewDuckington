#!/bin/bash

run_floor() {

    echo "Floor 2"
    echo "You hear dripping water." #SOMEONE UPDATE THIS WITH THE DESRIPTION THAT SHOULD BE THERE RELATED TO THE LORE

    for room in {1..10}; do

        echo
        echo "Room $room"

        if [[ $room -eq 9 ]]; then

            shop

        elif [[ $room -eq 10 ]]; then

            miniboss_room

        else

            generate_room

        fi

    done
}   