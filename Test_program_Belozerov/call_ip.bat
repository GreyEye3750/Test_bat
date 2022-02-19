@chcp 855 >nul
@echo off

start ipconfig.exe > ip.txt
@chcp 866 >nul
exit