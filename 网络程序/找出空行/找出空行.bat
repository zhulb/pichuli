@echo off
setlocal EnableDelayedExpansion
for /f "delims=" %%i in ('findstr /n "^$" "�ҳ� ����.zlb"') do (set a=%%i&echo,��!a:~0,-1!���ǿ���)
pause
for /f "tokens=1,* delims=:" %%i in ('findstr /n "[.]*" "%~0"') do (echo,%%i ��%%j��)
pause
findstr /n "([.]*)" "%~0"
endlocal

pause>nul