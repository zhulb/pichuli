@echo off
pushd ..
popd
set D30_debugger=
set D30_message="%~n0"
set D30_pathmb="%~dp0"
set D30_pathmb=%D30_pathmb:~0,-4%
pushd %D30_pathmb%
::������
rem ----------------------------------------------------------������
set D30_Table.path="%~0"
set D30_Table.name=D30_userData
set D30_Table.var=user
set D30_Table.load=
set D30_Table.num=0
set D30_clear_folder=
set D30_clear_folder_dir=
for /f "usebackq tokens=*" %%i in (%D30_Table.path%) do (
	if "%%~i"=="::%D30_Table.name%_end" goto :D30_Table.loadend
	if defined D30_Table.load (
		set D30_clear_folder=%%~i
		set D30_clear_folder_dir="%%~i"
		call :main
	)
	if "%%~i"=="::%D30_Table.name%" set D30_Table.load=on	
)
:D30_Table.loadend
echo,finish!
pause
exit
::һ��c
rem ----------------------------------------------------------һ��c
:main
call a\a38_pathCopy.bat D30_clear_folder D30_clear_folder
set D30_deleteFile=
for /f "tokens=*" %%i in ('dir /b "%D30_clear_folder.truePathWithoutYh%"') do (
	set D30_deleteFile="%D30_clear_folder.truePathWithoutYh%\%%~i"
	call :D30_delete
)
goto :eof
:D30_delete
set D30_pathExist=
call a\a38_pathCopy.bat D30_deleteFile D30_deleteFile
rem call a\a37_pathCheck.bat D30_deleteFile.truePathWithoutYh D30_pathExist
rem call a\a37_pathCheck.bat D30_deleteFile.truePathWithoutYh D30_pathExist
call a\a37_pathCheck.bat D30_deleteFile.showPathWithYh D30_pathExist
if "%D30_pathExist%"=="wjj" (
	echo,rd /q/s %D30_deleteFile.showPathWithoutYh%
	if not defined D30_debugger (rd /q/s %D30_deleteFile.showPathWithYh%)
	if defined D30_debugger (echo,debugger_module:ɾ���ļ���)	
) else if "%D30_pathExist%"=="wj" (
	echo,del %D30_deleteFile.showPathWithYh%
	if not defined D30_debugger (del %D30_deleteFile.showPathWithYh%)
	if defined D30_debugger (echo,debugger_module:ɾ���ļ�)
) else if "%D30_pathExist%"=="notExist" (
	echo,·�������� %D30_deleteFile.showPathWithYh%
)
goto :eof
::D30_userData
D:\app\������\���������\D\D30_test &^_ fae%
::D30_userData_end

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
��::D30_userData��::D30_userData_end֮�����Ҫ����ļ��е�ȫ·��
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
