#!/bin/bash

echo "Welcome to Snake and Ladder"

PLAYER_POSITION=0
currentPosition=$PLAYER_POSITION
WIN_POSITION=100
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
                        currentPosition=$(( $currentPosition + 0 ))
                ;;
        esac
        echo "Current Position of Player : $currentPosition"
}


#	while (( true ))
#	do
#		checkOption
#		if [ $currentPosition -eq $WIN_POSITION ]
#		then
#			winPosition=$currentPosition
#			break
#		elif [ $currentPosition -lt $PLAYER_POSITION ]
#		then
#			echo
#		fi
#	done
#	echo "Current Position= $currentPosition"

winningPosition() {
	while(( $currentPosition <= $WIN_POSITION ))
	do
		checkOption
	done
}

winningPosition
