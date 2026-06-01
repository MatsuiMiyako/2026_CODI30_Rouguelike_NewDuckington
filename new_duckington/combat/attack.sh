#!/bin/bash

attack() {

	DAMAGE_DONE=$(( $PLAYER_ATK - $ENEMY_DEF ))

	echo "you have $PLAYER_ATK damage and $ENEMY_NAME has $ENEMY_DEF defence"

	ENEMY_HP=$(( $ENEMY_HP - 999 ))

	if [[ $ENEMY_HP -lt 1 ]]; then
		ENEMY_HP=0
	fi

	echo "$ENEMY_NAME has taken $DAMAGE_DONE damage the enemy now has $ENEMY_HP HP"

	if [[ $ENEMY_HP == 0 ]]; then
		win_screen
		echo "returning to main menu"
		battle_end=true

	fi

}