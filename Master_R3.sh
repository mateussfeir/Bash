echo "Welcome to our program, we are glad to have you here. Could you provide us your name?"

read name
echo "Thank you for providing your name $name."

while true; do

echo "You have 2 options: If you want to continue with the application press (1), otherwise press (2)."

read user_choice


if [ "$user_choice" == 1 ]; then

    echo -e "\nThese are the options that we have:
(1 or A): Triangular numbers.
(2 or B): The numbers that can be written as product of two square even numbers in succession.
(3 or C): Sequences code.
(4 or D): Exit the program.
Choose which of our codes you would like to execute?"

    read user_choice_2

    user_choice_2=$(echo "$user_choice_2" | tr '[:lower:]' '[:upper:]')

    if [[ "$user_choice_2" == 1 || "$user_choice_2" == A ]]; then

# ***********************************  1  *************************************************************

        echo "You have chosen: 1 or A."
        echo "This program identifies triangular numbers in a user-defined range and prints the multiples of 3.
It also tracks and displays the total count of triangular numbers within the range and the quantity divisible by 3."

        echo  -n "Lower Limit: "; read ll
        echo -n "Upper Limit: "; read u

        tcount=0
        m3count=0

        for ((num=ll; num<=ul; num++)); do
            triangular=false
            sum=0
            n=0

            while ((sum < num)); do
                ((n++))
                sum=$((sum + n))

                if ((sum == num)); then
                    triangular=true
                    break
                fi
            done

            if $triangular; then
                ((tcount++))

                if ((num % 3 == 0)); then
                    ((m3count++))
                    echo "$num is a triangular number and a multiple of 3."
                fi
            fi
        done

        echo "Total triangular numbers found: $tcount."
        echo "Total multiples of 3 among triangular numbers: $m3count."

        elif [[ "$user_choice_2" == 2 || "$user_choice_2" == B ]]; then

# ***********************************  2  *************************************************************        

        echo "You have chosen 2 or B."
        echo "This task finds the numbers that can be written as the product of two even square 
numbers in succession and prints them in increasing order"

#TASK2:Product of two even square numbers in succession.
        echo
        echo -e "Task 2: \nFind all the numbers that can be written as the product of two even square numbers."
        echo "(For example, 4x16=64, where 4 and 16 are two even square numbers in succession.)"


#Asking user for the number of such numbers to print.
        read -p "Enter the number of such numbers you want to print: " num_to_print
        echo
        num=2


        #Iterating and printing the numbers  until it reaches the user specified limit.
        for ((count = 1; count <= num_to_print; count++))
        do
            next_num=$((num + 2))
            product=$((num**2 * next_num**2))

        #Checking if the product is even and displays the result.
            if [ $((product % 2)) -eq 0 ];
                then
                    echo "$((num**2))x$((next_num**2)) = $product [Even]."
                else
                    echo "$((num**2))x$((next_num**2)) = $product [Odd]."
            fi

            num=$next_num
        done


        elif [[ "$user_choice_2" == 3 || "$user_choice_2" == C ]]; then

# ***********************************  3  *************************************************************         

            echo "You have chosen 3 or C."
            echo "We have 2 options here:
(1): Limited number of terms of the sequence and print them in order up to a maximum chosen by the user.
(2): In a position chosen by the user and determine whether this term is a factor of another number chosen also by the user"
read user_choice_2_sub

if [[ $user_choice_2_sub == 1 ]]; then

    # ***********************************  3.1  *************************************************************   

    echo "You have chosen 1."
    echo "This script calculates a series of terms based on the input values 'a' and 'b' and the maximum number of times
the formula should be performed. It then prints the individual terms and calculates the sum of all the printed elements."

    # Find the terms of a sequence given by the rule Term = a*n^3 + b*n (a, b and n are positives integers).
    # Give to options to the user:
    # 1) Find a limited number of terms of the sequence and print them in order up to a maximum chosen by the user, after that print the sum of all of them.

    # Pseudocode: 
    # 1) Get 2 input from the user: a, b and max.
    # 2) Set n=1, create a variable to store the values and keeping summing.
    # 3) Create a loop (stop the loop when n <= max) to perform the formula, print the result, save the result in a list and add +1 to n.
    # 4) Sum all of the numbers inside the list and print it.

    # Solution part 1:

    echo "Enter the values for 'a' and 'b,' and specify the maximum number of iterations for the formula."
    # Validate 'a'
    echo -n "a: "; read a
    # Validate 'a'
    while true; do
        echo -n "a: "; read a
        if [[ "$a" =~ ^[1-9][0-9]*$ ]]; then
            break
        else
            echo "Please enter a positive integer for 'a'."
        fi
    done

    # Validate 'b'
    while true; do
        echo -n "b: "; read b
        if [[ "$b" =~ ^[1-9][0-9]*$ ]]; then
            break
        else
            echo "Please enter a positive integer for 'b'."
        fi
    done
    echo -n "maximum: "; read maximum
    n=1
    sum=0

    echo "The following are your results: "

    while [ "$n" -le "$maximum" ]; do
        term=$(( a * n * n * n + b * n ))
        echo "$n: $term."
        n=$(( n + 1 ))
        sum=$(( sum + term ))
    done
    echo "The sum of all the printed elements is $sum."

elif [[ $user_choice_2_sub == 2 ]]; then

    # ***********************************  3.2  *************************************************************   

    echo "You have chosen 2."

    # Part 3, second challenge
    # Find a term in a position chosen by the user and determine whether this term is a factor of another number chosen also by the user.
    # Then print for example: "The 3rd term is xx and its (not) factor of y".

    echo "Input 2 numbers (a and b) and the max (to select the position of the chosen number), so the program will create an array following this equation: a*n^3 + b*n,
and then you need to input another number, so the program will check if the number of the selected position in the array generated is factorable by the chosen number."
   # Validate 'a'
    while true; do
        echo -n "a: "; read a
        if [[ "$a" =~ ^[1-9][0-9]*$ ]]; then
            break
        else
            echo "Please enter a positive integer for 'a'."
        fi
    done

    # Validate 'b'
    while true; do
        echo -n "b: "; read b
        if [[ "$b" =~ ^[1-9][0-9]*$ ]]; then
            break
        else
            echo "Please enter a positive integer for 'b'."
        fi
    done
    echo -n "Position: "; read position
    echo -n "factor: "; read factor 
    n=1  

    while [ "$n" -le "$position" ]; do
        term=$(( a * n * n * n + b * n ))
        n=$(( n + 1 ))
    done

    if [ $((term % factor)) -eq 0 ]; then
        echo "The number of position $position in the array is $term. This term is factorable by $factor."
    else
        echo "The number of position $position in the array is $term. This term is not factorable by $factor."
    fi

        else
        echo "Invalid choice, you should have chosen 1 or 2."
        fi

# ***********************************  4 - EXIT  *************************************************************   

                elif [[ "$user_choice_2" == 4 || "$user_choice_2" == "D" ]]; then
                echo "You have chosen 4, exiting the program."
                break

               
    else
    echo "Invalid choice, you should have chosen a number in between the range [1,4] or a letter between the range [A,D]."
    fi
elif [ "$user_choice" == 2 ]; then
    echo "Ok, exiting the program."
    break
else    
    echo "Invalid input."
fi
echo "Thank you for using our program."
done