@echo off
set /a total=220
set /a finish=1
set /a totalLength=20
set /a finishLength=0
set /a rate=0

setlocal EnableDelayedExpansion
for /l %%i in (0,1,!total!) do (
	set /p="[" <nul
	set /a finish=%%i
	set /a finishLength=!totalLength!*!finish!/!total!
	for /l %%j in (0,1,!totalLength!) do (
		if %%j leq !finishLength! (
			set /p="■" <nul
		) else (
			set /p="▂"<nul
		)
	)
	set /a rate=100*!finish!/!total!
	set /p="] 已完成!rate!%%" <nul
	ping -n 1 127.0.0.1 >nul
)
endlocal
echo,
echo,完成下载
pause
exit

set /p="■■■■■■" 
ping -n 1 127.0.0.1 > nul
set /p="zhu" <nul
set /p="liang" <nul
echo,
pause