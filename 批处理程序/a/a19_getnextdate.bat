@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem һ��ԭʼ���ݻ�ȡ
rem 1�����������ݸ�ֵ��
call :a19_getdate %%%1%%
rem 2���������ı�����
set a19_resultvar=%2



rem ������ȡ���ڻ�����Ϣ

set a19_date.year=%a19_date:~0,4%
set a19_date.month=%a19_date:~5,2%
set a19_date.day=%a19_date:~8,2%

rem 03--->3
if %a19_date.month% lss 10 (
	set a19_date.month=%a19_date:~6,1%
)
if %a19_date.day% lss 10 (
	set a19_date.day=%a19_date:~9,1%
)
rem ˵����
rem ��������set /a a19_date.month=%a19_date:~5,2%+0
rem ���ǵ�%a19_date:~5,2%Ϊ08ʱ�ᱨ��
rem ��set /a a=03+0���Եõ�3
rem ����set /a a=08+0�ᱨ��

rem ��year.isRuiNian
set /a a19_yuShu100=%a19_date.year% %% 100
set /a a19_yuShu400=%a19_date.year% %% 400
set /a a19_yuShu4=%a19_date.year% %% 4


rem 
if "%a19_yuShu100%"=="0" (
	if "%a19_yuShu400%"=="0" (
		set a19_date.year.isRuiNian=true
	) else (
		set a19_date.year.isRuiNian=false
	)
) else (
	if "%a19_yuShu4%"=="0" (
		set a19_date.year.isRuiNian=true
	) else (
		set a19_date.year.isRuiNian=false
	)
)

rem �����Ƿ�������ѡ���·���������

if "%a19_date.year.isRuiNian%"=="true" (
	set a19_date.month.list[1]=31
	set a19_date.month.list[2]=29
	set a19_date.month.list[3]=31
	set a19_date.month.list[4]=30
	set a19_date.month.list[5]=31
	set a19_date.month.list[6]=30
	set a19_date.month.list[7]=31
	set a19_date.month.list[8]=31
	set a19_date.month.list[9]=30
	set a19_date.month.list[10]=31
	set a19_date.month.list[11]=30
	set a19_date.month.list[12]=31
) else (
	
	set a19_date.month.list[1]=31
	set a19_date.month.list[2]=28
	set a19_date.month.list[3]=31
	set a19_date.month.list[4]=30
	set a19_date.month.list[5]=31
	set a19_date.month.list[6]=30
	set a19_date.month.list[7]=31
	set a19_date.month.list[8]=31
	set a19_date.month.list[9]=30
	set a19_date.month.list[10]=31
	set a19_date.month.list[11]=30
	set a19_date.month.list[12]=31
)
set a19_date.month.list[]=12

rem ��ȡ�������һ��

call a\a20_varcopy.bat a19_date.month.list[%a19_date.month%] a19_date.month.lastday

if "%a19_date.month.lastday.truevalue%"=="%a19_date.day%" (
	set a19_nextdate.day=1
	if "%a19_date.month%"=="12" (

		set a19_nextdate.month=1
		set /a a19_nextdate.year=%a19_date.year%+1
	) else (
		set /a a19_nextdate.month=%a19_date.month%+1
		set /a a19_nextdate.year=%a19_date.year%

	)
) else (


	set /a a19_nextdate.day=%a19_date.day%+1
	set /a a19_nextdate.month=%a19_date.month%
	set /a a19_nextdate.year=%a19_date.year%
)

rem 4--->04
if %a19_nextdate.month% lss 10 (
	set a19_nextdate.month=0%a19_nextdate.month%
)
if %a19_nextdate.day% lss 10 (
	set a19_nextdate.day=0%a19_nextdate.day%
)
set %a19_resultvar%=%a19_nextdate.year%/%a19_nextdate.month%/%a19_nextdate.day%


goto :eof



::һ��c
rem ----------------------------------------------------------һ��c
:a19_getdate
set a19_date=%1
goto :eof

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
rem ----------------------------------------------------------������ end
::������ end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:������
���ļ������� ��:
���ļ�����   ��:
������˵��   ��:
%1��%2����������
::����˵�� end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
