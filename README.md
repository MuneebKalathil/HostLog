```
################################################
#                                              #
#                                              #
#              HostLog v0.5 Beta               #
#  Script by : Muneeb K / Network Engineer     #
#      Open Source /  Free to Modify           #
#                                              #
################################################
```


# HostLog v0.5 Beta

Hostlog is used to find some important info about a system. <br>
The script assumes you have a folder ".hostlog" in your home folder & both the files are located in this folder. <br>
For running this script, does not need any root privileges. <br>
Automatically Generate logs (Add to crontab). <br>
HostLog contain 2 files. ```hostlog.sh``` & ```logrun.sh```. ```logrun.sh``` can be added to crontab for executing ```hostlog.sh```.<br>

It is a simple script written in shell script and anyone can modify according to their need. <br>

# Requirements
Linux OS &```scrot```<br>
<b>For insallation</b><br>
Ubuntu<br>
```sudo apt-get install scrot```<br>
Opensuse<br>
```sudo zypper in scrot```<br>
Fedora <br>
```sudo yum install scrot```<br>

# Crontab
To run the script for every five minute, add an entry in crontab ```crontab -e```<br>
``` */5 * * * * DISPLAY=:0 && ~/.hostlog/.logrun.sh > /dev/null```<br>
```DISPLAY=:0``` is the display value. 0 is the default. <br>
To find your display value, run
```echo $DISPLAY``` on your terminal <br>

# Troubleshooting

Sometimes, there are hugh chances in getting error in screenshots.<br>
To solve this,<br>
<b>Debian based</b> <br>
Add<br>
``` export XAUTHORITY=~/.Xauthority ``` to ```~/.bashrc``` <br>
Then run<br>
```$ source ~/.bashrc```<br>
<b> OpenSuse </b> <br>
Edit the file <br>
```sudo nano /etc/gdm/Init/Default```<br>
Add <br>
```/usr/bin/xhost +local:``` at top, just above <br>
```shell 
if test -x /etc/X11/xdm/Xsetup; then
        exec /etc/X11/xdm/Xsetup
fi
```



