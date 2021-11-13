#!/bin/bash -x
declare -A dice
one=0
two=0
three=0
four=0
five=0
six=0
counter=0

function getMaxTimeValue(){
min=0
maxIndex=0
for (( i=1; i<7; i++ ))
do
        if [[ $min -lt "${dice[$i]}" ]]
        then
                min="${dice[$i]}"
                maxIndex=$i
        fi
done
        echo $maxIndex
}

function getMinTimeValue(){
max=10
maxIndex=0

for(( i=1; i<7; i++ ))
do
        if [[ $max -gt "${dice[$i]}" ]]
        then
                min="${dice[$i]}"
                maxIndex=$i
        fi
done
echo $maxIndex
}


while [[ $one -lt 10 && $two -lt 10 && $three -lt 10 && $four -lt 10 && $five -lt 10 && $six -lt 10 ]]
do
        counter=$(( $counter+1 ))
        result=$(((( RANDOM%6 )) + 1 ))

        if [ $result -eq 1 ]
        then
            one=$(($one + 1))

        elif [ $result -eq 2 ]
        then
            two=$(($two + 1))

        elif [ $result -eq 3 ]
        then
            three=$(($three + 1))

        elif [ $result -eq 4 ]
        then
            four=$(($four + 1))

        elif [ $result -eq 5 ]
        then
            five=$(($five + 1))

        elif [ $result -eq 6 ]
        then
            six=$(($six + 1))
        fi
done
dice[1]=$one
dice[2]=$two
dice[3]=$three
dice[4]=$four
dice[5]=$five
dice[6]=$six

for i in ${!dice[@]}
do
        echo "$i : ${dice[$i]}"
done

maxValue=$(getMaxTimeValue)
echo "Max time value "${dice[$maxValue]}
minValue=$(getMinTimeValue)
echo "Min time value "${dice[$minValue]}
