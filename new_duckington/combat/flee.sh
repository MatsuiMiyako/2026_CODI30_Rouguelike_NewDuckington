#!/bin/bash

export GAME_ROOT="$(dirname "$0")/.."
source "$GAME_ROOT/system/stats.sh"

load_player_data



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

