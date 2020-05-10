@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,压缩一个文件或文件夹^
&echo,^
&echo,添加了3%%100的恢复记录
:begin
cls
set passward=
set /p passward=passward: 
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
pushd "%~dp0"
if "%result%"=="wj" goto 文件
call 压缩\压缩文件夹.bat 1 1
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit
:文件
call 压缩\压缩文件.bat 1 1
goto begin
rem ----------------------------------------------------------一层goto end