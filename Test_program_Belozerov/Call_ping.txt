@chcp 855 >nul
@echo off

start ping.exe google.ru -t > list_ping.txt

@chcp 866 >nul
exit