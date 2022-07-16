#!/bin/env bash

rechecking_prompt(){
    [ $(echo -e "No\nYes" | dmenu -i -b -p "$1") == "Yes" ] && $2
}
option=$(echo -e "Shutdown\nRestart\nLock\nSuspend\nLog out"|dmenu -i -p "What you want to do?" -b)

case $option in
"Shutdown")
    rechecking_prompt "Are you sure you want to Shutdown?" "shutdown -P now"
;;

"Restart")
    rechecking_prompt "Are you sure you want to Restart?" "shutdown -r now"
;;

"Lock")
   i3lock -c "#454545"
;;

"Suspend")
    rechecking_prompt "Are you sure you want to Suspend?" "systemctl -i suspend"
;;

"Log out")
    rechecking_prompt "Are you sure you want to Log out?" "i3-msg exit"
;;

esac
