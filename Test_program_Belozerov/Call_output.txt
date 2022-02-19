@chcp 855 >nul
@echo off	



	find /I %~dp0/list-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt "ping.exe">nul
	if "%ERRORLEVEL%"=="0" (	
	taskkill /F /IM "ping.exe">nul
	echo %TIME% ping.exe executed >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	echo %TIME% ping.exe executed 
	)

	find /I %~dp0/list-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt "ipconfig.exe">nul
	if "%ERRORLEVEL%"=="0" (	
	taskkill /F /IM "ipconfig.exe">nul
	echo %TIME% ipconfig.exe executed >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	echo %TIME% ipconfig.exe executed 
	)

	echo ----------show ip result--------- >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	for /f "tokens=*" %%i in (ip.txt) do (
	echo %%i>> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	)

	echo -----------ping result----------- >> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	for /f "tokens=*" %%i in (list_ping.txt) do (
	echo %%i>> %~dp0/log-%date:~6,4%-%date:~3,2%-%date:~0,2%.txt
	)
@chcp 866 >nul