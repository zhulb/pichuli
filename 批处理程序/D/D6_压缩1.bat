@echo off
set D6_message="%~n0"
set D6_pathmb="%~dp0"
set D6_pathmb=%D6_pathmb:~0,-4%
pushd %D6_pathmb%
::主代码
rem ----------------------------------------------------------主代码
set message=压缩单个文件、文件夹
:D6_begin
cls
set /p D6_passward=passward: 
cls
call a\a2_获取路径.bat 1 1 0 1
call a\a2_获取路径.bat 1 1 0 1
if "%a10_result%"=="wj" (
call a\a11_压缩文件.bat 1 1 a2_pathly D6_passward
)else (
call a\a12_压缩文件夹.bat 1 1 a2_pathly D6_passward
)
goto D6_begin
::一层c
rem ----------------------------------------------------------一层c
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
【文件功能类 】:压缩
【文件名称   】:压缩单个文件或文件夹
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