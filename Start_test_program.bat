@chcp 855 >nul
@echo off

:start_prog 
set /p start_or_end="Lets start, Y/NO?: "

if /I "%start_or_end%"=="Y" goto start_pr
if /I "%start_or_end%"=="NO" goto end_prog 

echo Error! Input Y or NO please
goto start_prog

:start_pr
setlocal enableextensions
set /p time_count="Input working time, sec: " 

if %time_count% GEQ 5 (
        set /a inner_count=5
) else (
 	set /a inner_count=1
)

if %time_count% LEQ 0 (
 	echo Error! Time has to be greater than 0
 	goto :start_pr)

set /a cicle_count=(%time_count%)/(%inner_count%)

echo. >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
echo. >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
echo --------------------------------- >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt

cd /d "%~dp0" && (
	
	start Call_ip.bat
	start /min Call_ping.bat
	
	(
	for /l %%x in (1 , 1, %cicle_count%) do (
		Timeout %inner_count% /NOBREAK
		call Checkping.bat %~dp0/list-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt  %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt )

	find /I %~dp0/list-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt "ping.exe">nul

	if "%ERRORLEVEL%"=="0" (
	
	taskkill /F /IM "ping.exe">nul
	echo %TIME% ping.exe executed >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	echo %TIME% ping.exe executed 
	)

	echo ----------show ip result--------- >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	for /f "tokens=*" %%i in (ip.txt) do (
	echo %%i>> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	)

	echo -----------ping result----------- >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	for /f "tokens=*" %%i in (list_ping.txt) do (
	echo %%i>> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	)
	)
)
goto end_prog

:end_prog

endlocal

del ip.txt
del list_ping.txt
del "%~dp0/list-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt"
pause
@chcp 866 >nul
exit