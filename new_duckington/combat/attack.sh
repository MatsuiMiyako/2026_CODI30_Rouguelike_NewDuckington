#!/bin/bash

attack() {

	DAMAGE_DONE=$(( $PLAYER_ATK - ${BEAR_GRUNT[def]} ))

	echo "you have $PLAYER_ATK damage and $ENEMY_NAME has $ENEMY_DEF defence"

	BEAR_GRUNT[hp]=$(( ${BEAR_GRUNT[hp]} - $DAMAGE_DONE ))

	if [[ ${BEAR_GRUNT[hp]} -lt 1 ]]; then
		${BEAR_GRUNT[hp]}=0
	fi

	echo "$ENEMY_NAME has taken $DAMAGE_DONE damage the enemy now has ${BEAR_GRUNT[hp]} HP"

	if [[ ${BEAR_GRUNT[hp]} == 0 ]]; then
		win_screen
		echo "returning to main menu"
		battle_end=true

	fi

}