@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
:begin
cls
pushd "%~dp0"
if not exist 路径处理\获取路径.bat (
echo,
echo,缺少文件!!!
ping /n 2 127.1>nul
goto exit
)
call 路径处理\获取路径.bat 1 1
pushd "%~dp0"
call 判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat 1 1
if "%result%"=="wj" (
echo,
echo,目标是文件!!!
ping /n 2 127.1>nul
goto begin
)
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%\*.rar"') do (
del /q /s "%%~i"
)
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
