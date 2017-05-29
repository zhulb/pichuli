@echo off
:start
pause
set /p b=
cls
call a20_varcopy b user
echo,------------------a--------------------
echo,%user.showvalue%
echo,------------------b--------------------

goto :start
exit
echo,
echo,½øÈëqq...

setlocal enabledelayedexpansion
echo,!%1!
endlocal
goto :eof