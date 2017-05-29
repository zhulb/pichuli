@echo off
set setting=7
set cur=0
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
for /l %%i in (1,1,6) do (
	echo %cur%
)
for /l %%i in (%cur%,1,%setting%) do (
	call :show "%%a[%%i]%%" %%i
)

if "%cur%"=="0"  (
	call :setCur
	call :sleep
	rem echo %cur%
	rem pause
	goto :next
)

for /l %%i in (0,1,%cur%) do (
	call :show "%%a[%%i]%%" %%i
)
call :setCur
call :sleep
rem echo %cur%
rem pause
goto :next
exit

:show
echo %2 %~1
goto :eof
:sleep
for /l %%i in (0,1,100) do (
	for /l %%j in (0,1,50) do (
		set b=%%i
	)
)
goto :eof
:setCur
if "%cur%"=="0" (
	set /a cur=%setting%
) else (
	set /a cur=%cur%-1
)
goto :eof