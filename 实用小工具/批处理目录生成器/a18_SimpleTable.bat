@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem �����ݱ��ȡ
rem һ����ĸ�ʽ
rem 
rem ::��ǩ
rem ����;����;����;����...
rem ����;����;����;����...
rem ...
rem ::��ǩ_end
rem 
rem ��������˵��
rem 1�����ݵ�����û�����ƣ��������ֻ����8��
rem 2�������в����������ַ�[^&%;|<>"]������ڴ洢���ġ����֡���ĸ����
rem 
rem 
rem �������÷���
rem call a18_SimpleTable.bat ���ļ���·�� ::��ǩ �������ݵı��� 
rem 
rem �ġ������÷�
rem ��������               %���ܱ���.list[]%
rem ��5�е�m�е�ֵ         %���ܱ���.list[5].����%
rem
rem �塢ʹ�÷�Χ
rem 8�����µı�ṹ��������Ϊ���ġ����֡���ĸ
rem 
rem ����ʹ������
rem a18_SimpleTableEp1.bat
rem 
set a18_Table.path="%~1"
set a18_Table.biaoqian=%2
set a18_Table.var=%3






set a18_Table.load=
set a18_Table.load.title=
set a18_Table.num=0
set a18_Table.title=

set a18_Table.columns[]=0

for /f "usebackq tokens=* delims=" %%i in (%a18_Table.path%) do (
	if "%%~i"=="%a18_Table.biaoqian%_end" goto :a18_Table.loadend
	if defined a18_Table.load (
		call :a18_main %%i
	)
	if "%%~i"=="%a18_Table.biaoqian%" set a18_Table.load=on	
)
:a18_Table.loadend
set %a18_Table.var%.list[]=%a18_Table.num%

goto :eof





::һ��c
rem ----------------------------------------------------------һ��c
:a18_Table.loadcolumn
set /a a18_Table.columns[]=%a18_Table.columns[]%+1
set a18_Table.columns[%a18_Table.columns[]%]=%1

goto :eof
:a18_main

if not defined a18_Table.title (
	set a18_Table.title=in
	for %%i in (%*) do (
		call :a18_Table.loadcolumn %%i
	)

	goto :eof


)

set /a a18_Table.num=%a18_Table.num%+1
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[1]%=%1
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[2]%=%2
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[3]%=%3
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[4]%=%4
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[5]%=%5
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[6]%=%6
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[7]%=%7
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[8]%=%8
goto :eof

rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c end
::�Ĳ�c end
::���c
rem ----------------------------------------------------------���c
rem ----------------------------------------------------------���c end
::���c end
rem ----------------------------------------------------------������ end
::������ end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:������
���ļ������� ��:
���ļ�����   ��:
������˵��   ��:
%1��%2����������
::����˵�� end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
