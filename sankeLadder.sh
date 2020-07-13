#!/bin/bash

echo "Welcome to Snake and Ladder"

PLAYER_POSITION=0
currentPosition=$PLAYER_POSITION

dieRoll() {
	dieNum=$(( RANDOM % 6 + 1 ))
	echo "Die Number is : $dieNum"
}

dieRoll
