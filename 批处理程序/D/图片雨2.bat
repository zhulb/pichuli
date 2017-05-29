@echo off
set /a app.firstPrint=0
set /a app.size=10
set /a app.lastPrint=0
set /a app.length=35

:next
cls
set a[0]=                       °★．☆° ．★·°∴°★．°·∴°☆ ·°∴° ☆．．·
set a[1]=                       ☆°★°∴°°∴ ☆°．·★°∴°．
set a[2]=                          ◢◣。       ◢◣。     ☆圣★
set a[3]=                         ◢★◣。     ◢★◣。     ★诞☆
set a[4]=                        ◢■■◣。   ◢■■◣。     ☆节★
set a[5]=                       ◢■■■◣。 ◢■■■◣。      ★快☆
set a[6]=                       ︸︸||︸︸ !!︸︸||︸︸         ☆乐★
set a[7]=                       祝圣诞节快乐 ^_^!!☆°★°∴°°∴ ☆°．·★°∴°．
set a[8]=                       °★．☆° ．★·°∴°★．°·∴°☆ ·°∴° ☆．．·
set a[9]=                       ☆°★°∴°°∴ ☆°．·★°∴°．
set a[10]=                          ◢◣。       ◢◣。     ☆圣★
set a[11]=                         ◢★◣。     ◢★◣。     ★诞☆
set a[12]=                        ◢■■◣。   ◢■■◣。     ☆节★
set a[13]=                       ◢■■■◣。 ◢■■■◣。      ★快☆
set a[14]=                       ︸︸||︸︸ !!︸︸||︸︸         ☆乐★
set a[15]=                       祝圣诞节快乐 ^_^!!☆°★°∴°°∴ ☆°．·★°∴°．·．
set a[16]=                       °★．☆° ．★·°∴°★．°·∴°☆ ·°∴° ☆．．·
set a[17]=                       ☆°★°∴°°∴ ☆°．·★°∴°．
set a[18]=                          ◢◣。       ◢◣。     ☆圣★
set a[19]=                         ◢★◣。     ◢★◣。     ★诞☆
set a[20]=                        ◢■■◣。   ◢■■◣。     ☆节★
set a[21]=                       ◢■■■◣。 ◢■■■◣。      ★快☆
set a[22]=                       ︸︸||︸︸ !!︸︸||︸︸         ☆乐★
set a[23]=                       祝圣诞节快乐 ^_^!!☆°★°∴°°∴ ☆°．·★°∴°．
set a[24]=                       ╭︿︿︿╮ 
set a[25]=                       {/-■■-/}
set a[26]=                        ( (oo) ) 
set a[27]=                         ︶︶︶ 
set a[28]=                       ╭︿︿︿╮
set a[29]=                       {/ X  o ^/} 
set a[30]=                        ( ^(oo^) ) 
set a[31]=                         ︶︶︶ 
set a[32]=                       ╭︿︿︿╮
set a[33]=                       {^/-◎◎-^/}
set a[34]=                        ^( ^(oo^) ^) 
set a[35]=                         ︶︶︶ 

rem 计算
set /a app.lastPrint=%app.firstPrint%+%app.size%
rem 显示
for /l %%i in (1,1,6) do (
	echo *
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
exit


:print
if %1 GTR %app.length% (
	set /a index=%1-%app.length%
) else (
	set /a index=%1
)
call :printByIndex "%%a[%index%]%%" %index%
goto :eof

:printByIndex
echo %~1
goto :eof

:sleep
for /l %%i in (0,1,100) do (
	for /l %%j in (0,1,50) do (
		set b=%%i
	)
)
goto :eof