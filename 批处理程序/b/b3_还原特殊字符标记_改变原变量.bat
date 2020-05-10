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
  rem ■还原标记的字符:" ! ^ & | < > %
  rem ■-脚本说明 end
set b3_str1=%3
if not defined %3 (
cls&echo,&echo,错误,变量【%3】没有定义!&pause
goto exit
)
setlocal EnableDelayedExpansion
set !b3_str1!=!%b3_str1%:引_号=^^^^^^^"!
set !b3_str1!=!%b3_str1%:转_义=^^^^^^^^!
set !b3_str1!=!%b3_str1%:并_且=^^^^^^^&!
set !b3_str1!=!%b3_str1%:或_者=^^^^^^^|!
set !b3_str1!=!%b3_str1%:小_于=^^^^^^^<!
set !b3_str1!=!%b3_str1%:大_于=^^^^^^^>!
set !b3_str1!=!%b3_str1%:百_分_号=%%!
set !b3_str1!=!%b3_str1%:空_格= !
rem ■set !b3_str1!=!%b3_str1%:左_括=^(!
rem ■set !b3_str1!=!%b3_str1%:右_括=^)!
>b3_临时文件.txt echo,!%b3_str1%!
endlocal
for /f "tokens=*" %%i in (b3_临时文件.txt) do (
set b3_str2=%%i
)
set %b3_str1%=%b3_str2:感_叹_号=!%
set b3_str1=
set b3_str2=
goto:eof
cls&echo,&echo,错误,没有返回!【b3_还原特殊字符标记.bat】&pause
exit
rem ---------------------------主代码 end
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit