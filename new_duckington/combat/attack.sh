#!/bin/bash

attack() {

	DAMAGE_DONE=$(( $PLAYER_ATK - ${BEAR_GRUNT[def]} ))

	if [[ $DAMAGE_DONE -lt 1 ]]; then
		DAMAGE_DONE=1
	fi

	echo "you have $PLAYER_ATK damage and ${BEAR_GRUNT[name]} has ${BEAR_GRUNT[def]} defence"

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