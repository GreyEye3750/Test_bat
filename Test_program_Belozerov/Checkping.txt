@chcp 855 >nul
@echo off

tasklist  > %1


find /I %1 "ping.exe">nul
if "%ERRORLEVEL%"=="0" (
   echo %TIME% ping.exe is running  >> %2
   echo %TIME% ping.exe is running 
) else (
   echo %TIME% ping.exe is not running  >> %2 
   echo %TIME% ping.exe is not running  
)

find /I %1 "ipconfig.exe">nul
if "%ERRORLEVEL%"=="0" (
   echo %TIME% ipconfig.exe is running  >> %2
   echo %TIME% ipconfig.exe is running 
) else (
   echo %TIME% ipconfig.exe is not running  >> %2 
   echo %TIME% ipconfig.exe is not running  
)
@chcp 866 >nul