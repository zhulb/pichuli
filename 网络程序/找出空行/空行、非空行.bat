@echo off
setlocal EnableDelayedExpansion
set numk=1
for /f "delims=" %%i in ('findstr /n "^$" "�ҳ� ����.zlb"') do (set a[!numk!]=%%i&set /a numk=!numk!+1)
set /a numk=!numk!-1
set numfk=1
rem -------------------------------------------------
for /f "usebackq tokens=* delims=" %%i in ("�ҳ� ����.zlb") do (
set id=!numfk!
for /l %%i in (1,1,!numk!) do (
set /a a=!a[%%i]:~0,-1!
if !id! geq !a! set /a id=!id!+1
)
set b[!numfk!]=!id!
set /a numfk=!numfk!+1
)
rem -------------------------------------------------
set /a numfk=!numfk!-1
echo,
for /l %%i in (1,1,!numk!) do (
echo,���������� !a[%%i]:~0,-1!
)
echo,
for /l %%i in (1,1,!numfk!) do (
echo,�ǿ��������� !b[%%i]!
)
endlocal
pause>nul
exit
