@echo off
pushd ..
popd
set D41_debugger=
set D41_message="%~n0"
set D41_pathmb="%~dp0"
set D41_pathmb=%D41_pathmb:~0,-4%
pushd %D41_pathmb%
::������
rem ----------------------------------------------------------������
if "%~1"=="" (
	echo,���϶���Ҫ��յ��ļ��е��������ϡ�
	pause
	exit
)
set D41_Table.name=D41_userData
set D41_Table.var=user
set D41_Table.load=
set D41_Table.num=0
set D41_clear_folder=
set D41_clear_folder_dir=
set D41_clear_folder="%~1"
call :main
echo,finish!
pause
exit
::һ��c
rem ----------------------------------------------------------һ��c
:main
call a\a38_pathCopy.bat D41_clear_folder D41_clear_folder
set D41_deleteFile=
for /f "tokens=*" %%i in ('dir /b "%D41_clear_folder.truePathWithoutYh%"') do (
	set D41_deleteFile="%D41_clear_folder.truePathWithoutYh%\%%~i"
	call :D41_delete
)
goto :eof
:D41_delete
set D41_pathExist=
call a\a38_pathCopy.bat D41_deleteFile D41_deleteFile
rem call a\a37_pathCheck.bat D41_deleteFile.truePathWithoutYh D41_pathExist
rem call a\a37_pathCheck.bat D41_deleteFile.truePathWithoutYh D41_pathExist
call a\a37_pathCheck.bat D41_deleteFile.showPathWithYh D41_pathExist
if "%D41_pathExist%"=="wjj" (
	echo,rd /q/s %D41_deleteFile.showPathWithoutYh%
	if not defined D41_debugger (rd /q/s %D41_deleteFile.showPathWithYh%)
	if defined D41_debugger (echo,debugger_module:ɾ���ļ���)	
) else if "%D41_pathExist%"=="wj" (
	echo,del %D41_deleteFile.showPathWithYh%
	if not defined D41_debugger (del %D41_deleteFile.showPathWithYh%)
	if defined D41_debugger (echo,debugger_module:ɾ���ļ�)
) else if "%D41_pathExist%"=="notExist" (
	echo,·�������� %D41_deleteFile.showPathWithYh%
)
goto :eof

::����1

::����1 end
::����2

::����2 end
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
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:����
���ļ������� ��:
���ļ�����   ��:
��ʹ�÷���	 ��:
��::D41_userData��::D41_userData_end֮�����Ҫ����ļ��е�ȫ·��
��
D:\folder1
D:\folder2

������������ļ�����ʹ�û����ļ�ǿ��ɾ���ű�
::����˵�� end
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------������ end
::������ end
