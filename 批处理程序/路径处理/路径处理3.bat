@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
set pathly="%pathly:"=%"
for %%i in (%pathly%) do (
set pathly="%%~i
set pathmb="%%~dpi
set name="%%~ni
set type="%%~xi
)
set pathly=%pathly:^=^^^^%
set pathly=%pathly:&=^^^&%
set pathly=%pathly:|=^^^|%
set pathly=%pathly:"=%
set pathmb=%pathmb:^=^^^^%
set pathmb=%pathmb:&=^^^&%
set pathmb=%pathmb:|=^^^|%
set pathmb=%pathmb:"=%
set name=%name:^=^^^^%
set name=%name:&=^^^&%
set name=%name:|=^^^|%
set name=%name:"=%
set type=%type:^=^^^^%
set type=%type:&=^^^&%
set type=%type:|=^^^|%
set type=%type:"=%
popd
goto :eof
exit
rem ----------------------------------------------------------一层all

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
是路径处理2.bat的升级版本
rem ----------------------------------------------------------脚本说明 end