#!/bin/bash
nochangeWonCount=0;
changeWonCount=0;

#play this game 10000 times
for (( z = 0; z <= 10000; z++ ))
do
	prize=("goat" "goat" "goat")

	#Randomnly assign the Prize(car) in one of the three variables.
	prizeRandom=$(( $RANDOM % 3 ))
	prize[prizeRandom]="car";

	#Pick a box and swap the choice after host opens one of the boxes showing a goat.
	pickStay=$(( $RANDOM % 3 ));

	for (( j = 0; j <= 2; j++ ))
	do
		#Host now chooses the other box which is a goat
		if [[ $j != $prizeRandom ]]
		then
			if  [[ $j != $pickStay  ]]
			then
			hostPick="$j";
			fi
		fi
	done

	#Now choose the other box
	for (( k = 0; k <= 2; k++ ))
	do
		#Now swap the box...
		if [[ $k != $hostPick  ]]
		then
			if [[ $k != $pickStay ]]
			then			
				pickSwap=$k;
			fi
		fi
	done

	if [[ $prizeRandom = $pickStay ]]
	then
		#echo "You have won the car.";
		nochangeWonCount=$(( $nochangeWonCount + 1 ));
	fi

	if [[ $prizeRandom = $pickSwap ]]
	then
		#echo "You have won the car.";
		changeWonCount=$(( $changeWonCount + 1 ));
	fi
done


echo "*********************************************************************";
echo "Results after playing 10000 times...";
echo " ";
echo "1.total wins while staying with the original choice $nochangeWonCount":
echo " ";
echo "2.total wins while changing the choice $changeWonCount":
echo "*********************************************************************";

