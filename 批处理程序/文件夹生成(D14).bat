@echo off
set file="AKB剧场公演文件夹\STAGES チームA" "AKB剧场公演文件夹\STAGES チームK" "AKB剧场公演文件夹\STAGES チームB" "AKB单曲文件夹" "渡り廊下走り隊单曲文件夹" "AKB AX" 
for %%a in (%file%) do (
call :setup %%~a
)
echo,&echo,完成
pause>nul
exit
:setup
echo,%*
set "act="
rem ----------注释:set "act=" 删除了环境变量act
for /f "usebackq tokens=* eol=" %%a in ("%~nx0") do (
if "%%a"=="::%* end" (goto :eof)
if defined act (
if not exist "%*\%%a" (
md "%*\%%a"
)
)
if "%%a"=="::%*" set act=act
)
pause>nul
exit
::AKB剧场公演文件夹\STAGES チームA
::AKB剧场公演文件夹\STAGES チームA end
::AKB剧场公演文件夹\STAGES チームK
::AKB剧场公演文件夹\STAGES チームK end
::AKB剧场公演文件夹\STAGES チームB
::AKB剧场公演文件夹\STAGES チームB end
::AKB单曲文件夹
::AKB单曲文件夹 end
::渡り廊下走り隊单曲文件夹
::渡り廊下走り隊单曲文件夹 end
::AKB AX
::AKB AX end
