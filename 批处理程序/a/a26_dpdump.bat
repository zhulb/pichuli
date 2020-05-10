@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 一、基础文档
rem 1、dba_directories表
rem 保存用户或者系统目录
rem 表结构 owner        directory_name directory_path
rem       所属用户        目录别名　　　目录路径
rem 2、sql查询目录名为data_pump_dir的目录绝对路径，并且记录到日志文件
rem spool "a26_临时文件夹\a26_dpdump.txt";
rem select directory_path from dba_directories where directory_name='DATA_PUMP_DIR';
rem spool off;
rem exit
rem 3、cmd执行sql文件
rem sqlplus sys/orcl as sysdba@orcl @D28_临时文件夹\D28_dropUser.sql
rem 或者sqlplus / as sysdba@orcl @a26_临时文件夹\a26_dpdump.sql
rem 二、程序过程
rem 1、生成查找用的sql文件
rem 	sql文件的功能：查询目录名为data_pump_dir的目录绝对路径，并且记录到日志文件中
rem 	日志文件名：a26_data_dump_dir.txt，放在 a26_临时文件夹 中
rem 2、执行sql文件
rem 3、从日志文件中提取目录绝对路径

rem 一、创建临时文件夹
if not exist a26_临时文件夹 (
	md a26_临时文件夹
)
rem 二、生成sql文件
(echo,spool "a26_临时文件夹\a26_dpdump.txt";
echo,select directory_path from dba_directories where directory_name='DATA_PUMP_DIR'/****注意要大写******/;
echo,spool off;
echo,exit;
)>a26_临时文件夹\a26_dpdump.sql
rem 三、执行sql文件
rem sqlplus sys/orcl as sysdba@orcl @a26_临时文件夹\a26_dpdump.sql
sqlplus / as sysdba@orcl @a26_临时文件夹\a26_dpdump.sql
rem 四、设置返回值
for /f "tokens=*" %%i in (a26_临时文件夹\a26_dpdump.txt) do (
	set %1="%%~dpi"
)
goto :eof
::一层c
rem ----------------------------------------------------------一层c
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
