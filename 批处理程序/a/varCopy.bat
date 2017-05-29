@echo off
set b=last
set a=%%i

set c=%%i
call :main %%%%i







pause
exit




:main


echo,%1%b%

for %%i in ("!b!") do (
setlocal EnableDelayedExpansion
echo,%1  ------%a%----!a!
endlocal
)


goto :eof










set num=1

:start

for /f "tokens=*" %%i in (a.txt) do (
	set a=%%i
)
rem set /p a=
set b=a
call :add "%%%b%:"=" "%%"
pause
goto :start

:add


set a=%*
set a=%a:^=^^^^^^^^^^^^^^^^%
set a=%a:&=^^^^^^^^^^^^^^^&%
set a=%a:|=^^^^^^^^^^^^^^^|%
set a=%a:>=^^^^^^^^^^^^^^^>%
set a=%a:<=^^^^^^^^^^^^^^^<%
echo,------------------e-------------------
echo,%a%
set a=%a:~1,-1%

echo,------------------a--------------------
echo,%a%
set a=%a:" "=^^^^^^^"%
set a=%a%
>a_.txt echo,%a%
set /a num=%num%+1
goto :eof








