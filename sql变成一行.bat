@echo off
rem 
rem ˵��
rem Ҫ��sql�е�"	"����" "���������Ҫ��^��ת�壬Ȼ��ȫ�����ƽ��������������end����


rem API
rem �ռ�����
rem data[0]��data[1]��data[2]...data[].length
call :getData data

set data

call :createFile data %data[].length% "result.txt"
pause
exit


:getData
if not defined getData.index (
	set getData.index=0
) else (
	set /a getData.index=%getData.index%+1
)
set /p getData.data=
if not "%getData.data:"=%"=="end" (
	set %1[%getData.index%]=%getData.data%
	goto :getData
)



set %1[].length=%getData.index%
goto :eof

:createFile
cd.>%3
set createFile.file=%3
for /l %%i in (0,1,%2) do (
	call :createFile_echo %%%1[%%i]%%
)
goto :eof
:createFile_echo
echo,%*
set /p=%* <nul >>%createFile.file%
:goto :eof