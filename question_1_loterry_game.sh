#!/bin/bash

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
