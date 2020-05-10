@echo off
cls
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
set pathly="%pathly:"=%"
set pathly=%pathly:!=感_叹_号%
setlocal EnableDelayedExpansion
set pathly=!pathly:%%=%%%%!
>pathly.zlb echo,!pathly!
endlocal
for /f "tokens=*" %%i in (pathly.zlb) do (
set pathly=%%i
)
set pathly=%pathly:感_叹_号=!%
if exist pathly.zlb del /q /s pathly.zlb
call :获取源信息 %pathly%
cls
popd
goto :eof
exit
rem ----------------------------------------------------------一层all
:获取源信息
set pathly="%~1"
echo,%pathly%
set pathly=%pathly:^=^^%
set pathly=%pathly:&=^^^&%
set pathly=%pathly:|=^^^|%
set pathmb="%~dp1"
set pathmb=%pathmb:^=^^%
set pathmb=%pathmb:&=^^^&%
set pathmb=%pathmb:|=^^^|%
set name="%~n1"
set name=%name:^=^^%
set name=%name:&=^^^&%
set name=%name:|=^^^|%
set type="%~x1"
set type=%type:^=^^%
set type=%type:&=^^^&%
set type=%type:|=^^^|%
set pathly=%pathly:"=%
set pathmb=%pathmb:"=%
set name=%name:"=%
set type=%type:"=%
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------一层goto
:exit
if exist pathly.zlb del /q /s pathly.zlb
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------脚本说明
对变量pathly进行处理
输出变量%pathly%、%pathmb%、%name%、%type%
%pathly%就能调用其值
pathmb以\结尾
rem ----------------------------------------------------------脚本说明 end