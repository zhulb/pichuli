@echo off
cls
pushd "%~dp0"
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
if defined message (
echo,%message%
)
rem ������д������
echo,
echo,���ڽ�ѹ"%pathly%"...
start /wait "" winrar.exe x -p"%passward%" "%pathly%" "%pathmb%"
goto :eof
exit
rem ----------------------------------------------------------һ��goto
:exit
if exist pathly.zlb del /q /s pathly.zlb
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end

