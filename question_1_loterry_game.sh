#!/bin/bash
# Write a bash script that simulates a lottery game by choosing a random number between 1 and
# 7. The script should prompt the user to guess the number, providing up to two attempts. After
# the first guess, if the guess is incorrect, the script should indicate whether the winning number
# is higher or lower than the user's guess. If the user guesses correctly within these two attempts,
# display "You are a winner!". If the user fails to guess the number correctly after two attempts,
# display "Try again.".
while true; do
    attempts=0
    echo "Enter 1 to start or 2 to exit"
    read option
    
    if [ "$option" = 1 ]; then
        while true; do
            echo "Pick a number between 1 to 7"
            read number
            win=$((($RANDOM % 7) + 1))
            attempts=$((attempts+1))
            
            if [ $win -eq $number ]; then
                echo "You are a winner!"
                break
            else
                if [ $attempts -lt 2 ]; then
                    if [ $win -gt $number ]; then
                        echo "Try a higher number."
                    else
                        echo "Try a lower number."
                    fi
                else
                    echo "You've run out of attempts. The correct number was $win."
                    break
                fi
            fi
        done
    elif [ $option = 2 ]; then
        echo "Exiting"
        break
    else
        echo "Invalid option. Please enter 1 to start or 2 to exit."
    fi
done
