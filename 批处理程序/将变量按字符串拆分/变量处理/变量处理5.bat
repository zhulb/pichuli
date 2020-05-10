@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
if not defined pathly popd&goto :eof
set pathly="%pathly:"=%"
set pathly=%pathly:^=转_义%
set pathly=%pathly:&=并_且%
set pathly=%pathly:|=或_者%
set pathly=%pathly:<=小_于%
set pathly=%pathly:>=打_于%
set pathly=%pathly:!=感_叹%
set pathly=%pathly:"=%
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
将变量pathly中的特殊字符用对应标记替换,去除引号
rem ----------------------------------------------------------脚本说明 end