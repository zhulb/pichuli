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
for %%i in (%pathly%) do (
set pathly="%%~i"
set pathmb="%%~dpi"
set name="%%~ni"
set type="%%~xi"
)
if %pathly%=="exit" goto exit
cls
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
输出变量%pathly%、%pathmb%、%name%、%type%
且每个变量都用引号括住
pathmb以\结尾
rem ----------------------------------------------------------脚本说明 end