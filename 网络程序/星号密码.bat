@echo off
set /p=ÇëÊäÈëÃÜÂë,ÒÔa½áÊø:<nul
:loop
choice /C abcdefghijklmnopqrstuvwxyz /N >nul
if %ERRORLEVEL% equ 1 goto :out
set /p=*<nul
goto :loop


:out
echo ok!
pause>nul