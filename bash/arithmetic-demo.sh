#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

firstnum=5
secondnum=2
sum=$((firstnum + secondnum))
dividend=$((firstnum / secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

cat <<EOF
$firstnum plus $secondnum is $sum
$firstnum divided by $secondnum is $dividend
  - More precisely, it is $fpdividend
EOF

#Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user
echo ""
Prompt="Please Enter Three Numbers: "
read -p "$Prompt" one
read -p "$Prompt" two
read -p "$Prompt" three
echo "You entered $one, $two, $three"

# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

sum=$(($one + $two + $three))
product=$(($one * $two * $three))
echo ""
echo "Sum of $one, $two, $three is : $sum"
echo "Product of $one, $two, $three is : $product"
echo ""
