#!/bin/bash

# Infinite loop
while true; do
    echo "Welcome to the file desktop manager."
    echo ""
    echo "Choose one of the options:"
    echo "1) View desktop files"
    echo "2) Copy file"
    echo "3) Remove a file"
    echo "4) Move file"
    echo "5) zip file"
    echo "6) unzip file"
    echo "7) Exit"

    read -p "Enter you choice: " choice;
        case $choice in
            1) 
                echo "Files in your desktop:"
                ls ~/Desktop
                ;;

            2)
                read -p "Which file do you want to copy? " filename
                cp ~/Desktop/"$filename" ~/Desktop/copied_"$filename" 
                ;;

            3) 
                read -p "Which file do you wanto to remove?" filename
                rm ~/Desktop/"$filename"
                ;;
            
            4) 
                read -p "Which file to you want to move?" filename
                read -p "What is the new destination?" destination
                mv ~/Desktop/"$filename" ~/Desktop/"$destination"/
                echo "File moved successfully."
                ;;

            5)
                read -p "Which file do you want to zip?" filename
                zip ~/Desktop/"$filename.zip" ~/Desktop/"$filename"
                echo "Zipped successfully."
                ;;
            6)
                read -p "Which file do you want to unzip?" filename
                unzip ~/Desktop/"$filename.zip" -d ~/Desktop/
                echo "Unzipped successfully."
                ;;
            7)
                echo "Exiting..."
                exit 0
                ;;
        esac
done