@echo off
pushd ..
popd
set D24_message="%~n0"
set D24_pathmb="%~dp0"
set D24_pathmb=%D24_pathmb:~0,-4%
pushd %D24_pathmb%
::主代码
rem ----------------------------------------------------------主代码
echo,数据所在文件夹
call a\a2_获取路径.bat 0 0 0 0
set D24_dataDir="%a2_pathly%"
cls
echo,dpdump文件夹
call a\a2_获取路径.bat 0 0 0 0
set D24_Directory="%a2_pathly%"
cls
for %%i in (zjdms zjucap zjcore zjcmis zjmail zjodps zjzhbg) do (
	call :main %%i
)
pause

exit
::一层c
rem ----------------------------------------------------------一层c
::函数1
:main
cls
echo,正在删除表...(%1)
set D24_owner=%1
call a\a16_toUpper 1 1 D24_owner
call a\a15_delTable.bat 1 1 %1 %1 %D24_owner%
cls
echo,正在导入数据...(%1)
call a\a14_impdp.bat 1 1 %D24_dataDir%\%1.dmp %D24_Directory% %1 %1
pause
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
::配置信息



::配置信息 end
rem ----------------------------------------------------------主代码 end
::主代码 end
