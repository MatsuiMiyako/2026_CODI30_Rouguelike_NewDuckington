#!/bin/bash

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