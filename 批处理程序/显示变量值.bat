@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
:begin
set pathly=
pushd "%~dp0"
if not exist 变量处理\变量处理.bat (
echo,
echo,缺少文件
ping /n 2 127.1>nul
goto exit
)
cls
echo,
echo,输入字符串作为变量pathly的值
echo,
echo,退出请跳过输入
echo,
set /p pathly=请输入: 
if not defined pathly goto exit
call 变量处理\变量处理.bat 1 1
pushd "%~dp0"
echo,
echo,变量值为
echo,
echo,%pathly%
pause>nul
goto begin
rem -------------------------------一层goto
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem -------------------------------一层goto end
