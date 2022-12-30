read -p "Enter number of times to flip a combination:" nFlips

declare -A singletFrequency

singletFrequency[H]=0
singletFrequency[T]=0

echo "Singlet Combination"
for(( flip = 1; flip <= nFlips; flip++ ))
do
    echo -n "Flip-$flip is "
    (( toss = RANDOM % 2 ))
    case $toss in
        0)
            echo "Heads"
            (( singletFrequency[H]++ ))
            ;;
        1)
            echo "Tails"
            (( singletFrequency[T]++ ))
    esac
done

for combination in ${!singletFrequency[@]}
do
    percentage=$(( ${singletFrequency[$combination]}  * 100 / nFlips ))
    singletFrequency[$combination]=$percentage
    echo "percentage of $combination is ${singletFrequency[$combination]}%"
done
