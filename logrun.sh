#!/bin/bash

#Crontab File to execute "hostlog.sh"
#The script assumes you have a folder ".hostlog" in your home folder & both the files are located in this folder
#For adding in crontab,
#   crontab -e   // for adding entry to crontab
#   Add 
#   */10 * * * * ~/.hostlog/logrun.sh > /dev/null // This will execute the script for every 10 Mts.
#   Save the File, then
#   crontab -l   // List the crontab jobs
#   Wait for 10 Mts, You can see a folder inside ".hostlog" with Current date and a text & jpg file inside the folder.

folder=$(whoami)-$(date +"%d-%m-%Y")

mkdir -p ~/.hostlog/$folder
sh ~/.hostlog/hostlog.sh >> ~/.hostlog/$folder/$(date +%H-%M-%S).txt &

DISPLAY=":0.0" scrot ~/.hostlog/$folder/$(date +%H-%M-%S).jpg &
