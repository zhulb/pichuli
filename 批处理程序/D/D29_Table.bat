@echo off
pushd ..
popd
set D29_message="%~n0"
set D29_pathmb="%~dp0"
set D29_pathmb=%D29_pathmb:~0,-4%
pushd %D29_pathmb%
::������
rem ----------------------------------------------------------������

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
::һ��c
rem ----------------------------------------------------------һ��c
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


::����1

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
