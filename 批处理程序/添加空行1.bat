@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,�����м����һ����,�������ԭ���Ŀ���
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
cd.>"%pathmb%��ʱ�ļ�.txt"
for /f "tokens=1,* delims=:" %%i in ('findstr /n ".*" "%pathly%"') do (
>>"%pathmb%��ʱ�ļ�.txt" echo,%%j
>>"%pathmb%��ʱ�ļ�.txt" echo,
)
del /q /s "%pathly%"
ren "%pathmb%��ʱ�ļ�.txt" "%name%%type%"
goto begin
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
rem ȱ��:�Ὣ���׵�":""::"":::"...��ȥ��