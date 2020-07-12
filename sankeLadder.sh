
#!/bin/bash

echo "Welcome to Snake and Ladder"

playerPosition=0
currentPosition=$playerPosition
SECOND_PLAYER=0
currentPlayer2=$SECOND_PLAYER
declare -A rollAndPosition
roll=1

dieRoll() {
	dieNum=$(( RANDOM % 6 + 1 ))
	echo "Die Number: $dieNum"
}
checkOption() {
        option=$(( RANDOM%3 ))
        forNoPlay=0
        forLadder=1
        forSnake=2
        if [ $option -eq $forLadder ]
        then
                dieRoll
                currentPosition=$(( $currentPosition + $dieNum))
                dieRoll
                currentPlayer2=$(($currentPlayer2 + $dieNum))
        elif [ $option -eq $forSnake ]
        then
                dieRoll
                currentPosition=$(( $currentPosition - $dieNum ))
                dieRoll
                currentPlayer2=$(($currentPlayer2 - $dieNum))

        elif [ $currentPosition -lt 0 ]
        then
                        dieRoll
                        currentPosition=$playerPosition
                        dieRoll
                        currentPlayer2=$SECOND_PLAYER
        break
        else
                currentPosition=$currentPosition
                currentPlayer2=$SECOND_PLAYER


        fi
}

checkStatus() {
         if [ $currentPosition -eq $winPosition ]
         then
                echo "Player1 Won"
                break
        elif [ $currentPlayer2 -eq $winPosition ]
         then
                echo "Player2 Won"
                break
         elif [ $currentPosition -gt $winPosition ]
         then
                currentPosition=$(( $currentPosition - $dieNum ))
         else
                checkOption
         fi
	echo -e "Player-1 Game position : $currentPosition \nPlayer-2 Game Position: $currentPlayer2"

}

winningPosition() {
        winPosition=100
        while (( $currentPosition < $winPosition && $currentPlayer2 < $winPosition ))
        do
                player=$((roll++))
                checkStatus
        done
        echo -e "------------------ \n================= \nNumber of time Die Rolls : $player \n========================= \n--------------------------"
}


winningPosition


