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
if "%type%"==".rar" goto :eof
echo,
echo,正在压缩"%pathly%"...
if defined passward (
start /wait "" winrar.exe a -ep1 -hp"%passward%" -rr"30p" "%pathmb%%name%.rar" "%pathly%"
)else (
start /wait "" winrar.exe a -ep1 -rr"30p" "%pathmb%%name%.rar" "%pathly%"
)
goto :eof
rem ----------------------------------------------------------一层goto
:exit
if exist pathly.zlb del /q /s pathly.zlb
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
