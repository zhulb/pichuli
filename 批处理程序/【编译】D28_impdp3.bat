@echo off
rem ----------------------------------------------------------主代码
echo,
echo,Oracle数据库批量导入dmp文件
echo,说明：1、dmp文件放入批处理所在文件夹
echo,      2、文件名只能是配置当中的名称
echo,请按任意键开始
pause>nul
if not exist D28_临时文件夹 (
md D28_临时文件夹
)
cd.>D28_临时文件夹\日志.txt
set D28_Oracle.directory=D:\oracle10g\admin\orcl\dpdump
set D28_Oracle.dbaName=sys
set D28_Oracle.dbaPwd=orcl
set D28_Oracle.dbaDatabase=orcl
rem 加载用户信息
call :a18 "%~0" ::D28_userdata D28_users 
echo,%users.list[]%
rem 用户选择要导入的文件
for /l %%i in (1,1,%D28_users.list[]%) do (
call :D28_STRING.show %%i %%D28_users.list[%%i].name%%
)
echo,请输入要导入的用户
echo,例[]  输入1 2 3 4(注意：不要重复)
set /p D28_string$=
rem 导入dmp文件
set D28_string=
for /l %%i in (1,1,%D28_users.list[]%) do (
call :D28_String.append %%i
)
set D28_num=1
for %%i in (%D28_string$%) do (
call :D28_ORACLE.impdp %%D28_users.list[%%i].name%% %%D28_users.list[%%i].pwd%% %%D28_users.list[%%i].database%% %%D28_users.list[%%i].tablespace%%
)
pause
exit
::一层c
rem ----------------------------------------------------------一层c
::函数1
:D28_STRING.show
echo,%1、%2
goto :eof
:D28_String.append
if "%D28_string%"=="" (
set D28_string=%1
) else (
set D28_string=%D28_string% %1
)
goto :eof
:D28_ORACLE.impdp
ping /n 4 127.1>nul
cls
echo,正在导入第%D28_num%个(共%D28_user.count%)%1.dmp...
if not exist "%~dp0""%~1".dmp (
>>D28_临时文件夹\日志.txt echo,%1.dmp文件不存在
echo,提示：文件不存在---%1.dmp
echo,请查看日志文件!
ping /n 2 127.1>nul
goto :eof
)
echo,一、删除用户
echo,1、生成重建用户sql文件
(echo,drop user %1 cascade;
echo,create user %1 identified by %1 default tablespace zhbg;
echo,grant connect,resource to %1;
echo,grant dba to %1;
echo,exit;
)>D28_临时文件夹\D28_dropUser.sql
echo,2、执行sql，重建用户
sqlplus sys/orcl as sysdba@orcl @D28_临时文件夹\D28_dropUser.sql
echo,二、拷贝文件
echo,1、删除旧文档
if exist %D28_Oracle.directory%\%1.dmp (
del %D28_Oracle.directory%\%1.dmp
)
echo,2、拷贝文件
copy "%~dp0""%~1".dmp %D28_Oracle.directory%
echo,三、导入文件(屏蔽输出)...
::1>nul 2>nul @impdp %1/%1 dumpfile=%1.dmp logfile=%1.log
impdp %1/%2 dumpfile=%1.dmp logfile=%1.log
set /a D28_num=%D28_num%+1
goto :eof
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
::属性说明 end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
::D28_userdata
name;pwd;database;tablespace
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
zjlog;zjlog;orcl;zhbg
::D28_userdata_end
rem ----------------------------------------------------------主代码 end
::主代码 end
:a18
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 简单数据表读取
rem 一、表的格式
rem 
rem ::标签
rem 数据;数据;数据;数据...
rem 数据;数据;数据;数据...
rem ...
rem ::标签_end
rem 
rem 二、数据说明
rem 1、数据的行数没有限制，但是最多只能有8列
rem 2、数据中不能有特殊字符[^&%;|<>"]最好用于存储中文、数字、字母数据
rem 
rem 
rem 三、调用方法
rem call :a18 表文件的路径 ::标签 接受数据的变量 
rem 
rem 四、数据用法
rem 数据行数               %接受变量.list[]%
rem 第5行第m列的值         %接受变量.list[5].列名%
rem
rem 五、使用范围
rem 8列以下的表结构，且数据为中文、数字、字母
rem 
rem 六、使用例子
rem a18_SimpleTableEp1.bat
rem 
set a18_Table.path="%~1"
set a18_Table.biaoqian=%2
set a18_Table.var=%3
set a18_Table.load=
set a18_Table.load.title=
set a18_Table.num=0
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
::一层c
rem ----------------------------------------------------------一层c
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
