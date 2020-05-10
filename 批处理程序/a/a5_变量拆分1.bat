@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
cd.>a5_a.txt
cd.>a5_b.txt
cd.>a5_c.txt
cd.>a5_d.txt
call a\a8_变量标记.bat 1 1 %3
call a\a8_变量标记.bat 1 1 %4
set a5_str1=%3
set a5_str2=%4
setlocal EnableDelayedExpansion
set a5_str3=!%a5_str2%!
set a5_str4=!%a5_str1%:a=▓!
set a5_str4=!a5_str4:%a5_str3%=a!
set a5_i=1
set a5_str6=a5_a
set a5_str5=a5_b
>%a5_str6%.txt echo,!a5_str4!
:a5_back
set a5_act=
for /f "tokens=1,* delims=a" %%i in (%a5_str6%.txt) do (
if defined a5_act (
>>%a5_str5%.txt echo,%%i
>>%a5_str5%.txt echo,%%j
)else (
>%a5_str5%.txt echo,%%i
>>%a5_str5%.txt echo,%%j
set a5_act=on
)
)
set a5_md=%a5_str6%
set a5_str6=%a5_str5%
set a5_str5=%a5_md%
set /a a5_i=%a5_i%+1
if not %a5_i% equ 20 goto a5_back
cd.>a5_c.txt
for /f "tokens=*" %%i in (a5_a.txt) do (
>>a5_c.txt echo,%%i
)
endlocal
cd.>a5_d.txt
for /f "tokens=*" %%i in (a5_c.txt) do (
set a5_str1=%%i
call :a5_main
)
set a5_str1=
set a5_str2=
set a5_str3=
set a5_str6=
set a5_str5=
set a5_str4=
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a5_main
call a\a9_标记还原.bat 1 1 a5_str1
>>a5_d.txt echo,%a5_str1:▓=a%
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
拆分结果放在a5_d.txt中，注意用此批处理时拆分字符不能为a或【标_记】的顺序组合【标_、标_记、_记】中的任何一个
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:变量处理
【文件名称   】:变量按字符串拆分
【参数说明   】:
%1、%2参数无意义
%3、%4分别代表待拆分变量名、拆分符变量名
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
