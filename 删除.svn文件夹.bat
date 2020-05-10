@echo off
for /f "tokens=*" %%i in ('dir /b/s/ad "lingyong"') do (
	call :main "%%~i"
)
for /f "tokens=*" %%i in ('dir /b/s/ad "zhizhishenqing"') do (
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