@echo off
rem ---------------------------������
if "%2"=="" (
echo,
echo,��%%2����!
ping /n 2 127.1>nul
goto exit
)
rem ---------------------------������ end
  rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
rem ---------------------------������
call b\b2_�����ַ����_�ı�ԭ����.bat 1 1 %3
call b\b2_�����ַ����_�ı�ԭ����.bat 1 1 %4
set c1_str1=%3
set c1_str2=%4
setlocal EnableDelayedExpansion
set c1_str3=!%c1_str2%!
set c1_str4=!%c1_str1%:a=��_��!
set c1_str4=!c1_str4:%c1_str3%=a!
set c1_i=1
set c1_str6=c1_a
set c1_str5=c1_b
>%c1_str6%.txt echo,!c1_str4!
:c1_back
set act=
for /f "tokens=1,* delims=a" %%i in (%c1_str6%.txt) do (
if defined act (
>>%c1_str5%.txt echo,%%i
>>%c1_str5%.txt echo,%%j
)else (
>%c1_str5%.txt echo,%%i
>>%c1_str5%.txt echo,%%j
set act=on
)
)
set c1_md=%c1_str6%
set c1_str6=%c1_str5%
set c1_str5=%c1_md%
set /a c1_i=%c1_i%+1
if not %c1_i% equ 100 goto c1_back
cd.>c1_c.txt
for /f "tokens=*" %%i in (c1_a.txt) do (
>>c1_c.txt echo,%%i
)
endlocal
cd.>c1_d.txt
for /f "tokens=*" %%i in (c1_c.txt) do (
set c1_str1=%%i
call :c1_main
)
set c1_str1=
set c1_str2=
set c1_str3=
set c1_str6=
set c1_str5=
set c1_str4=
goto :eof
  rem ��һ��call
:c1_main
call b\b3_��ԭ�����ַ����_�ı�ԭ����.bat 1 1 c1_str1
>>c1_d.txt echo,%c1_str1:��_��=a%
goto :eof
  rem ��һ��call end
rem ---------------------------������ end
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit