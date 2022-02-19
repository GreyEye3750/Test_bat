#!/bin/bash
str_Y="Y"
str_N="N"
flag_retry=0
while [[ $flag_retry == 0 ]]
do   
    ping.exe google.ru -t > ping.txt & ipconfig.exe > ip.txt
    ./Checking.sh
    ./Output.sh
    rm ping.txt
    rm ip.txt
    rm file.txt
    flag_input=0
    while [[ $flag_input == 0 ]]
    do
        echo ---------------------------------
        echo Restart the program, Y/N?:
        read restart_or_end
        if [[ "${restart_or_end,,}" == "${str_Y,,}" ]]
        then
            flag_retry=0
            flag_input=1
        elif [[ "${restart_or_end,,}" == "${str_N,,}" ]]
        then
            flag_retry=1
            flag_input=1
            echo Exit...
        else
            echo Error! Input Y or N please
            flag_retry=1
            flag_input=0
        fi
    done
done