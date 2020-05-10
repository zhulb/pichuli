@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,解压文件夹及子文件夹内所有压缩文件
:begin
cls
pushd "%~dp0"
set passward=
set /p passward=passward: 
if not exist 路径处理\获取路径.bat (
echo,
echo,缺少文件
ping /n 2 127.1>nul
goto exit
)
call 路径处理\获取路径.bat 1 1
pushd "%~dp0"
call 判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat 1 1
if "%result%"=="wj" (
cls
echo,
echo,目标是文件!!!
ping /n 2 127.1>nul
goto begin
)
if defined passward (
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%\*.rar"') do (
(2>nul pushd "%%~dpi")
cls
echo,
echo,正在解压"%%i"...
start /wait "" winrar.exe x -p"%passward%" "%%i"
)
)else (
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%\*.rar"') do (
(2>nul pushd "%%~dpi")
cls
echo,
echo,正在解压"%%i"...
start /wait "" winrar.exe x "%%i"
)
)
cls
echo,
echo,完成!!!
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end