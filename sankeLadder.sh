#!/bin/bash 

echo "Welcome to Snake and Ladder"

PLAYER_POSITION=0
currentPosition=$PLAYER_POSITION
roll=0
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
                if [ $currentPosition -gt $WIN_POSITION ]
                then
                        currentPosition=$(( $currentPosition - $dieNum ))
                fi
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
	while (( $currentPosition < $WIN_POSITION ))
	do
		checkStatus
	done

}

winningPosition
