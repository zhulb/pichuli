@echo off
pushd ..
popd
set D30_debugger=
set D30_message="%~n0"
set D30_pathmb="%~dp0"
set D30_pathmb=%D30_pathmb:~0,-4%
pushd %D30_pathmb%
::主代码
rem ----------------------------------------------------------主代码
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
::一层c
rem ----------------------------------------------------------一层c
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
	if defined D30_debugger (echo,debugger_module:删除文件夹)	
) else if "%D30_pathExist%"=="wj" (
	echo,del %D30_deleteFile.showPathWithYh%
	if not defined D30_debugger (del %D30_deleteFile.showPathWithYh%)
	if defined D30_debugger (echo,debugger_module:删除文件)
) else if "%D30_pathExist%"=="notExist" (
	echo,路径不存在 %D30_deleteFile.showPathWithYh%
)
goto :eof
::D30_userData
D:\app\批处理\批处理程序\D\D30_test &^_ fae%
::D30_userData_end

::函数1

::函数1 end
::函数2

::函数2 end
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:调用
【文件功能类 】:
【文件名称   】:
【使用方法	 】:
在::D30_userData和::D30_userData_end之间添加要清空文件夹的全路径
如
D:\folder1
D:\folder2

如果遇到畸形文件夹则使用畸形文件强制删除脚本
::属性说明 end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------主代码 end
::主代码 end
