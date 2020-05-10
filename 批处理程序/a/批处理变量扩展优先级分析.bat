@echo off
echo,--------------test1
call :test1
echo,--------------test2
pause
exit

rem 变量扩展优先级分析程序
rem 在批处理中总共有4种变量扩展
rem 1、参数扩展
rem 2、变量扩展
rem 3、for()变量扩展
rem 4、变量延迟扩展
rem 
rem 优先级说明：
rem 1、参数扩展和变量扩展时同时扩展的，是同级变量扩展，也是最高级的变量扩展
rem 但是%1%a%这样的形式前面的%1%即使定义了环境变量1也不会扩展到变量(cmd命令中可以)，只能扩展到参数，故认为参数扩展时次优先级扩展
rem 2、for()变量扩展为第二优先扩展
rem 3、变量延迟扩展优先级排在最后，在预编译完成后，程序运行时进行扩展



:test1
rem 一下程序说明参数扩展%1、%2、%3...%*不比变量扩展%var%优先级低
set a=%%1
call :main 3
goto :eof
:main
echo,%a%
goto :eof




:test2
rem 以下程序说明变量扩展不必参数扩展优先级低