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
for %%i in (%pathly%) do (
set pathly="%%~i"
set pathmb="%%~dpi"
set name="%%~ni"
set type="%%~xi"
)
if %pathly%=="exit" goto exit
set pathly=%pathly:^=^^%
set pathly=%pathly:&=^&%
set pathly=%pathly:|=^|%
set pathly=%pathly:"=%
set pathmb=%pathmb:^=^^%
set pathmb=%pathmb:&=^&%
set pathmb=%pathmb:|=^|%
set pathmb=%pathmb:"=%
set name=%name:^=^^%
set name=%name:&=^&%
set name=%name:|=^|%
set name=%name:"=%
set type=%type:^=^^%
set type=%type:&=^&%
set type=%type:|=^|%
set type=%type:"=%
cls
popd
goto :eof
exit
rem ----------------------------------------------------------һ��all
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
��ÿ��������û����������ס����˵��������������ַ�ʱ��"%����%"����ʽ������ȷ��ʾ·����
pathmb��\��β
rem ----------------------------------------------------------�ű�˵�� end