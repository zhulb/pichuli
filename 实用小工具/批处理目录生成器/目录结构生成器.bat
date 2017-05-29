@echo off
call a18_SimpleTable.bat "%~0" ::allDir dirs
for /l %%i in (1,1,%dirs.list[]%) do (
	call :main %%dirs.list[%%i].dir%%
)

pause
exit

:main
echo,"%~1"
md "%~1"
goto :eof


::allDir
dir
pms\jsp\sqc\Dd\pledgeStyleRepoQuery
pms\jsp\sqc\Dd\manyGoldBusinessQuery
WEB-INF\classes
::allDir_end