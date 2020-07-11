#!/bin/bash

echo "Welcome to Snake and Ladder"

playerPosition=0

dieRoll() {
	dieNum=$(( RANDOM % 6 + 1 ))
	echo "Die Number is : $dieNum"
}

dieRoll
