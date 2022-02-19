#!/bin/bash
if grep -iq 'ping' file.txt; then
    echo ---------------------------------
    echo $(date +%H-%M-%S): ping executed
    echo ---------------------------------
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
    echo $(date +%H-%M-%S): ping executed >> $(date +%y-%m-%d)-list.txt
    killall -s 2 ping
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
fi
if grep -iq 'ipconfig.exe' file.txt; then
    echo ---------------------------------
    echo $(date +%H-%M-%S): ipconfig.exe executed
    echo ---------------------------------
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
    echo $(date +%H-%M-%S): ipconfig.exe executed >> $(date +%y-%m-%d)-list.txt
    killall -q ipconfig.exe
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
echo ----------show ip result---------
while read ii
do
    echo $ii
done < ip.txt
echo -----------ping result-----------
while read jj
do
    echo $jj
done < ping.txt