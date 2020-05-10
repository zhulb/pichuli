@echo off
goto start
::help
taskkill
tasklist
::help end
:start
if not exist 漏掉的CMDHelp md 漏掉的CMDHelp
set "act="
for /f "usebackq tokens=* delims=;" %%i in ("%~snx0") do (
if "%%i"=="::help end" goto exit
if defined act "%%i"/?>漏掉的CMDHelp\"%%i".txt
if "%%i"=="::help" set "act=act"
)
:exit
echo,----------已经完成
pause>nul
exit
