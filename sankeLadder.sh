#!/bin/bash

echo "Welcome to Snake and Ladder"

PLAYER_POSITION=0
currentPosition=$PLAYER_POSITION

dieRoll() {
	dieNum=$(( RANDOM % 6 + 1 ))
	echo "Die Number is : $dieNum"
}

checkOption() {
	option=$(( RANDOM%3 ))
        FOR_NO_PLAY=2
        FOR_LADDER=0
        FOR_SNAKE=1
        dieRoll
        case $option in
        $FOR_LADDER)
                currentPosition=$(( $currentPosition + $dieNum))
                ;;

        $FOR_SNAKE)
                currentPosition=$(( $currentPosition - $dieNum ))

                ;;
        $FOR_NO_PLAY)
                currentPosition=$(($currentPosition + 0 ))
                ;;
        esac
        echo "Current Position of Player : $currentPosition"
}


checkOption
