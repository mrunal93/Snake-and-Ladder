#!/bin/bash

echo "Welcome to Snake and Ladder"

playerPosition=0
currentPosition=$playerPosition

dieRoll() {
	dieNum=$(( RANDOM % 6 + 1 ))
	echo "Die Number is : $dieNum"
}

checkOption() {
	option=$(( RANDOM%3 ))
	forNoPlay=0
	forLadder=1
	forSnake=2
	dieRoll
	if [ $option -eq $forLadder ]
	then
		currentPosition=$(( $currentPosition + $dieNum))

	elif [ $option -eq $forSnake ]
	then
		currentPosition=$(( $currentPosition - $dieNum ))
	elif [ $currentPosition -lt 0 ]
	then
			currentPosition=$playerPosition
	break
	else
		currentPosition=$currentPosition

	fi

	echo "Position of Player : $currentPosition"
}

winningPosition() {
	winPosition=100
	while (( $currentPosition <= $winPosition ))
	do
		checkOption
	done
}

winningPosition
