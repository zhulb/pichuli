@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������

rem ***********
rem **@description ���ó���
rem **@changliang.lowLetter Сд��ĸ
rem **@changliang.upLetter ��д��ĸ
rem **@changliang.
rem ***********
set a35_changliang.lowLetter=0
set a35_changliang.upLetter=1

rem ***********
rem **@description ���÷���
rem **@arg %1 ���õķ���
rem **@arg %2��%3... ��������
rem ***********
call :a35_%1 %*
call a33_clearvar.bat a35_ 1
goto :eof

::һ��c
rem ----------------------------------------------------------һ��c
rem ************
rem **@author zliangbing
rem **@date 20/3/15
rem **@description ��ȡСд��ĸ����
rem **@arg %1 ��������
rem ************
:a35_getLowLetterArr
shift
set a35_getLowLetterArr.arrname=%1
set a35_getLowLetterArr.lowLetter=abcdefghijklmnopqrstuvwxyz
for /l %%i in (0,1,25) do (
	call :a35_getLowLetterArr.setArr %%a35_getLowLetterArr.lowLetter:~%%i,1%% %%i
)
goto :eof

rem ************
rem **@author zliangbing
rem **@date 20/3/15
rem **@description ��ȡ��д��ĸ����
rem **@arg %1 ��������
rem ************
:a35_getUpLetterArr
shift
set a35_getUpLetterArr.arrname=%1
set a35_getUpLetterArr.upLetter=ABCDEFGHIJKLMNOPQRSTUVWXYZ
for /l %%i in (0,1,25) do (
	call :a35_getUpLetterArr.setArr %%a35_getUpLetterArr.upLetter:~%%i,1%% %%i
)
goto :eof

rem ************
rem **@author zliangbing
rem **@date 20/3/15
rem **@description ��ȡָ������ĸ����
rem **@arg %1 ��������
rem **@arg %2 ָ����������
rem ************
:a35_getLetterArr
shift
set a35_getLetterArr.arrname=%1
if "%2"=="0" (
	set a35_getLetterArr.letter=abcdefghijklmnopqrstuvwxyz
	set a35_setLetterArr.letter.index=25
)
if "%2"=="1" (
	set a35_getLetterArr.letter=ABCDEFGHIJKLMNOPQRSTUVWXYZ
	set a35_setLetterArr.letter.index=25
)
if "%2"=="3" (
	set a35_getLetterArr.letter=0123456789
	set a35_setLetterArr.letter.index=9
)
if "%2"=="4" (
	set a35_getLetterArr.letter=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%%^^^&^(^)^_+=-~`[]\{}^|����\;':
	set a35_setLetterArr.letter.index=88
)
for /l %%i in (0,1,%a35_setLetterArr.letter.index%) do (
	call :a35_getLetterArr.setArr "%%a35_getLetterArr.letter:~%%i,1%%" %%i
)
goto :eof

:a35_stringPianYi

goto :eof
rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
:a35_getLowLetterArr.setArr
set %a35_getLowLetterArr.arrname%[%2]=%1
goto :eof

:a35_getUpLetterArr.setArr
set %a35_getUpLetterArr.arrname%[%2]=%1
goto :eof

:a35_getLetterArr.setArr
for %%i in (%1) do (
	set %a35_getLetterArr.arrname%[%2]=%%~i
)
goto :eof

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
