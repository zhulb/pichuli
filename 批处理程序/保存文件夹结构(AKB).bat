@echo off
set pathly="%~0"
set act=on
(2>nul call ·������\·������2.bat 1 1)||(echo,&echo,ȱ���ļ�"·������\·������2.bat"&ping /n 4 127.1>nul&set act=off)
if "%act%"=="on" (
call :a
)else (
set act=on
)
:begin
cls
(2>nul call ·������\��ȡ·��4.bat 1 1)||(echo,&echo,ȱ���ļ�"·������\��ȡ·��4.bat 1 1"&ping /n 4 127.1>nul&set act=off)
if "%act%"=="off" (
goto exit
)
rem ---------------�����濪ʼд����
set act=on
(2>nul call �ж�·�����ļ������ļ���\�ж�·�����ļ������ļ���.bat 1 0)||(echo,&echo,ȱ���ļ�"·�ж�·�����ļ������ļ���\�ж�·�����ļ������ļ���.bat"&ping /n 4 127.1>nul&set act=off)
if "%act%"=="off" (
goto exit
)
call �ж�·�����ļ������ļ���\�ж�·�����ļ������ļ���.bat 1 1
if "%result%"=="wj" (
echo,
echo,Ŀ�����ļ���
ping /n 2 127.1>nul
goto begin
)
set str10.1="AKB�糡�����ļ���\STAGES ���`��A" "AKB�糡�����ļ���\STAGES ���`��K" "AKB�糡�����ļ���\STAGES ���`��B" "AKB�����ļ���" "�ɤ������ߤ�꠵����ļ���" "AKB AX"
cd.>"%pathly%\�ļ�������.bat"
>>"%pathly%\�ļ�������.bat" echo,@echo off
>>"%pathly%\�ļ�������.bat" echo,set file=%str10.1%
set act=
for /f "usebackq tokens=*" %%i in ("%~0") do (
if "%%i"=="::����10.1 end" goto finish10.1
if defined act (
>>"%pathly%\�ļ�������.bat" echo,%%i
) 
if "%%i"=="::����10.1" set act=on
)
:finish10.1
for %%i in (%str10.1%) do (
set str10.2=%%~i
call :main
)
echo,
echo,���!
ping /n 4 127.1>nul
goto begin
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
rem ----------------------------------------------------------����goto

rem ----------------------------------------------------------����goto end
rem ----------------------------------------------------------һ��call
:main
call ��������\��������8.bat 1 1 str10.2
>>"%pathly%\�ļ�������.bat" echo,::%str10.2%
set str10.2=%str10.2%
if exist "%pathly%\%str10.2%" (
call :main2
)
call ��������\��������8.bat 1 1 str10.2
>>"%pathly%\�ļ�������.bat" echo,::%str10.2% end
set str10.2=%str10.2%
goto :eof
:a
title %name%
set name=%name%
set message=^
&echo,"%name%"
goto :eof
rem ----------------------------------------------------------һ��call end
rem ----------------------------------------------------------����call
:main2
for /f "tokens=*" %%i in ('dir /ad/b "%pathly%\%str10.2%"') do (
>>"%pathly%\�ļ�������.bat" echo,%%i
)
goto :eof
rem ----------------------------------------------------------����call end
rem ----------------------------------------------------------���������
����:
10
ʹ�÷���:
*����.1��*����.2 ...
������еı���ֻ���ٱ�������ʹ��(�����Ϊ1ʱ��str1.1��str1.2 ...)
rem ----------------------------------------------------------��������� end
rem ----------------------------------------------------------�����ض�������
::����10.1
for %%a in (%file%) do (
call :setup %%~a
)
echo,&echo,���
pause>nul
exit
:setup
echo,%*
set "act="
rem ----------ע��:set "act=" ɾ���˻�������act
for /f "usebackq tokens=* eol=" %%a in ("%~nx0") do (
if "%%a"=="::%* end" (goto :eof)
  if defined act (
  if not exist "%*\%%a" (
  md "%*\%%a"
  )
  )
  if "%%a"=="::%*" set act=act
)
pause>nul
exit
::����10.1 end
rem ----------------------------------------------------------�����ض������� end
rem ----------------------------------------------------------�ű�˵��

rem ----------------------------------------------------------�ű�˵�� end