@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set pathly=%name%
call 变量处理\变量处理.bat 1 1
call 变量处理\变量处理.bat 1 1
set message=^
&echo,%pathly%^
&echo,^
&echo,只适合操作文件较少的文件夹!^
&echo,^
&echo,支持通配符*、?
:begin
cls
set pathly=
if not exist 路径处理\获取路径.bat (
echo,
echo,缺少文件
ping /n 2 127.1>nul
goto exit
)
echo,
set /p pathly=格式: 
if not defined pathly goto exit
call 变量处理\变量处理.bat 1 1
pushd "%~dp0"
set WJLX=%pathly%
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
if "%pathly:~-1%"=="\" (
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%*.%WJLX%"') do (
echo,%%i
echo,
echo,
)
)else (
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%\*.%WJLX%"') do (
echo,%%i
echo,
echo,
)
)

echo,
echo,完成!!!
pause>nul
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end