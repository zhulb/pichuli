@echo off
rem ����Ҫ���ص�����Ŀ¼
pushd ..

rem 


rem ������ʽ����ʼ����yyyy/mm/dd ��������yyyy/mm/dd ���ܼ��ϵı���
call a\a25_gettimenum.bat starttime 1
call a\a24_getdatelist.bat 2014/04/07 2014/12/05 date
call a\a25_gettimenum.bat endtime 1
set /a time_=%endtime%-%starttime%
echo,ʱ�䣺%time_%
rem ��ʾ����
rem ���ϴ�С��%date.list[]%
rem ����Ԫ�أ�%date.list[1]% %date.list[2]%
set date
pause
exit