@echo off
goto start
::help
taskkill
tasklist
::help end
:start
if not exist ©����CMDHelp md ©����CMDHelp
set "act="
for /f "usebackq tokens=* delims=;" %%i in ("%~snx0") do (
if "%%i"=="::help end" goto exit
if defined act "%%i"/?>©����CMDHelp\"%%i".txt
if "%%i"=="::help" set "act=act"
)
:exit
echo,----------�Ѿ����
pause>nul
exit
