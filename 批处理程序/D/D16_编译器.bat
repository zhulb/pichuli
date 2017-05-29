@echo off
set D16_message="%~n0"
set D16_pathmb="%~dp0"
set D16_pathmb=%D16_pathmb:~0,-4%"
pushd %D16_pathmb%
::主代码
rem ----------------------------------------------------------主代码
rem 一、创建临时文件夹
rem 
set message=编译器
if exist D16_临时文件夹 rd /q/s D16_临时文件夹
md D16_临时文件夹

rem 二、获取编译文件的路径
call a\a2_获取路径.bat 1 1 0 1

rem 三、变量：【编译】xxx.bat
set D16_name_type="【编译】%a2_name%%a2_type%"
rem 去除引号
for %%i in (%D16_name_type%) do (
	set D16_name_type=%%~i
)

rem 四、获取全部相关的批处理文件
rem 结果放在【汇总.txt】
cls
rem 初始化
cd.>D16_临时文件夹\汇总.txt
call :D16_main2  a2_pathly
rem 保存路径、标号
>>D16_临时文件夹\汇总.txt echo,"%a2_pathly%" %D16_main2.2%
rem 保存路径（需要分析的批处理文件）
>D16_临时文件夹\目录.txt echo,"%a2_pathly%"
rem 开始获取相关的批处理文件
echo,【第一次匹配...
call :D16_main3
echo,【第二次匹配...
call :D16_main3
echo,【第三次匹配...
call :D16_main3
echo,【第四次匹配...
call :D16_main3
echo,【第五次匹配...
call :D16_main3
echo,【第六次匹配...
call :D16_main3
echo, 完成匹配

rem 五、【汇总.txt】中保存所有相关的批处理文件，将这些文件复制到临时文件夹中
for /f "tokens=1,*" %%i in (D16_临时文件夹\汇总.txt) do (
	echo,RRRRRRRRRRRRRRRRRRRRRRRRRR %%i
	copy %%i D16_临时文件夹
)

rem 六、创建目标文件，并将所有的文件的内容复制进去
rem 
cd.>"D16_临时文件夹\%D16_name_type%"

rem 汇总.txt中第一行保存的文件不需要设置标号，这个文件就是需要编译的文件
set D16_act1=
for /f "tokens=1,*" %%i in (D16_临时文件夹\汇总.txt) do (
	if defined D16_act1 (
		>>"D16_临时文件夹\%D16_name_type%" echo,
		>>"D16_临时文件夹\%D16_name_type%" echo,
		>>"D16_临时文件夹\%D16_name_type%" echo,:%%j
	)
	>>"D16_临时文件夹\%D16_name_type%" type D16_临时文件夹\%%~nxi
	>>"D16_临时文件夹\%D16_name_type%" echo,
	set D16_act1=on
)


rem 七、去除空行 
set D16_pathly1="D16_临时文件夹\%D16_name_type%"
call :D16_main1 D16_pathly1

rem 去除空行后的目标文件的call信息，某行有call，则建立文件【行号.txt】
call a\a13_查看call.bat 1 1 D16_pathly1
for /f "tokens=1,* delims= " %%i in (a13_call信息2.txt) do (
	cd.>D16_临时文件夹\【标】%%i.txt
)


rem 八、祝好读取目标文件，将目标文件中的a\ax_xxx.bat替换为ax的形式
rem 注意，目标文件必须要去除空行才行
rem 有些文件中一行为【	】，有可能导致去除空行不彻底
>D16_临时文件夹\临时文件.txt echo,@echo off
rem cd.>D16_临时文件夹\临时文件.txt
set D16_act1=
set D16_num1=1
set D16_str1= 
for /f "delims=" %%i in ('findstr ".*" %D16_pathly1%') do (
	set D16_act2=
	if "%%i"=="::主代码 end" (
		set D16_act1=K
	)
	if defined D16_act1 (
		set D16_str2=%%i
		call :D16_main5
	)
	if defined D16_act2 (
		>>D16_临时文件夹\临时文件.txt echo,%%i
	)
	if "%%i"=="::主代码" (
		set D16_act1=on
	)
	call :D16_add1
)
echo,RRRRRRRRRRRRRRRRRR "D16_临时文件夹\%D16_name_type%"
del /q/s "D16_临时文件夹\%D16_name_type%"
ren "D16_临时文件夹\临时文件.txt" "%D16_name_type%"
echo,完成!
pause
goto exit
::一层c
rem ----------------------------------------------------------一层c
:D16_add1
set /a D16_num1=%D16_num1%+1
goto :eof
::函数1
::去除空行
:D16_main1
rem %1的值指向一个变量名，变量名对应的变量为要去除空行的文件绝对路径
set D16_str3.1.1=%1
rem 将要去除空行的文件的绝对路径保存到D16_str3.1.1.1中(带有引号)
call :D16_main1.1 "%%%1:"=%%"
rem 读取文件
for %%i in (%D16_str3.1.1.1%) do (
	set D16_str3.1.2=%%~dpi
	set D16_str3.1.3=%%~nxi
)
cd.>"%D16_str3.1.2%临时文件.txt"
for /f "delims=" %%i in ('findstr ".*" %D16_str3.1.1.1%') do (
	>>"%D16_str3.1.2%临时文件.txt" echo,%%i
)
echo,RRRRRRRRRRRRRRRRRrr  %D16_str3.1.1.1%
del /q/s %D16_str3.1.1.1%
ren "%D16_str3.1.2%临时文件.txt" "%D16_str3.1.3%"
goto :eof
:D16_main1.1
set D16_str3.1.1.1=%1
goto :eof
::函数1 end

::函数2
::提取批处理路径的字符标号
:D16_main2
set D16_str3.2.1=%1
call :D16_main2.1 "%%%1:"=%%"
for %%i in (%D16_str3.2.1.1%) do (
	set D16_str3.2.2=%%~ni
)
set D16_main2.1=%D16_str3.2.2:~0,1%
set D16_str3.2.3=_
call a\a5_变量拆分1.bat 1 1 D16_str3.2.2 D16_str3.2.3
for /f "tokens=*" %%i in (a5_d.txt) do (
	set D16_main2.2=%%i
	goto D16_finish2.1
)
:D16_finish2.1
goto :eof
:D16_main2.1
set D16_str3.2.1.1=%1
goto :eof
::函数2 end
::函数3
::主程序函数
rem 获取全部相关文件的函数
rem 要分析的文件放在【目录.txt】中
rem 目录.txt文件被分析后会从新创建，以前分析过的文件不会再次被添加进来
:D16_main3
cd.>D16_临时文件夹\小汇总.txt
for /f "tokens=*" %%i in (D16_临时文件夹\目录.txt) do (
	echo,     【匹配 --- %%~ni】
	set D16_str3.1=%%~i
	set D16_str3.2=%%~ni
	call a\a13_查看call.bat 1 1 D16_str3.1
	call :D16_main3.1
)
cd.>D16_临时文件夹\目录.txt
if exist D16_临时文件夹\小汇总 rd /q/s D16_临时文件夹\小汇总
md D16_临时文件夹\小汇总
for /f "tokens=1,*" %%i in (D16_临时文件夹\小汇总.txt) do (
	rem 如果没有文件说明是新的文件(局部新文件)
	if not exist D16_临时文件夹\小汇总\%%j.txt (
		cd.>D16_临时文件夹\小汇总\%%j.txt
		rem 如果没有文件说明是新的文件(全局新文件)
		if not exist D16_临时文件夹\%%j.txt (
			>>D16_临时文件夹\汇总.txt echo,%%i %%j
			>>D16_临时文件夹\目录.txt echo,%%i
		)
	)
)
goto :eof
::函数3 end
::函数4
::提取主代码(可不用)
:D16_main4
::函数4 end


:D16_main5
if not exist D16_临时文件夹\【标】%D16_num1%.txt (
	set D16_act2=on
	goto :eof
)
echo,【标】%D16_num1%.txt

call a\a5_变量拆分1.bat 1 1 D16_str2 D16_str1
cd.>D16_临时文件夹\临时文件2.txt
set D16_act5.1=
for /f "tokens=*" %%i in (a5_d.txt) do (
	if defined D16_act5.1 (
		set D16_str5.1=%%i
		call :D16_main5.1
		set D16_act5.1=
	)else (
		>>D16_临时文件夹\临时文件2.txt (set /p="%%i " <nul)
	)
	if "%%i"=="call" set D16_act5.1=on
)
>>D16_临时文件夹\临时文件2.txt echo,
>>D16_临时文件夹\临时文件.txt type D16_临时文件夹\临时文件2.txt
goto :eof
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
:D16_main5.1
call :D16_main2 D16_str5.1
>>D16_临时文件夹\临时文件2.txt (set /p=":%D16_main2.2% " <nul)
goto :eof
:D16_main3.1
set D16_str3.1.1=_
call a\a5_变量拆分1.bat 1 1 D16_str3.2 D16_str3.1.1
for /f "tokens=*" %%i in (a5_d.txt) do (
set D16_str3.1.2=%%i
goto finish0.1
)
:finish0.1
if not exist D16_临时文件夹\%D16_str3.1.2%.txt (
>D16_临时文件夹\%D16_str3.1.2%.txt type a13_call信息2.txt
)
>>D16_临时文件夹\小汇总.txt type a13_call信息3.txt
goto :eof
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
提示:可以在生成被调用批处理时就加入标签，就不用再本程序中进行处理了
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:调用
【文件功能类 】:
【文件名称   】:
::属性说明 end
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
rem ----------------------------------------------------------主代码 end
::主代码 end
