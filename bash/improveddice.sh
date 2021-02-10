#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."
# roll the dice and save the results
die1=$(( RANDOM % 6 + 1))
die2=$(( RANDOM % 6 + 1 ))
# display the results
echo "Rolled $die1, $die2"

#Task 1:
range=10 #Store the range number
bnumber=1 #In our program bias is 1 so 1 number store in bnumber variable
echo "Rolling the dice which all the data stores in the variables:"
echo "Rolling...
$((RANDOM % range + bnumber))
Rolled."
echo ""

#Task 2:
range=10
bnumber=1
echo "The program will display sum of and the avrage of the generated number"
dies1=$((RANDOM % range + bnumber))
dies2=$((RANDOM % range + bnumber))

echo "Rolled dies summary is:"
echo "Die Number 1 : $dies1"
echo "Die Number 2 : $dies2"
echo ""
echo "The SUM of $dies1 and $dies2 is : $(($dies1 + $dies2))"
echo ""
echo "The Average of $dies1 and $dies2 is : $((($dies1 + $dies2) / 2 ))"
