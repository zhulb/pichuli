@echo off
pushd ..
:start
set date=2014/03/24
cls
:begin
call a\a19_getnextdate.bat date nextdate
set next
rem  ��������Ǵ��ڵ����ڲŻ�׼ȷ��������Ȼ�������ѭ��
if %nextdate%==2014/04/30 (
	pause
	goto :start
) else (
	set date=%nextdate%
)
goto :begin