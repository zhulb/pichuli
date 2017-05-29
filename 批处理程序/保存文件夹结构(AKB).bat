@echo off
set pathly="%~0"
set act=on
(2>nul call 路径处理\路径处理2.bat 1 1)||(echo,&echo,缺少文件"路径处理\路径处理2.bat"&ping /n 4 127.1>nul&set act=off)
if "%act%"=="on" (
call :a
)else (
set act=on
)
:begin
cls
(2>nul call 路径处理\获取路径4.bat 1 1)||(echo,&echo,缺少文件"路径处理\获取路径4.bat 1 1"&ping /n 4 127.1>nul&set act=off)
if "%act%"=="off" (
goto exit
)
rem ---------------从下面开始写代码
set act=on
(2>nul call 判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat 1 0)||(echo,&echo,缺少文件"路判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat"&ping /n 4 127.1>nul&set act=off)
if "%act%"=="off" (
goto exit
)
call 判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat 1 1
if "%result%"=="wj" (
echo,
echo,目标是文件！
ping /n 2 127.1>nul
goto begin
)
set str10.1="AKB剧场公演文件夹\STAGES チームA" "AKB剧场公演文件夹\STAGES チームK" "AKB剧场公演文件夹\STAGES チームB" "AKB单曲文件夹" "渡り廊下走り隊单曲文件夹" "AKB AX"
cd.>"%pathly%\文件夹生成.bat"
>>"%pathly%\文件夹生成.bat" echo,@echo off
>>"%pathly%\文件夹生成.bat" echo,set file=%str10.1%
set act=
for /f "usebackq tokens=*" %%i in ("%~0") do (
if "%%i"=="::代码10.1 end" goto finish10.1
if defined act (
>>"%pathly%\文件夹生成.bat" echo,%%i
) 
if "%%i"=="::代码10.1" set act=on
)
:finish10.1
for %%i in (%str10.1%) do (
set str10.2=%%~i
call :main
)
echo,
echo,完成!
ping /n 4 127.1>nul
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------二层goto

rem ----------------------------------------------------------二层goto end
rem ----------------------------------------------------------一层call
:main
call 变量处理\变量处理8.bat 1 1 str10.2
>>"%pathly%\文件夹生成.bat" echo,::%str10.2%
set str10.2=%str10.2%
if exist "%pathly%\%str10.2%" (
call :main2
)
call 变量处理\变量处理8.bat 1 1 str10.2
>>"%pathly%\文件夹生成.bat" echo,::%str10.2% end
set str10.2=%str10.2%
goto :eof
:a
title %name%
set name=%name%
set message=^
&echo,"%name%"
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------二层call
:main2
for /f "tokens=*" %%i in ('dir /ad/b "%pathly%\%str10.2%"') do (
>>"%pathly%\文件夹生成.bat" echo,%%i
)
goto :eof
rem ----------------------------------------------------------二层call end
rem ----------------------------------------------------------特异变量号
号码:
10
使用方法:
*号码.1、*号码.2 ...
这个序列的变量只能再本批处理使用(如号码为1时，str1.1、str1.2 ...)
rem ----------------------------------------------------------特异变量号 end
rem ----------------------------------------------------------段落重定向区域
::代码10.1
for %%a in (%file%) do (
call :setup %%~a
)
echo,&echo,完成
pause>nul
exit
:setup
echo,%*
set "act="
rem ----------注释:set "act=" 删除了环境变量act
for /f "usebackq tokens=* eol=" %%a in ("%~nx0") do (
if "%%a"=="::%* end" (goto :eof)
  if defined act (
  if not exist "%*\%%a" (
  md "%*\%%a"
  )
  )
  if "%%a"=="::%*" set act=act
)
pause>nul
exit
::代码10.1 end
rem ----------------------------------------------------------段落重定向区域 end
rem ----------------------------------------------------------脚本说明

rem ----------------------------------------------------------脚本说明 end