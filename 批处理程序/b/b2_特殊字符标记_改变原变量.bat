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
  rem ��-����ժҪ
  rem ��b2_�����ַ����_�ı�ԭ����:�������е������ַ�����ǣ������ԭ���ı�����
  rem ��-����ժҪ end
  rem ��-����˵��
  rem ��%3Ҫ��������ı�����
  rem ��-����˵�� end
  rem ��-�ű�˵��
  rem ����ǵ��ַ�:" ! ^ & | < > %
  rem ��-�ű�˵�� end
set b2_str1=%3
set b2_str2=*
if not defined %3 (
cls&echo,&echo,����,������%3��û�ж���!&pause
goto exit
)
call :b2_main "%%%3:"=��_��%%"
call :b2_main %%%3:!=��_̾_��%%
setlocal EnableDelayedExpansion
set !b2_str1!=!%b2_str1%:"=!
set !b2_str1!=!%b2_str1%:^^=ת_��!
set !b2_str1!=!%b2_str1%:^&=��_��!
set !b2_str1!=!%b2_str1%:^|=��_��!
set !b2_str1!=!%b2_str1%:^<=С_��!
set !b2_str1!=!%b2_str1%:^>=��_��!
set !b2_str1!=!%b2_str1%:%%=��_��_��!
set !b2_str1!=!%b2_str1%: =��_��!
rem ��set !b2_str1!=!%b2_str1%:^(=��_��!
rem ��set !b2_str1!=!%b2_str1%:^)=��_��!
>b2_��ʱ�ļ�.txt echo,!%b2_str1%!
endlocal
for /f "tokens=*" %%i in (b2_��ʱ�ļ�.txt) do (
set %b2_str1%=%%i
)
set b2_str1=
set b2_str2=
goto:eof
cls&echo,&echo,����,û�з���!��b2_�����ַ����.bat��&pause
exit
:b2_main
set %b2_str1%=%1
goto :eof
rem ---------------------------������ end
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit