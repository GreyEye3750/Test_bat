@chcp 855 >nul
@echo off

tasklist  > %1


find /I %1 "ping.exe">nul
if "%ERRORLEVEL%"=="0" (
   echo %TIME% ping.exe is running  >> %2
   echo %TIME% ping.exe is running 
) else (
   echo %TIME% ping.exe is ended  >> %2 
   echo %TIME% ping.exe is ended 
)
@chcp 866 >nul