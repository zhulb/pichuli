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
::������
rem ----------------------------------------------------------������


set D23_user[1].name=zjdms
set D23_user[1].password=zjdms
set D23_user[1].sid=orcl



set D23_people[1].name=������
set D23_people[1].age=26
set D23_people[2].name=�����
set D23_people[2].age=19
for /l %%i in (1,1,2) do (
	call :main %%D23_people[%%i].name%% %%D23_people[%%i].age%%
)



call :D23_People.kill %%D23_people[1].name%% %%D23_people[2].name%%
pause
exit
::һ��c
rem ----------------------------------------------------------һ��c
::����1
:main
echo,%1 %2
goto :eof

:D23_People.kill
echo,%1 kill %2
goto :eof


::����1 end
::����2

::����2 end
rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c end
::�Ĳ�c end
::���c
rem ----------------------------------------------------------���c
rem ----------------------------------------------------------���c end
::���c end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:����
���ļ������� ��:
���ļ�����   ��:
::����˵�� end
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------������ end
::������ end
