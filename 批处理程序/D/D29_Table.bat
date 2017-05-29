@echo off
pushd ..
popd
set D29_message="%~n0"
set D29_pathmb="%~dp0"
set D29_pathmb=%D29_pathmb:~0,-4%
pushd %D29_pathmb%
::主代码
rem ----------------------------------------------------------主代码

set D29_Table.path="%~0"
set D29_Table.name=D29_userData
set D29_Table.var=user



set D29_Table.load=
set D29_Table.num=0
for /f "usebackq tokens=1,2,3,* delims=;" %%i in (%D29_Table.path%) do (
	if "%%~i"=="::%D29_Table.name%_end" goto :D29_Table.loadend
	if defined D29_Table.load (
		call :main %%i %%j %%k %%l
	)
	if "%%~i"=="::%D29_Table.name%" set D29_Table.load=on	
)
:D29_Table.loadend
echo,%user[3].pwd%
pause
exit
::一层c
rem ----------------------------------------------------------一层c
:main
set /a D29_Table.num=%D29_Table.num%+1
set %D29_Table.var%[%D29_Table.num%].name=%1
set %D29_Table.var%[%D29_Table.num%].pwd=%2
set %D29_Table.var%[%D29_Table.num%].database=%3
set %D29_Table.var%[%D29_Table.num%].tablespace=%4
goto :eof
::D29_userData
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
::D29_userData_end


::函数1

::函数1 end
::函数2

::函数2 end
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
【文件功能类 】:
【文件名称   】:
::属性说明 end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------主代码 end
::主代码 end
