@echo off
pushd ..
popd
set D41_debugger=
set D41_message="%~n0"
set D41_pathmb="%~dp0"
set D41_pathmb=%D41_pathmb:~0,-4%
pushd %D41_pathmb%
::主代码
rem ----------------------------------------------------------主代码
if "%~1"=="" (
	echo,请拖动需要清空的文件夹到批处理上。
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
::一层c
rem ----------------------------------------------------------一层c
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
	if defined D41_debugger (echo,debugger_module:删除文件夹)	
) else if "%D41_pathExist%"=="wj" (
	echo,del %D41_deleteFile.showPathWithYh%
	if not defined D41_debugger (del %D41_deleteFile.showPathWithYh%)
	if defined D41_debugger (echo,debugger_module:删除文件)
) else if "%D41_pathExist%"=="notExist" (
	echo,路径不存在 %D41_deleteFile.showPathWithYh%
)
goto :eof

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
在::D41_userData和::D41_userData_end之间添加要清空文件夹的全路径
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
