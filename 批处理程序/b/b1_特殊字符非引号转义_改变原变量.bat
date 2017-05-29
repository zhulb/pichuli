@echo off
rem ---------------------------副代码
if "%2"=="" (
echo,&echo,无%%2参数!
ping /n 2 127.1>nul
goto exit
)
rem ---------------------------副代码 end
  rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
rem ---------------------------主代码
  rem ■-参数说明
  rem ■%3要处理变量的变量名
  rem ■-参数说明 end
  rem ■-脚本说明
  rem ■处理后能直接引用来表示值(%2参数去不同值时，引号的处理不同，详细见下)，不要在前面加"或^
  rem ■-脚本说明 end
set b1_str1=%3
if not defined %3 (
cls&echo,&echo,错误,变量【%3】没有定义!&pause
goto exit
)
setlocal EnableDelayedExpansion
set b1_str1=!%b1_str1%!
set b1_str1=!b1_str1:^^=^^^^!
set b1_str1=!b1_str1:^&=^^^&!
set b1_str1=!b1_str1:^|=^^^|!
set b1_str1=!b1_str1:^<=^^^<!
set b1_str1=!b1_str1:^>=^^^>!
set b1_act=
if "%2"=="p1a00" set b1_str1=!b1_str1:"=^"!&set b1_act=on
  rem ■p1a00表示保留原来的引号并且不添加新的引号
if "%2"=="p0a00" set b1_str1=!b1_str1:"=!&set b1_act=on
  rem ■p0a00表示不保留原来的引号并且不添加新的引号
if "%2"=="p0a11" (
  rem ■p0a11表示不保留原来的引号并且两端添加新的引号
set b1_str2=^^"
set b1_str1=!b1_str2!!b1_str1:"=!!b1_str2!
set b1_act=on
)
if "%2"=="p0a10" (
set b1_str2=^^"
set b1_str1=!b1_str2!!b1_str1:"=!
set b1_act=on
)
if "%2"=="p0a01" (
set b1_str2=^^"
set b1_str1=!b1_str1:"=!!b1_str2!
set b1_act=on
)
if not defined b1_act set b1_str1=!b1_str1:"=^"!
>b1_临时文件.txt echo,!b1_str1!
endlocal
for /f "tokens=*" %%i in (b1_临时文件.txt) do (
set %b1_str1%=%%i
)
goto:eof
cls&echo,&echo,错误,没有返回!【b1_特殊字符非引号转义.bat】&pause
exit
rem ---------------------------主代码 end
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit