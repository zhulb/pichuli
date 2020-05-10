@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,1 判断目标是文件还是文件夹^
&echo,^
&echo,2 显示文件或文件夹路径
:begin
pushd "%~dp0"
if not exist 路径处理\获取路径.bat (
echo,
echo,缺少文件
ping /n 2 127.1>nul
goto exit
)
call 路径处理\获取路径.bat 1 1
pushd "%~dp0"
call 判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat 1 1
if "%result%"=="wj" goto 文件
cls
echo,
echo,目标为文件夹
echo,
echo,路径为:"%pathly%"
pause>nul
goto begin
rem -------------------------------一层goto
:文件
echo,
echo,目标为文件
echo,
echo,路径为:"%pathly%"
pause>nul
goto begin
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem -------------------------------一层goto end
