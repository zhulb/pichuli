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
echo,缺少文件
ping /n 2 127.1>nul
goto exit
)
call 路径处理\获取路径.bat 1 1
type 网页头代码\网页头代码.zlb>"%pathmb%\%name%".htm
for /f "usebackq tokens=* delims= " %%i in ("%pathmb%\%name%.txt") do (
>>"%pathmb%\%name%".htm echo,^<p^>^<font color="#9900FF"^>%%i^</font^>^</p^>
)
echo,完成
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
