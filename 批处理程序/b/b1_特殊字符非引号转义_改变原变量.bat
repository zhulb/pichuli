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
  rem ���������ֱ����������ʾֵ(%2����ȥ��ֵͬʱ�����ŵĴ���ͬ����ϸ����)����Ҫ��ǰ���"��^
  rem ��-�ű�˵�� end
set b1_str1=%3
if not defined %3 (
cls&echo,&echo,����,������%3��û�ж���!&pause
goto exit
)
setlocal EnableDelayedExpansion
set b1_str1=!%b1_str1%!
set b1_str1=!b1_str1:^^=^^^^!
set b1_str1=!b1_str1:^&=^^^&!
set b1_str1=!b1_str1:^|=^^^|!
set b1_str1=!b1_str1:^<=^^^<!
set b1_str1=!b1_str1:^>=^^^>!
set b1_act=
if "%2"=="p1a00" set b1_str1=!b1_str1:"=^"!&set b1_act=on
  rem ��p1a00��ʾ����ԭ�������Ų��Ҳ�����µ�����
if "%2"=="p0a00" set b1_str1=!b1_str1:"=!&set b1_act=on
  rem ��p0a00��ʾ������ԭ�������Ų��Ҳ�����µ�����
if "%2"=="p0a11" (
  rem ��p0a11��ʾ������ԭ�������Ų�����������µ�����
set b1_str2=^^"
set b1_str1=!b1_str2!!b1_str1:"=!!b1_str2!
set b1_act=on
)
if "%2"=="p0a10" (
set b1_str2=^^"
set b1_str1=!b1_str2!!b1_str1:"=!
set b1_act=on
)
if "%2"=="p0a01" (
set b1_str2=^^"
set b1_str1=!b1_str1:"=!!b1_str2!
set b1_act=on
)
if not defined b1_act set b1_str1=!b1_str1:"=^"!
>b1_��ʱ�ļ�.txt echo,!b1_str1!
endlocal
for /f "tokens=*" %%i in (b1_��ʱ�ļ�.txt) do (
set %b1_str1%=%%i
)
goto:eof
cls&echo,&echo,����,û�з���!��b1_�����ַ�������ת��.bat��&pause
exit
rem ---------------------------������ end
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit