@echo off
pushd ..
popd
set D25_message="%~n0"
set D25_pathmb="%~dp0"
set D25_pathmb=%D25_pathmb:~0,-4%
pushd %D25_pathmb%
::主代码
rem ----------------------------------------------------------主代码
set D25_num=1
for %%i in (zjdms zjucap zjcore zjcmis zjmail zjodps zjzhbg) do (
	call :D25_main %%i
)
cls
echo,完成
pause>nul
goto exit

::一层c
rem ----------------------------------------------------------一层c
::函数1
:D25_main
cls
echo,正在导出第%D25_num%个文件(工7个)...
ping /n 2 127.1>nul
if exist D:\oracle10g\admin\orcl\dpdump\%1.dmp (
	echo,删除文件D:\oracle10g\admin\orcl\dpdump\%1.dmp
	del D:\oracle10g\admin\orcl\dpdump\%1.dmp
)
expdp %1/%1@orcl directory=data_pump_dir dumpfile=%1.dmp
set /a D25_num=%D25_num%+1
copy D:\oracle10g\admin\orcl\dpdump\%1.dmp "%~dp0"
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
rem ----------------------------------------------------------主代码 end
::主代码 end
