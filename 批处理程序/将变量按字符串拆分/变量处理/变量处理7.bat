@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
if not defined %3 popd&goto :eof
set str=%3
setlocal EnableDelayedExpansion
set %str%=!%str%:"=��_��!
set %str%=!%str%:^^=ת_��!
set %str%=!%str%:^&=��_��!
set %str%=!%str%:^|=����!
set %str%=!%str%:^>=����!
set %str%=!%str%:^<=С��!
set %str%=!%str%:%%=��_��_��!
>str.txt echo,!%str%!
endlocal
for /f "tokens=*" %%i in (str.txt) do (
set %str%=%%i
)
popd
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
�������,������Ϊ����%3��ֵ������������Ϊstr�������е������ַ��������Ӧ�ı�Ƿ�
rem ----------------------------------------------------------�ű�˵�� end