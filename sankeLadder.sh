#!/bin/bash

echo "Welcome to Snake and Ladder"

PLAYER_POSITION=0
currentPosition=$PLAYER_POSITION
PLAYER=2
roll=1
WIN_POSITION=100

dieRoll() {
        dieNum=$(( RANDOM % 6 + 1 ))
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
                if [ $currentPosition -gt $WIN_POSITION ]
                then
                        currentPosition=$(( $currentPosition - $dieNum ))
                fi
		checkOption
                ;;

        $FOR_SNAKE)
                currentPosition=$(( $currentPosition - $dieNum ))
                if [ $currentPosition -lt $PLAYER_POSITION  ]
                then
                        currentPosition=$(( $currentPosition + $dieNum ))
                fi

                ;;
        $FOR_NO_PLAY)
                        currentPosition=$(($currentPosition + 0 ))
                ;;
        esac
        echo "Current Position of Player $playerNo : $currentPosition"
}

checkStatus() {
        checkOption
        ((roll++))
	 if [ $currentPosition -eq $WIN_POSITION ]
         then
                echo "Reached $currentPosition"
        elif [ $currentPosition -eq $PLAYER_POSITION ]
        then
                currentPosition=$PLAYER_POSITION
        fi
        echo -e "------------------ \nNumber of time Die Rolls : $roll \n--------------------------"

}

winningPosition() {
        cheaking=1
         while [ $cheaking -eq 1 ]
        do
                for (( playerNo=1; playerNo<=$PLAYER; playerNo++ ))
                do
                        multiPlayer[$playerNo]=$PLAYER_POSITION
                        echo " playing $playerNo"
                        checkStatus ${multiPlayer[$playerNo]}
                        multiPlayer[$playerNo]=$currentPosition
                                if [ ${multiPlayer[$playerNo]} -eq $WIN_POSITION ]
                                then
                                        echo -e "------------------------ \n======================== \nPlayer no.$playerNo has won the game Won \n----------------------- \n===================>"
                                        cheaking=0
                                        break
                                fi
                done
        done
}
checkStatus
winningPosition

