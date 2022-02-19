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
	
	start /min Call_ping.bat
	start /min Call_ip.bat
	
	
	(
	for /l %%x in (1 , 1, %cicle_count%) do (
		Timeout %inner_count% /NOBREAK
		call Checkping.bat %~dp0/list-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt  %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt )
	echo.
	call Call_output.bat
	goto retry

	)
)
:retry
set /p retry_or_end="Restart the program, Y/NO?: "

if /I "%retry_or_end%"=="Y" goto start_pr
if /I "%retry_or_end%"=="NO" goto end_prog 

echo Error! Input Y or NO please
goto retry

goto end_prog

:end_prog

endlocal

del ip.txt
del list_ping.txt
del "%~dp0/list-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt"
@chcp 866 >nul
exit