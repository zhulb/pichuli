@echo off
pushd ..
:start
set tmp=
set arr=
set cur=0
set length=
rem 注意，读取忽略了空行
for /f "usebackq tokens=* delims=" %%i in ("a/a20_varcopyEp3.data") do (
	set tmp=%%i
	call :setArr
)
set /a length=%cur%-1

setlocal EnableDelayedExpansion
for /l %%i in (1,1,%length%) do (
	echo !arr[%%i].showvalue!
)
endlocal
pause
exit

:setArr
call a/a20_varcopy.bat tmp arr[%cur%]
set /a cur=%cur%+1
goto :eof