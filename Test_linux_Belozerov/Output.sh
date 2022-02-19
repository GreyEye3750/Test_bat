#!/bin/bash
ps axu > file.txt
flag_kill_ping=0
flag_kill_ip=0
if grep -iq 'ping.exe' file.txt; then
    echo ---------------------------------
    echo $(date +%H-%M-%S): ping.exe executed
    echo ---------------------------------
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
    echo $(date +%H-%M-%S): ping.exe executed >> $(date +%y-%m-%d)-list.txt
    killall -q ping.exe
    flag_kill_ping=1
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
fi
if grep -iq 'ipconfig.exe' file.txt; then
    echo ---------------------------------
    echo $(date +%H-%M-%S): ipconfig.exe executed
    echo ---------------------------------
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
    echo $(date +%H-%M-%S): ipconfig.exe executed >> $(date +%y-%m-%d)-list.txt
    killall -q ipconfig.exe
    flag_kill_ip=1
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
fi
echo ----------show ip result--------- >> $(date +%y-%m-%d)-list.txt
while read ii
do
    echo $ii >> $(date +%y-%m-%d)-list.txt
done < ip.txt
echo -----------ping result----------- >> $(date +%y-%m-%d)-list.txt
while read jj
do
    echo $jj >> $(date +%y-%m-%d)-list.txt
done < ping.txt
#-------------------------------------------------------------------
if [[ "$flag_kill_ip" -eq '0' ]]
then
    echo ----------show ip result---------
    while read ii
    do
        echo $ii
    done < ip.txt
fi
if [[ "$flag_kill_ping" -eq '0' ]]
then
    echo -----------ping result-----------
    while read jj
    do
        echo $jj
    done < ping.txt
fi