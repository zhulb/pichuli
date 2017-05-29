@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
call :a13_main1 "%%%3:"=%%"
cd.>a13_行信息.txt
cd.>a13_call信息.txt
cd.>a13_call信息2.txt
if not exist %a13_pathly% (
echo,
echo,错误!
echo,
echo,%a13_pathly%不存在!
ping /n 2 127.1>nul
goto :eof
)
for /f "tokens=*" %%i in ('findstr /n "call" %a13_pathly%') do (
>>a13_行信息.txt echo,%%i
)
set a13_str1= 
for /f "tokens=1,* delims=:" %%i in (a13_行信息.txt) do (
rem echo,第%%i行
set /p=%%i <nul
set a13_str3=%%i
set a13_str4=%%j
call a\a5_变量拆分1.bat 1 1 a13_str4 a13_str1
call :a13_main2
)
set a13_act=
for /f "tokens=1,* delims= " %%i in (a13_call信息.txt) do (
set a13_str5=%%j
call :a13_main3
if defined a13_act (
>>a13_call信息2.txt echo,%%i %%j
set a13_act=
)
)
cd.>a13_call信息3.txt
if exist a13_临时文件夹 rd /q/s a13_临时文件夹
md a13_临时文件夹
for /f "tokens=1,*" %%i in (a13_call信息2.txt) do (
set a13_str6=%%~nj
set a13_str7=%%~j
call :a13_main4
)
echo,
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a13_main1
set a13_pathly=%1
goto :eof
:a13_main2
set a13_act=
for /f "tokens=*" %%i in (a5_d.txt) do (
if defined a13_act (
>>a13_call信息.txt echo,%a13_str3% %%i
set a13_act=
)
if "%%i"=="call" set a13_act=on
)
goto :eof
:a13_main3
call a\a8_变量标记.bat 1 1 a13_str5
if not "%a13_str5:~0,1%"==":" set a13_act=on
goto :eof
:a13_main4
set a13_str4.1=_
call a\a5_变量拆分1.bat 1 1 a13_str6 a13_str4.1
for /f "tokens=*" %%i in (a5_d.txt) do (
set a13_str4.2=%%i
goto a13_finish4.1
)
:a13_finish4.1
if not exist a13_临时文件夹\%a13_str4.2%.txt (
>>a13_call信息3.txt echo,%a13_str7% %a13_str4.2%
cd.>a13_临时文件夹\%a13_str4.2%.txt
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
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
