read -p "Enter number of times to flip a combination:" nFlips

declare -A tripletFrequency
          tripletFrequency[HHH]=0
          tripletFrequency[HHT]=0
          tripletFrequency[HTH]=0
          tripletFrequency[HTT]=0
          tripletFrequency[THH]=0
          tripletFrequency[THT]=0
          tripletFrequency[TTH]=0
          tripletFrequency[TTT]=0

for(( flip = 1; flip <= nFlips; flip++ ))
do
    echo -n "Flip-$flip is "
    (( coin_1 = RANDOM % 2 ))
    (( coin_2 = RANDOM % 2 ))
    (( coin_3 = RANDOM % 2 ))

    case $coin_1$coin_2$coin_3 in 
        000)
            echo "Heads Heads Heads"
            (( tripletFrequency[HHH]++ )) 
            ;;
        001)
            echo "Heads Heads Tails"
            (( tripletFrequency[HHT]++ ))
            ;;
        010)
            echo "Heads Tails Heads"
            (( tripletFrequency[HTH]++ ))
            ;;
        011)
            echo "Heads Tails Tails"
            (( tripletFrequency[HTT]++ ))
            ;;
        100)
            echo "Tails Heads Heads"
            (( tripletFrequency[THH]++ )) 
            ;;
        101)
            echo "Tails Heads Tails"
            (( tripletFrequency[THT]++ ))
            ;;
        110)
            echo "Tails Tails Heads"
            (( tripletFrequency[TTH]++ ))
            ;;
        111)
           echo "Tails Tails Tails"
            (( tripletFrequency[TTT]++ ))
            ;;
    esac
done
for combination in ${!tripletFrequency[@]}
do
    percentage=$(( ${tripletFrequency[$combination]}  * 100 / nFlips ))
    tripletFrequency[$combination]=$percentage
    echo "percentage of $combination is ${tripletFrequency[$combination]}%"   
done
