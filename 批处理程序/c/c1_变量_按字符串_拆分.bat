@echo off
rem ---------------------------副代码
if "%2"=="" (
echo,
echo,无%%2参数!
ping /n 2 127.1>nul
goto exit
)
rem ---------------------------副代码 end
  rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
rem ---------------------------主代码
call b\b2_特殊字符标记_改变原变量.bat 1 1 %3
call b\b2_特殊字符标记_改变原变量.bat 1 1 %4
set c1_str1=%3
set c1_str2=%4
setlocal EnableDelayedExpansion
set c1_str3=!%c1_str2%!
set c1_str4=!%c1_str1%:a=标_记!
set c1_str4=!c1_str4:%c1_str3%=a!
set c1_i=1
set c1_str6=c1_a
set c1_str5=c1_b
>%c1_str6%.txt echo,!c1_str4!
:c1_back
set act=
for /f "tokens=1,* delims=a" %%i in (%c1_str6%.txt) do (
if defined act (
>>%c1_str5%.txt echo,%%i
>>%c1_str5%.txt echo,%%j
)else (
>%c1_str5%.txt echo,%%i
>>%c1_str5%.txt echo,%%j
set act=on
)
)
set c1_md=%c1_str6%
set c1_str6=%c1_str5%
set c1_str5=%c1_md%
set /a c1_i=%c1_i%+1
if not %c1_i% equ 100 goto c1_back
cd.>c1_c.txt
for /f "tokens=*" %%i in (c1_a.txt) do (
>>c1_c.txt echo,%%i
)
endlocal
cd.>c1_d.txt
for /f "tokens=*" %%i in (c1_c.txt) do (
set c1_str1=%%i
call :c1_main
)
set c1_str1=
set c1_str2=
set c1_str3=
set c1_str6=
set c1_str5=
set c1_str4=
goto :eof
  rem ■一层call
:c1_main
call b\b3_还原特殊字符标记_改变原变量.bat 1 1 c1_str1
>>c1_d.txt echo,%c1_str1:标_记=a%
goto :eof
  rem ■一层call end
rem ---------------------------主代码 end
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit