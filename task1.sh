#!/bin/bash
# script task1
clear
echo "Task1 Script"

# Am I root?
if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi
# I show that i can write if-fi combinatioan as you see
# but in this script i wish use standart console answers
echo user $1
echo dir $2
sudo chown -R $1 $2 
