read -p "Enter number of times to flip a combination:" nFlips

declare -A doubletFrequency

                   doubletFrequency[HH]=0
                   doubletFrequency[HT]=0
                   doubletFrequency[TH]=0
                   doubletFrequency[TT]=0

for(( flip = 1; flip <= nFlips; flip++ ))
do
    echo -n "Flip-$flip is "
    (( coin_1 = RANDOM % 2 ))
    (( coin_2 = RANDOM % 2 ))
        case $coin_1$coin_2 in
        00)
            echo "Heads Heads"
            (( doubletFrequency[HH]++ ))
            ;;
        01)
            echo "Heads Tails"
            (( doubletFrequency[HT]++ ))
            ;;
        10)
            echo "Tails Heads"
            (( doubletFrequency[TH]++ ))
            ;;
        11)
            echo "Tails Tails"
            (( doubletFrequency[TT]++ ))
            ;;
    esac
done

for combination in ${!doubletFrequency[@]}
do
    percentage=$(( ${doubletFrequency[$combination]}  * 100 / nFlips ))
    doubletFrequency[$combination]=$percentage
    echo "percentage of $combination is ${doubletFrequency[$combination]}%"   
done
