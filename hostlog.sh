#!/bin/bash
printf "################################################\n"
printf "#                                              #\n"
printf "#                                              #\n"
printf "#              HostLog v0.5 Beta              #\n"
printf "#  Script by : Muneeb K / Network Engineer     # \n"
printf "#      Open Source /  Free to Modify           #\n"
printf "#                                              #\n"
printf "################################################\n"

#######
#
#This Script is used to find some important info about a system. 
#For running this script does not need any root privileges. 
#Automatically Generate logs (Add to crontab).
#Need "Scrot" to take screenshots. sudo apt-get install scrot, for installing.
#HostLog contain 2 files. "hostlog.sh" & "logrun.sh". "logrun.sh" can be added to crontab for executing hostlog.sh.
#
######

printf "\nThis Script is executed by :"
printf "\n###############################################\n"
printf "Username : $(whoami)\n"
printf "Hostname : $(hostname) \n"
printf "Date : $( date "+%Y-%m-%d") \n"
printf "Time : $(date +"%r") \n"
printf "\nOS Details  \n$(lsb_release -d -r -c) \n"
printf "Kernel:         $(uname -s -r) \n"

printf "\nSystem Details\n"
printf "CPU $(cat /proc/cpuinfo | grep "model name" | head -1)\n" 
printf "\nMemory Info\n"
printf "Total Memory : $(free -h | awk '/^Mem/{print $2}')"
printf "\nUsed Memory : $(free -h | awk '/^Mem/{print $3}')"
printf "\nFree Memory : $(free -h | awk '/^Mem/{print $4}'\n)"


printf "\n\nDisk Info\n"
df -h

printf "###############################################\n"


printf "\n\n\n######################################################################################################"
printf "\n***** Users Online *****\n\n"
printf "$(w -i)\n"
printf "######################################################################################################\n"

printf "\n\n\n######################################################################################################\n"
printf "**** IMPORTANT ****\nLast logins of user : \"root\" \n\n"
echo $(last | grep "root")
printf "######################################################################################################\n"

printf "\n\n\n######################################################################################################\n"
printf "***** Last logins of user : \"$(whoami)\" ***** \n\n"
#login =$(whoami)
#printf "$(last | grep $login)"
#echo $(last | grep "$(login)")
last | grep "$whoami" | head -20  
printf "######################################################################################################\n"


printf "\n\n\n######################################################################################################"
printf "\n***** Recent Boots/Reboots ***** \n"
last | grep "reboot"
printf "######################################################################################################\n"


printf "\n\n\n######################################################################################################\n"
printf "***** Recent Shutdowns/Change in Runlevels *****\n\n"
last -x shutdown
printf "######################################################################################################"



printf "\n\n\n######################################################################################################"
printf "\n***** Current Internet Connections ***** \n\n"
lsof -i
printf "######################################################################################################"



printf "\n\n\n######################################################################################################"
printf "\n***** Current Running Processes (Last 30) ***** \n\n"
ps -A | tail -30
printf "######################################################################################################\n\n"

#folder=$(date +"%d-%m-%Y")
#mkdir -p ~/.hostlog/$folder
#scrot ~/.hostlog/$folder/$(date +%H-%M-%S).jpg &



