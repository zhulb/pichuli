@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
call :a13_main1 "%%%3:"=%%"
cd.>a13_����Ϣ.txt
cd.>a13_call��Ϣ.txt
cd.>a13_call��Ϣ2.txt
if not exist %a13_pathly% (
echo,
echo,����!
echo,
echo,%a13_pathly%������!
ping /n 2 127.1>nul
goto :eof
)
for /f "tokens=*" %%i in ('findstr /n "call" %a13_pathly%') do (
>>a13_����Ϣ.txt echo,%%i
)
set a13_str1= 
for /f "tokens=1,* delims=:" %%i in (a13_����Ϣ.txt) do (
rem echo,��%%i��
set /p=%%i <nul
set a13_str3=%%i
set a13_str4=%%j
call a\a5_�������1.bat 1 1 a13_str4 a13_str1
call :a13_main2
)
set a13_act=
for /f "tokens=1,* delims= " %%i in (a13_call��Ϣ.txt) do (
set a13_str5=%%j
call :a13_main3
if defined a13_act (
>>a13_call��Ϣ2.txt echo,%%i %%j
set a13_act=
)
)
cd.>a13_call��Ϣ3.txt
if exist a13_��ʱ�ļ��� rd /q/s a13_��ʱ�ļ���
md a13_��ʱ�ļ���
for /f "tokens=1,*" %%i in (a13_call��Ϣ2.txt) do (
set a13_str6=%%~nj
set a13_str7=%%~j
call :a13_main4
)
echo,
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
:a13_main1
set a13_pathly=%1
goto :eof
:a13_main2
set a13_act=
for /f "tokens=*" %%i in (a5_d.txt) do (
if defined a13_act (
>>a13_call��Ϣ.txt echo,%a13_str3% %%i
set a13_act=
)
if "%%i"=="call" set a13_act=on
)
goto :eof
:a13_main3
call a\a8_�������.bat 1 1 a13_str5
if not "%a13_str5:~0,1%"==":" set a13_act=on
goto :eof
:a13_main4
set a13_str4.1=_
call a\a5_�������1.bat 1 1 a13_str6 a13_str4.1
for /f "tokens=*" %%i in (a5_d.txt) do (
set a13_str4.2=%%i
goto a13_finish4.1
)
:a13_finish4.1
if not exist a13_��ʱ�ļ���\%a13_str4.2%.txt (
>>a13_call��Ϣ3.txt echo,%a13_str7% %a13_str4.2%
cd.>a13_��ʱ�ļ���\%a13_str4.2%.txt
)
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
