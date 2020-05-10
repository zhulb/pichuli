@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 一、调用此批处理可以将一个变量的值赋值给另外一个变量
rem 
rem 二、参数1表示被复制值的变量名称，参数2表示接收值的变量名
rem 
rem 三、调用方式
rem 
rem 四、返回值使用方法
rem %接受变量名.showvalue%，可用来输出环境变量的值，值中的特殊符号已做转义处理
rem %接受变量名.truevalue%, 环境变量原来的值

set a21_source.name=%1
set a21_append.name=%2
set a21_target.name=%3



rem 获取%1变量的可输值
rem 设置方法参数
set a21_varcopy.args.targetname=a21_source
rem 调用方法
call :a21_varcopy "%%%a21_source.name%:"=" "%%"
echo,----【%a21_source.showvalue%


rem 设置方法参数
set a21_varcopy.args.targetname=a21_append
rem 调用方法
call :a21_varcopy "%%%a21_append.name%:"=" "%%"
echo,----【%a21_append.showvalue%

set a21_target.truevalue=%a21_source.showvalue%%a21_append.showvalue%


set a21_varcopy.args.targetname=%a21_target.name%
call :a21_varcopy "%%a21_target.truevalue:"=" "%%"

goto :eof



:a21_varcopy

set a21_linshi=%*
set a21_linshi=%a21_linshi:^=^^^^^^^^^^^^^^^^%
set a21_linshi=%a21_linshi:&=^^^^^^^^^^^^^^^&%
set a21_linshi=%a21_linshi:|=^^^^^^^^^^^^^^^|%
set a21_linshi=%a21_linshi:>=^^^^^^^^^^^^^^^>%
set a21_linshi=%a21_linshi:<=^^^^^^^^^^^^^^^<%
set a21_linshi=%a21_linshi:~1,-1%
set a21_linshi=%a21_linshi:" "=^^^^^^^"%

set %a21_varcopy.args.targetname%.showvalue=%a21_linshi%
set a21_linshi=%a21_linshi%
set %a21_varcopy.args.targetname%.truevalue=%a21_linshi%
goto :eof



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
