print_winner ()
{
    #Inside the function, using local -n ref=$1 to declare a nameref to the variable named by $1, meaning it's not a reference to $1 itself, but rather to a variable whose name $1 holds
    local -n keys=$1
    local -n values=$2

    max_value=0
    max_value_index=0
    for(( i = 0; i < ${#values[@]}; i++ ))
    do
        if(( values[i] >= max_value ))
        then
                max_value=${values[i]}
                max_value_index=$i
        fi
    done
    echo "The winning combination is ${keys[$max_value_index]} with ${max_value}%" 
}


read -p "Enter number of times to flip a combination:" nFlips

# Code For Singlet Combination
echo "Singlet Combination"
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

#Code For Doublet Combination
echo "Doublet Combination"
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

# Code For triplet Combination
echo "Triplet Combination"
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

singlet_combinations=( ${!singletFrequency[@]} )
singlet_combination_percentages=( ${singletFrequency[@]} )

doublet_combinations=( ${!doubletFrequency[@]} )
doublet_combination_percentages=( ${doubletFrequency[@]} )

triplet_combinations=( ${!tripletFrequency[@]} )
triplet_combination_percentages=( ${tripletFrequency[@]} )

total_combinations+=( ${singlet_combinations[@]} ${doublet_combinations[@]} ${triplet_combinations[@]} )
total_combination_percentages+=( ${singlet_combination_percentages[@]} ${doublet_combination_percentages[@]} ${triplet_combination_percentages[@]} )

echo  "sorted singlet percentages:"
echo "$( printf "%s\n" "${singlet_combination_percentages[@]}" | sort -n ) "

echo  "sorted doublet percentages:"
echo "$( printf "%s\n" "${doublet_combination_percentages[@]}" | sort -n ) "

echo  "sorted triplet percentages:"
echo "$( printf "%s\n" "${triplet_combination_percentages[@]}" | sort -n ) "
echo ""

echo "Winner For Singlet Combination"
print_winner singlet_combinations singlet_combination_percentages
echo ""

echo "Winner For Doublet Combination"
print_winner doublet_combinations doublet_combination_percentages
echo ""

echo "Winner For Triplet Combination"
print_winner triplet_combinations triplet_combination_percentages
echo ""

echo "Winner For All Combinations"
print_winner total_combinations total_combination_percentages
