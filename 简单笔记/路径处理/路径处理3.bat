@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
set pathly="%pathly:"=%"
for %%i in (%pathly%) do (
set pathly="%%~i
set pathmb="%%~dpi
set name="%%~ni
set type="%%~xi
)
set pathly=%pathly:^=^^^^%
set pathly=%pathly:&=^^^&%
set pathly=%pathly:|=^^^|%
set pathly=%pathly:"=%
set pathmb=%pathmb:^=^^^^%
set pathmb=%pathmb:&=^^^&%
set pathmb=%pathmb:|=^^^|%
set pathmb=%pathmb:"=%
set name=%name:^=^^^^%
set name=%name:&=^^^&%
set name=%name:|=^^^|%
set name=%name:"=%
set type=%type:^=^^^^%
set type=%type:&=^^^&%
set type=%type:|=^^^|%
set type=%type:"=%
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
�Ա���pathly���д���
�������%pathly%��%pathmb%��%name%��%type%
%pathly%���ܵ�����ֵ
pathmb��\��β
��·������2.bat�������汾
rem ----------------------------------------------------------�ű�˵�� end