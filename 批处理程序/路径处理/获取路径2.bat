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
if %pathly%=="exit" goto exit
for /f "tokens=*" %%i in (%pathly%) do (
set pathly="%%~i"
call :pathly
set pathmb="%%~dpi"
call :pathmb
set name="%%~ni"
call :name
set type="%%~xi"
call :type
)
popd
goto :eof
exit
rem ----------------------------------------------------------call1
:pathly
set pathly=%pathly:^=^^%
set pathly=%pathly:&=^&%
set pathly=%pathly:|=^|%
set pathly=%pathly:"=%
goto :eof
:pathmb
set pathmb=%pathmb:^=^^%
set pathmb=%pathmb:&=^&%
set pathmb=%pathmb:|=^|%
set pathmb=%pathmb:"=%
goto :eof
:name
set name=%name:^=^^%
set name=%name:&=^&%
set name=%name:|=^|%
set name=%name:"=%
goto :eof
:type
set type=%type:^=^^%
set type=%type:&=^&%
set type=%type:|=^|%
set type=%type:"=%
goto :eof
rem ----------------------------------------------------------call1 end
rem ----------------------------------------------------------goto1
:exit
if exist pathly.zlb del /q /s pathly.zlb
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto1 end
rem ----------------------------------------------------------�ű�˵��
�������%pathly%��%pathmb%��%name%��%type%
���������ַ�ʱ��"%pathly%"������ȷ������ֵ
pathmb��\��β
rem ----------------------------------------------------------�ű�˵�� end