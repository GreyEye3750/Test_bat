#!/bin/bash
echo Starting...
#./ping1.sh & ./ip1.sh
#---------------
echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
echo ///////////////////////////////// >> $(date +%y-%m-%d)-list.txt
echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
i=0
count_5=5
if test -f Input.txt
then
    while read ii 
    do
        ((i++))
        if [ $i == 2 ]
        then
            time_count=$ii
        fi
    done < Input.txt
else
    touch Input.txt
    echo "Time of working:" >> Input.txt
    echo 10 >> Input.txt
    time_count=10
fi
echo "Operating time is $time_count sec"
if [ "$time_count" -ge '5' ]
then
    inner_count=5
else
 	inner_count=1
fi
let cicle_count=$time_count/$inner_count
#--------------------------------
for ((i=0; i<$cicle_count; i++))
do
{
sleep $inner_count
ps axu > file.txt
if grep -iq 'ping.exe' file.txt; then
    echo ---------------------------------
    echo $(date +%H-%M-%S): ping.exe is running
    echo ---------------------------------
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
    echo $(date +%H-%M-%S): ping.exe is running >> $(date +%y-%m-%d)-list.txt
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
else
    echo ---------------------------------
    echo $(date +%H-%M-%S): ping.exe is not running
    echo ---------------------------------
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
    echo $(date +%H-%M-%S): ping.exe is not running >> $(date +%y-%m-%d)-list.txt
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
fi
if grep -iq 'ipconfig.exe' file.txt; then
    echo ---------------------------------
    echo $(date +%H-%M-%S): ipconfig.exe is running
    echo ---------------------------------
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
    echo $(date +%H-%M-%S): ipconfig.exe is running >> $(date +%y-%m-%d)-list.txt
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
else
    echo ---------------------------------
    echo $(date +%H-%M-%S): ipconfig.exe is not running
    echo ---------------------------------
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
    echo $(date +%H-%M-%S): ipconfig.exe is not running >> $(date +%y-%m-%d)-list.txt
    echo --------------------------------- >> $(date +%y-%m-%d)-list.txt
fi
}
done