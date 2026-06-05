#!/bin/bash

attack() {
	DAMAGE_DONE=$(($PLAYER_ATK-${current_enemy[def]}))

	if [[ $DAMAGE_DONE -lt 1 ]]; then
		DAMAGE_DONE=1
	fi

	echo "you have $PLAYER_ATK damage and ${current_enemy[name]} has ${current_enemy[def]} defence"

	current_enemy[hp]=$(( ${current_enemy[hp]} - $DAMAGE_DONE ))

	if [[ ${current_enemy[hp]} -lt 1 ]]; then
		${current_enemy[hp]}=0
	fi

	echo "${current_enemy[name]} has taken $DAMAGE_DONE damage the enemy now has ${current_enemy[hp]} HP"

	if [[ ${current_enemy[hp]} == 0 ]]; then
		win_screen
		echo "returning to main menu"
		battle_end=true
	fi
}

flee() {
	base_flee_chance=10

	flee_chance=$(( $base_flee_chance + $PLAYER_SPD*PLAYER_LCK/2 ))

	#sets max flee chance to 75%
	if [[ flee_chance -gt 33 ]]; then

		flee_chance=33
	fi

	#generates a number for 1-100
	random_number=$(( $RANDOM % 100))

	if [[ $random_number -le $flee_chance ]]; then

		echo "You have successfully escaped"
		echo "returning to game"
		#go to next room

	else

		echo "you have failed to escape"
		#return to combat (opponents turn)
	fi
}

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