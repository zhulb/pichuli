@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,压缩文件夹内所有文件和文件夹^
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
if "%result%"=="wj" (
clc
echo,
echo,目标位文件!!!
ping /n 2 127.1>nul
goto begin
)
for /f "tokens=*" %%i in ('dir /b "%pathly%"') do (
set pathly="%pathly%\%%~i"
pushd "%~dp0"
call 路径处理\路径处理.bat 1 1
pushd "%~dp0"
call 判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat 1 1
pushd "%~dp0"
call :main
)
cls
echo,
echo,完成!!!
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------一层call
:main
if "%result%"=="wj" (
if "%type%"==".rar" goto :eof
call 压缩\压缩文件.bat 1 1
)else call 压缩\压缩文件夹.bat 1 1
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------一层goto
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end