@echo off
mode con cols=183 lines=55
pushd ..
set /a app.firstPrint=0
set /a app.size=20
set /a app.lastPrint=0
set /a app.blanklines=13
set /a app.spaceCounts=6
set /a app.addLength=17
set /a app.cur=0
set /a app.typeMode=1
set app.length=
set app.tmp=
set app.arr=
rem 加载图片数据
echo 正在加载图片...
for /f "usebackq tokens=* delims=" %%i in ("a/a20_varcopyEp4-picture.data") do (
	set app.tmp=%%i
	call :setArr
)
set /a app.length=%app.cur%-1
ping 4 192.168.8.1 >nul
setlocal EnableDelayedExpansion
:next
cls
rem 计算
set /a app.lastPrint=%app.firstPrint%+%app.size%
rem 显示
for /l %%i in (1,1,%app.blanklines%) do (
	echo a 
)
if "%app.typeMode%"=="1" (
	type a\a20_varcopyEp4.tmp
	>a\a20_varcopyEp4.tmp echo.
)
for /l %%i in (%app.firstPrint%,1,%app.lastPrint%) do (
	call :print %%i
)

if "%app.firstPrint%"=="0" (
	set /a app.firstPrint=%app.length%
) else (
	set /a app.firstPrint=%app.firstPrint%-1
)
call :sleep
goto :next
endlocal
exit

:setArr
call a/a20_varcopy.bat app.tmp app.arr[%app.cur%]
set /a app.cur=%app.cur%+1
goto :eof

:print
if %1 GTR %app.length% (
	set /a index=%1-%app.length%
) else (
	set /a index=%1
)
if "%app.typeMode%"=="1" (
	>> a\a20_varcopyEp4.tmp echo a !app.arr[%index%].truevalue!
) else (
	echo a !app.arr[%index%].truevalue!
	rem call :printByIndex "%%app.arr[%index%]%%" %index%
)
goto :eof

:printByIndex
echo %~1
goto :eof

:sleep
for /l %%i in (0,1,100) do (
	for /l %%j in (0,1,15) do (
		set b=%%i
	)
)
goto :eof