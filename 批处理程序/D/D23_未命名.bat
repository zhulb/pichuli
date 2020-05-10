@echo off
call :a 
echo,%num%
for /l %%i in (1,1,%num%) do (
	call :echo %%args[%%i]%%
)
pause
exit
:echo
echo,%1
goto :eof
:a 
set num=0

:next
if "%1"=="" (
	goto :eof
) else (
	set args[%num%]=%1
	set /a num=%num%+1
	shift
	goto :next
)


goto :eof


pushd ..
popd
set D23_message="%~n0"
set D23_pathmb="%~dp0"
set D23_pathmb=%D23_pathmb:~0,-4%
pushd %D23_pathmb%
::主代码
rem ----------------------------------------------------------主代码


set D23_user[1].name=zjdms
set D23_user[1].password=zjdms
set D23_user[1].sid=orcl



set D23_people[1].name=朱亮冰
set D23_people[1].age=26
set D23_people[2].name=沈依瑜
set D23_people[2].age=19
for /l %%i in (1,1,2) do (
	call :main %%D23_people[%%i].name%% %%D23_people[%%i].age%%
)



call :D23_People.kill %%D23_people[1].name%% %%D23_people[2].name%%
pause
exit
::一层c
rem ----------------------------------------------------------一层c
::函数1
:main
echo,%1 %2
goto :eof

:D23_People.kill
echo,%1 kill %2
goto :eof


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
