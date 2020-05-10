@echo off
set D9_message="%~n0"
set D9_pathmb="%~dp0"
set D9_pathmb=%D9_pathmb:~0,-4%
pushd %D9_pathmb%
::主代码
rem ----------------------------------------------------------主代码
set message=解压单个文件或文件夹内所有文件
:D9_begin
cls
set D9_passward=
echo,
set /p D9_passward=passward: 
call a\a2_获取路径.bat 1 1 0 1
call a\a10_路径判断2.bat 1 1 a2_pathly
if "%a10_result%"=="wj" (
call :D9_main1
goto D9_begin
)
for /f "tokens=*" %%i in ('dir /b "%a2_pathly%\*.jar"') do (
set D9_pathly1="%a2_pathly%\%%~i"
call :D9_main2
)
cls
echo,
echo,完成!
ping /n 2 127.1>nul
goto D9_begin
::一层c
rem ----------------------------------------------------------一层c
:D9_main1
if defined D9_passward (
call a\a4_解压文件2.bat 1 1 a2_pathly a2_pathmb D9_passward
)else (
call a\a3_解压文件1.bat 1 1 a2_pathly a2_pathmb
)
goto :eof
:D9_main2
if defined D9_passward (
call a\a4_解压文件2.bat 1 1 D9_pathly1 a2_pathly D9_passward
)else (
call a\a3_解压文件1.bat 1 1 D9_pathly1 a2_pathly
)
goto :eof
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:调用
【文件功能类 】:解压
【文件名称   】:解压压缩文件或文件夹内所有压缩文件
::属性说明 end
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
rem ----------------------------------------------------------主代码 end
::主代码 end