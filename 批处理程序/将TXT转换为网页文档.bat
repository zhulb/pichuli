@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
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
type ��ҳͷ����\��ҳͷ����.zlb>"%pathmb%\%name%".htm
for /f "usebackq tokens=* delims= " %%i in ("%pathmb%\%name%.txt") do (
>>"%pathmb%\%name%".htm echo,^<p^>^<font color="#9900FF"^>%%i^</font^>^</p^>
)
echo,���
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
