@echo off
set result=
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
set pathly="%pathly:"=��_��%"
set pathly=%pathly:^=^^^^^^^^%
set pathly=%pathly:&=^^^^^^^&%
set pathly=%pathly:|=^^^^^^^|%
set pathly=%pathly:<=^^^^^^^<%
set pathly=%pathly:>=^^^^^^^>%
set pathly=%pathly:"=%
if "%pathly:~-1%"=="\" (
set result=qdq
)else (
set result=pt
)
set pathly=%pathly:��_��=^^^"%
set pathly=%pathly%
goto :eof
exit
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
rem ----------------------------------------------------------�ű�˵��
set /p pathly=
������������G�̵�������ʱ������ֵΪG:\�������ļ�����'G:\�½��ļ���'��������ʱ,����ֵΪG:\�½��ļ��У�ǰ���ĩβ��'\'���������û�С�
result=qdq��ʾpathlyĩβΪ'\'������ĩβ����'\'
rem ----------------------------------------------------------�ű�˵�� end

