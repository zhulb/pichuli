@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set pathly=%name%
call ��������\��������.bat 1 1
call ��������\��������.bat 1 1
set message=^
&echo,%pathly%
:begin
cls
pushd "%~dp0"
if not exist ·������\��ȡ·��.bat (
echo,
echo,ȱ���ļ�
ping /n 2 127.1>nul
goto exit
)
call ·������\��ȡ·��.bat 1 1
set "num=һ�����������߰˾�ʮ"
if "%pathly%"=="exit" goto exit
echo,^">����.txt
if exist "%pahtmb%%name%.htm" del /q /s "%pahtmb%%name%.htm"
copy ��ҳͷ����\��ҳͷ����2.zlb "%pathmb%%name%.htm"
set "act=off"
set id=1
set idnum=0
for /f "usebackq tokens=1,2,* delims= " %%i in ("%pathly%") do (
echo,%%i>i.txt
echo,%%j>j.txt
echo,%%k>k.txt
call :���뵽��ʱ�ı�2 "%%i" "%%j" "%%k"
call :main "%%i" "%%j" "%%k"
)
del /q /s ��ʱ�ı�.txt ��ʱ�ı�2.txt i.txt j.txt k.txt ����.txt
cls
echo,���,��������
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
rem ----------------------------------------------------------һ��call
:���뵽��ʱ�ı�2
rem -----------------------------------------------------------������echo,���ض���,����д��ȷ�����λ�ñ����ڵ�һ��
(set /p="<p>%id%��<a title=" <nul)>��ʱ�ı�2.txt
for /f "tokens=* delims= " %%i in (����.txt) do (
(set /p="%%i" <nul)>>��ʱ�ı�2.txt
)
for /f "tokens=* delims= " %%i in (k.txt) do (
(set /p="%%i" <nul)>>��ʱ�ı�2.txt
)
for /f "tokens=* delims= " %%i in (����.txt) do (
(set /p="%%i" <nul)>>��ʱ�ı�2.txt
)
for /f "tokens=* delims= " %%i in (j.txt) do (
(set /p="href="http://%%i">" <nul)>>��ʱ�ı�2.txt
)
for /f "tokens=* delims= " %%i in (i.txt) do (
(set /p="%%i</a></p>" <nul)>>��ʱ�ı�2.txt
)
goto :eof
:main
echo, %1 %2 %3
if "%~1"==":::" set "act=off"
if "%~1"=="::" set "act=off"
if "%act%"=="on" call :���� %1 %2 %3
if "%~1"=="::" call :���� %idnum% %2
goto :eof
rem ----------------------------------------------------------һ��call end
rem ----------------------------------------------------------����call
:����
set "act=on"
setlocal EnableDelayedExpansion
(echo,!num:~%1,1!
)>��ʱ�ı�.txt
endlocal
for /f "tokens=* delims= " %%i in (��ʱ�ı�.txt) do (
set fenlei=%%i
)
echo,>>"%pathmb%%name%.htm"
(set /p="<p>%fenlei%��" <nul)>>"%pathmb%%name%.htm"
for /f "tokens=* delims= " %%i in (j.txt) do (
(set /p="%%i</p>" <nul)>>"%pathmb%%name%.htm"
)
set /a idnum=%idnum%+1
goto :eof
:����
echo,>>"%pathmb%%name%.htm"
type ��ʱ�ı�2.txt>>"%pathmb%%name%.htm"
set /a id=%id%+1
goto :eof
rem ----------------------------------------------------------����call end
