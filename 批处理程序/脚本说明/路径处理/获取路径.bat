@echo off
cls
pushd "%~dp0"
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
if "%2"=="1" (
if defined message (
echo,%message%
)
)
echo,
echo,-----------------�˳�:����exit(Ĭ��)
echo,
set pathly=exit
set /p pathly=·��: 
set pathly="%pathly:"=%"
set pathly=%pathly:!=��_̾_��%
setlocal EnableDelayedExpansion
set pathly=!pathly:%%=%%%%!
>pathly.zlb echo,!pathly!
endlocal
for /f "tokens=*" %%i in (pathly.zlb) do (
set pathly=%%i
)
set pathly=%pathly:��_̾_��=!%
if exist pathly.zlb del /q /s pathly.zlb
call :��ȡԴ��Ϣ %pathly%
if "%pathly%"=="exit" goto exit
cls
popd
goto :eof
exit
rem ----------------------------------------------------------һ��all
:��ȡԴ��Ϣ
set pathly="%~1"
set pathly=%pathly:&=^&%
set pathly=%pathly:|=^|%
set pathmb="%~dp1"
set pathmb=%pathmb:&=^&%
set pathmb=%pathmb:|=^|%
set name="%~n1"
set name=%name:&=^&%
set name=%name:|=^|%
set type="%~x1"
set type=%type:&=^&%
set type=%type:|=^|%
set pathly=%pathly:"=%
set pathmb=%pathmb:"=%
set name=%name:"=%
set type=%type:"=%
goto :eof)
rem ----------------------------------------------------------һ��call end
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
�������%pathly%��%pathmb%��%name%��%type%
���������ַ�ʱ��"%pathly%"������ȷ������ֵ
pathmb��\��β
rem ----------------------------------------------------------�ű�˵�� end