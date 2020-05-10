@echo off
for /f "tokens=*" %%i in ('dir /b/s/ad "WebRoot"') do (
	call :main "%%~i"
)

pause
exit
:main
set dir=%1
if "%dir:~-5,-1%"==".svn" (
	echo,%dir%
	rd /q/s %dir%
)
goto :eof