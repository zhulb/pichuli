@echo off
rem ---------------------------������
if "%2"=="" (
echo,&echo,��%%2����!
ping /n 2 127.1>nul
goto exit
)
rem ---------------------------������ end
  rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
rem ---------------------------������
  rem ��-����˵��
  rem ��%3Ҫ��������ı�����
  rem ��-����˵�� end
  rem ��-�ű�˵��
  rem ����ԭ��ǵ��ַ�:" ! ^ & | < > %
  rem ��-�ű�˵�� end
set b3_str1=%3
if not defined %3 (
cls&echo,&echo,����,������%3��û�ж���!&pause
goto exit
)
setlocal EnableDelayedExpansion
set !b3_str1!=!%b3_str1%:��_��=^^^^^^^"!
set !b3_str1!=!%b3_str1%:ת_��=^^^^^^^^!
set !b3_str1!=!%b3_str1%:��_��=^^^^^^^&!
set !b3_str1!=!%b3_str1%:��_��=^^^^^^^|!
set !b3_str1!=!%b3_str1%:С_��=^^^^^^^<!
set !b3_str1!=!%b3_str1%:��_��=^^^^^^^>!
set !b3_str1!=!%b3_str1%:��_��_��=%%!
set !b3_str1!=!%b3_str1%:��_��= !
rem ��set !b3_str1!=!%b3_str1%:��_��=^(!
rem ��set !b3_str1!=!%b3_str1%:��_��=^)!
>b3_��ʱ�ļ�.txt echo,!%b3_str1%!
endlocal
for /f "tokens=*" %%i in (b3_��ʱ�ļ�.txt) do (
set b3_str2=%%i
)
set %b3_str1%=%b3_str2:��_̾_��=!%
set b3_str1=
set b3_str2=
goto:eof
cls&echo,&echo,����,û�з���!��b3_��ԭ�����ַ����.bat��&pause
exit
rem ---------------------------������ end
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit