@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
if not defined pathly popd&goto :eof
set pathly="%pathly:"=��_��%"
set pathly=%pathly:^=^^^^^^^^%
set pathly=%pathly:&=^^^^^^^&%
set pathly=%pathly:|=^^^^^^^|%
set pathly=%pathly:<=^^^^^^^<%
set pathly=%pathly:>=^^^^^^^>%
set pathly=%pathly:"=%
set pathly=%pathly:��_��=^^^"%
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
�Ա���pathly���д���,�����ʹ�ô���echo,%pathly%�ܹ���ʾpathlyԭ����ֵ,��Ҳ������set pathly=%pathly%��ʹ������ԭ.
rem ----------------------------------------------------------�ű�˵�� end