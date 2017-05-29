@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,忽略原来空行,两行间添加一空行
:begin
cls
pushd "%~dp0"
if not exist 路径处理\获取路径.bat (
echo,
echo,缺少文件
ping /n 2 127.1>nul
goto exit
)
call 路径处理\获取路径.bat 1 1
cd.>"%pathmb%临时文件.txt"
for /f "usebackq tokens=* delims=" %%i in ("%pathly%") do (
>>"%pathmb%临时文件.txt" echo,%%i
>>"%pathmb%临时文件.txt" echo,
)
del /q /s "%pathly%"
ren "%pathmb%临时文件.txt" "%name%%type%"
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
