@echo off
set result=
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
set pathly="%pathly:"=引_号%"
set pathly=%pathly:^=^^^^^^^^%
set pathly=%pathly:&=^^^^^^^&%
set pathly=%pathly:|=^^^^^^^|%
set pathly=%pathly:<=^^^^^^^<%
set pathly=%pathly:>=^^^^^^^>%
set pathly=%pathly:"=%
if "%pathly:~-1%"=="\" (
set result=qdq
)else (
set result=pt
)
set pathly=%pathly:引_号=^^^"%
set pathly=%pathly%
goto :eof
exit
rem ----------------------------------------------------------一层goto
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------脚本说明
set /p pathly=
当拖驱动器如G盘到批处理时，变量值为G:\；当拖文件夹如'G:\新建文件夹'到批处理时,变量值为G:\新建文件夹；前面的末尾有'\'，而后面的没有。
result=qdq表示pathly末尾为'\'，否则末尾不是'\'
rem ----------------------------------------------------------脚本说明 end

