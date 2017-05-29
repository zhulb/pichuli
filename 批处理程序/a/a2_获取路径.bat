@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
  rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
if "%4"=="1" (
  rem ■%2参数为0表示不显示message的内容；%2参数为1表示若message有定义就显示其内容
if defined message (
cls
echo,&echo,"%message:"=%
)
)
echo,&echo,---------------------------退出:输入exit(默认)&echo,
set a2_pathly=exit
set /p a2_pathly=路径: 
set a2_pathly="%a2_pathly:"=%"
for %%i in (%a2_pathly%) do (
set a2_pathmb="%%~dpi"
set a2_name="%%~ni"
set a2_type="%%~xi"
)
if %a2_pathly%=="exit" goto exit
set a2_pathly=%a2_pathly:^=^^%
set a2_pathly=%a2_pathly:&=^&%
set a2_pathly=%a2_pathly:|=^|%
set a2_pathly=%a2_pathly:"=%
set a2_pathmb=%a2_pathmb:^=^^%
set a2_pathmb=%a2_pathmb:&=^&%
set a2_pathmb=%a2_pathmb:|=^|%
set a2_pathmb=%a2_pathmb:"=%
set a2_name=%a2_name:^=^^%
set a2_name=%a2_name:&=^&%
set a2_name=%a2_name:|=^|%
set a2_name=%a2_name:"=%
set a2_type=%a2_type:^=^^%
set a2_type=%a2_type:&=^&%
set a2_type=%a2_type:|=^|%
set a2_type=%a2_type:"=%
if "%3"=="1" (
  rem ■可以比较拖动驱动器、拖入文件夹、拖入文件时的区别
  rem ■0表示无定义，1表示有定义
cls
echo,
echo,   a2_获取路径.bat
echo,
echo,  ╔═══════════════════════════════
set /p nothing="  ║a2_pathly║" <nul
if defined a2_pathly (
echo,1"【%a2_pathly%】
)else (
echo,0"【%a2_pathly%】
)
echo,  ║═══════════════════════════════
set /p nothing="  ║a2_pathmb║" <nul
if defined a2_pathmb (
echo,1"【%a2_pathmb%】
)else (
echo,0"【%a2_pathmb%】
)
echo,  ║═══════════════════════════════
set /p nothing="  ║a2_name  ║" <nul
if defined a2_name (
echo,1"【%a2_name%】
)else (
echo,0"【%a2_name%】
)
echo,  ║═══════════════════════════════
set /p nothing="  ║a2_type  ║" <nul
if defined a2_type (
echo,1"【%a2_type%】
)else (
echo,0"【%a2_type%】
)
echo,  ╚═══════════════════════════════
echo,     ^(0表示无定义，1表示有定义^)
echo,
echo,   按任意键继续!
pause>nul
cls
)
goto:eof
cls&echo,&echo,错误,没有返回!【a2_获取路径.bat】&pause
exit
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
输出的变量提取的是原值，有特殊字符时，要在变量前加"来进行转义。
返回的变量:a2_pathly、a2_pathmb、a2_name、a2_type
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:路径处理
【文件名称   】:获取路径
【参数说明   】:
%1、%2参数无意义
%3是显示结果和不显示结果的开关，%1为1时会显示路径具体情况并暂停，%1为0时则不显示也不暂停
%4参数显示(为1时)或不显示(为0时)变量message的内容
::属性说明 end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit