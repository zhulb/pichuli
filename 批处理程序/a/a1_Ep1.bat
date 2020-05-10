@echo off
pushd ..
rem 一、功能说明 将数字转换成中文  数字的范围为1-99
rem 二、调用方法
rem 第一个无意义，第二个参数选择中文样式，0-一二的写法，1-壹贰的写法，第三个参数表示要变量名，变量值为1-99的一个数字
rem 三、结果调用
rem 结果保存a1_result环境变量中
rem 
for /l %%i in (1,1,99) do (
	set num=%%i
	call a/a1_.bat 1 0 num
	call :echo
)
pause
exit
:echo
set a1_result
goto :eof