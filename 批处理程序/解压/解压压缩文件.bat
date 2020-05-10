@echo off
cls
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
if defined message (
echo,%message%
)
rem 在下面写主代码
echo,
echo,正在解压"%pathly%"...
start /wait "" winrar.exe x "%pathly%" "%pathmb%"
goto :eof
exit
rem ----------------------------------------------------------一层goto
:exit
if exist pathly.zlb del /q /s pathly.zlb
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end

