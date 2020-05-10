@echo off
setlocal EnableDelayedExpansion
for /f "delims=" %%i in ('findstr /n "^$" "找出 空行.zlb"') do (set a=%%i&echo,第!a:~0,-1!行是空行)
pause
for /f "tokens=1,* delims=:" %%i in ('findstr /n "[.]*" "%~0"') do (echo,%%i 【%%j】)
pause
findstr /n "([.]*)" "%~0"
endlocal

pause>nul