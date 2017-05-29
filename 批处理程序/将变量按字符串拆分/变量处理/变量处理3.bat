@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
if not defined pathly popd&goto :eof
set pathly="%pathly:"=引_号%"
set pathly=%pathly:^=^^^^^^^^%
set pathly=%pathly:&=^^^^^^^&%
set pathly=%pathly:|=^^^^^^^|%
set pathly=%pathly:<=^^^^^^^<%
set pathly=%pathly:>=^^^^^^^>%
set pathly=%pathly:"=%
set pathly=^^^"%pathly:引_号=^^^"%^^^"
popd
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
rem ----------------------------------------------------------脚本说明
对变量pathly进行处理,处理后使得代码echo,%pathly%能够显示pathly原来的值(并且两边加上两个引号)
rem ----------------------------------------------------------脚本说明 end