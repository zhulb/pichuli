@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
if "%2"=="1" (
if defined message (
echo,%message%
)
)
rem �����濪ʼд����
call ��������\��������10.bat 1 1 %3
call ��������\��������10.bat 1 1 %4
set str3.1=%3
set str3.2=%4
setlocal EnableDelayedExpansion
set str3.3=!%str3.2%!
set str3.4=!%str3.1%:a=��_��!
set str3.4=!str3.4:%str3.3%=a!
set i=1
set str3.6=a
set str3.5=b
>%str3.6%.txt echo,!str3.4!
:back
set act=
for /f "tokens=1,* delims=a" %%i in (%str3.6%.txt) do (
if defined act (
>>%str3.5%.txt echo,%%i
>>%str3.5%.txt echo,%%j
)else (
>%str3.5%.txt echo,%%i
>>%str3.5%.txt echo,%%j
set act=on
)
)
set md=%str3.6%
set str3.6=%str3.5%
set str3.5=%md%
set /a i=%i%+1
if not %i% equ 15 goto back
cd.>c.txt
for /f "tokens=*" %%i in (a.txt) do (
>>c.txt echo,%%i
)
endlocal
cd.>d.txt
for /f "tokens=*" %%i in (c.txt) do (
set str3.1=%%i
call :main
)
popd
set str3.1=
set str3.2=
set str3.3=
set str3.6=
set str3.5=
set str3.4=
goto :eof
rem ----------------------------------------------------------һ��goto
:exit
if exist pathly.zlb del /q /s pathly.zlb
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
rem ----------------------------------------------------------һ��call
:main
call ��������\��������11.bat 1 1 str3.1
>>d.txt echo,%str3.1:��_��=a%
goto :eof
rem ----------------------------------------------------------һ��call end
rem ----------------------------------------------------------���������
����:
3
ʹ�÷���:
str3.1��str3.2 ...
������еı���ֻ���ٱ�������ʹ��
rem ----------------------------------------------------------��������� end
rem ----------------------------------------------------------�ű�˵��
���ָ�������Ϊ%3��ֵ���洢�ָ����ı�����Ϊ%4��ֵ���ָ��������d.txt��
ע��:������Ϊ%3�ı����������ַ����˱�ǣ���û�л�ԭ,������ǰ��������������߽���ǸĻ���
rem ----------------------------------------------------------�ű�˵�� end
