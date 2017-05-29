@echo off
set arr[1]=d
set arr[2]=e
set arr[3]=f
set arr[4]=h
set arr[].length=4

set tempdir=获取所有exe路径
set log=所有exe路径.txt

for /l %%i in (1,1,%arr[].length%) do (
	call :main %%arr[%%i]%%
)
pause
exit


rem 根据驱动器盘符获取驱动器内所有的exe文件路径API
rem 
:main
set panfu=%1
echo,%panfu%
for /f "tokens=*" %%i in ('dir /b/s %panfu%:\*.exe') do (
	echo,%%i
)
goto :eof

