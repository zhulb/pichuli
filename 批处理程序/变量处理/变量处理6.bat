@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
if not defined pathly popd&goto :eof
set pathly="%pathly%"
set pathly=%pathly:ת_��=^^%
set pathly=%pathy:��_��=^&%
set pathly=%pathly:��_��=^|%
set pathly=%pathly:С_��=^<%
set pathly=%pathly:��_��=^>%
set pathly=%pathly:��_̾=!%
set pathly=%pathly:"=%
popd
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
rem ----------------------------------------------------------�ű�˵��
������pathly�еı�ǻ���ԭ���������ַ�,��Ӧ��'��������5.bat'
rem ----------------------------------------------------------�ű�˵�� end