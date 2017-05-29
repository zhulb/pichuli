@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set pathly=%name%
call 变量处理\变量处理.bat 1 1
call 变量处理\变量处理.bat 1 1
set message=^
&echo,%pathly%
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
set "num=一二三四五六七八九十"
if "%pathly%"=="exit" goto exit
echo,^">引号.txt
if exist "%pahtmb%%name%.htm" del /q /s "%pahtmb%%name%.htm"
copy 网页头代码\网页头代码2.zlb "%pathmb%%name%.htm"
set "act=off"
set id=1
set idnum=0
for /f "usebackq tokens=1,2,* delims= " %%i in ("%pathly%") do (
echo,%%i>i.txt
echo,%%j>j.txt
echo,%%k>k.txt
call :导入到临时文本2 "%%i" "%%j" "%%k"
call :main "%%i" "%%j" "%%k"
)
del /q /s 临时文本.txt 临时文本2.txt i.txt j.txt k.txt 引号.txt
cls
echo,完成,即将返回
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------一层call
:导入到临时文本2
rem -----------------------------------------------------------不能用echo,来重定向,下面写法确保光标位置保留在第一行
(set /p="<p>%id%、<a title=" <nul)>临时文本2.txt
for /f "tokens=* delims= " %%i in (引号.txt) do (
(set /p="%%i" <nul)>>临时文本2.txt
)
for /f "tokens=* delims= " %%i in (k.txt) do (
(set /p="%%i" <nul)>>临时文本2.txt
)
for /f "tokens=* delims= " %%i in (引号.txt) do (
(set /p="%%i" <nul)>>临时文本2.txt
)
for /f "tokens=* delims= " %%i in (j.txt) do (
(set /p="href="http://%%i">" <nul)>>临时文本2.txt
)
for /f "tokens=* delims= " %%i in (i.txt) do (
(set /p="%%i</a></p>" <nul)>>临时文本2.txt
)
goto :eof
:main
echo, %1 %2 %3
if "%~1"==":::" set "act=off"
if "%~1"=="::" set "act=off"
if "%act%"=="on" call :导出 %1 %2 %3
if "%~1"=="::" call :分类 %idnum% %2
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------二层call
:分类
set "act=on"
setlocal EnableDelayedExpansion
(echo,!num:~%1,1!
)>临时文本.txt
endlocal
for /f "tokens=* delims= " %%i in (临时文本.txt) do (
set fenlei=%%i
)
echo,>>"%pathmb%%name%.htm"
(set /p="<p>%fenlei%、" <nul)>>"%pathmb%%name%.htm"
for /f "tokens=* delims= " %%i in (j.txt) do (
(set /p="%%i</p>" <nul)>>"%pathmb%%name%.htm"
)
set /a idnum=%idnum%+1
goto :eof
:导出
echo,>>"%pathmb%%name%.htm"
type 临时文本2.txt>>"%pathmb%%name%.htm"
set /a id=%id%+1
goto :eof
rem ----------------------------------------------------------二层call end
