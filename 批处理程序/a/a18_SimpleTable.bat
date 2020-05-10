@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 简单数据表读取
rem 一、表的格式
rem 
rem ::标签
rem 数据;数据;数据;数据...
rem 数据;数据;数据;数据...
rem ...
rem ::标签_end
rem 
rem 二、数据说明
rem 1、数据的行数没有限制，但是最多只能有8列
rem 2、数据中不能有特殊字符[^&%;|<>"]最好用于存储中文、数字、字母数据
rem 
rem 
rem 三、调用方法
rem call a18_SimpleTable.bat 表文件的路径 ::标签 接受数据的变量 
rem 
rem 四、数据用法
rem 数据行数               %接受变量.list[]%
rem 第5行第m列的值         %接受变量.list[5].列名%
rem
rem 五、使用范围
rem 8列以下的表结构，且数据为中文、数字、字母
rem 
rem 六、使用例子
rem a18_SimpleTableEp1.bat
rem 
set a18_Table.path="%~1"
set a18_Table.biaoqian=%2
set a18_Table.var=%3






set a18_Table.load=
set a18_Table.load.title=
set a18_Table.num=0
set a18_Table.title=

set a18_Table.columns[]=0

for /f "usebackq tokens=* delims=" %%i in (%a18_Table.path%) do (
	if "%%~i"=="%a18_Table.biaoqian%_end" goto :a18_Table.loadend
	if defined a18_Table.load (
		call :a18_main %%i
	)
	if "%%~i"=="%a18_Table.biaoqian%" set a18_Table.load=on	
)
:a18_Table.loadend
set %a18_Table.var%.list[]=%a18_Table.num%

goto :eof





::一层c
rem ----------------------------------------------------------一层c
:a18_Table.loadcolumn
set /a a18_Table.columns[]=%a18_Table.columns[]%+1
set a18_Table.columns[%a18_Table.columns[]%]=%1

goto :eof
:a18_main

if not defined a18_Table.title (
	set a18_Table.title=in
	for %%i in (%*) do (
		call :a18_Table.loadcolumn %%i
	)

	goto :eof


)

set /a a18_Table.num=%a18_Table.num%+1
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[1]%=%1
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[2]%=%2
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[3]%=%3
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[4]%=%4
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[5]%=%5
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[6]%=%6
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[7]%=%7
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[8]%=%8
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
【修改记录   】：
20150817
	
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
