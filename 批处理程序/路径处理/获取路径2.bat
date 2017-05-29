@echo off
cls
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
if "%2"=="1" (
if defined message (
echo,%message%
)
)
echo,
echo,-----------------退出:输入exit(默认)
echo,
set pathly=exit
set /p pathly=路径: 
set pathly="%pathly:"=%"
if %pathly%=="exit" goto exit
for /f "tokens=*" %%i in (%pathly%) do (
set pathly="%%~i"
call :pathly
set pathmb="%%~dpi"
call :pathmb
set name="%%~ni"
call :name
set type="%%~xi"
call :type
)
popd
goto :eof
exit
rem ----------------------------------------------------------call1
:pathly
set pathly=%pathly:^=^^%
set pathly=%pathly:&=^&%
set pathly=%pathly:|=^|%
set pathly=%pathly:"=%
goto :eof
:pathmb
set pathmb=%pathmb:^=^^%
set pathmb=%pathmb:&=^&%
set pathmb=%pathmb:|=^|%
set pathmb=%pathmb:"=%
goto :eof
:name
set name=%name:^=^^%
set name=%name:&=^&%
set name=%name:|=^|%
set name=%name:"=%
goto :eof
:type
set type=%type:^=^^%
set type=%type:&=^&%
set type=%type:|=^|%
set type=%type:"=%
goto :eof
rem ----------------------------------------------------------call1 end
rem ----------------------------------------------------------goto1
:exit
if exist pathly.zlb del /q /s pathly.zlb
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto1 end
rem ----------------------------------------------------------脚本说明
输出变量%pathly%、%pathmb%、%name%、%type%
含有特殊字符时，"%pathly%"才能正确调用其值
pathmb以\结尾
rem ----------------------------------------------------------脚本说明 end