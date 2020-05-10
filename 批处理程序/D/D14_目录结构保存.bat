@echo off
set D14_message="%~n0"
set D14_pathmb="%~dp0"
set D14_pathmb=%D14_pathmb:~0,-4%
pushd %D14_pathmb%
::主代码
rem ----------------------------------------------------------主代码
set message=保存目录结构
:D14_begin
cls
call a\a2_获取路径.bat 1 1 0 1
call a\a10_路径判断2.bat 1 1 a2_pathly
if "%a10_result%"=="wj" (
cls
echo,
echo,目标是文件!
ping /n 2 127.1>nul
goto :D14_begin
)
cd.>"%a2_pathly%\文件夹生成(D14).bat"
>>"%a2_pathly%\文件夹生成(D14).bat" echo,@echo off
>>"%a2_pathly%\文件夹生成(D14).bat" (set /p nothing="set file=" <nul)
set D14_act=
for /f "usebackq tokens=*" %%i in ("%~0") do (
if "%%i"=="::D14_目录 end" goto D14_finish0
if defined D14_act (
>>"%a2_pathly%\文件夹生成(D14).bat" (set /p nothing=""^" <nul)
>>"%a2_pathly%\文件夹生成(D14).bat" (set /p nothing="%%i" <nul)
>>"%a2_pathly%\文件夹生成(D14).bat" (set /p nothing="" ^" <nul)
)
if "%%i"=="::D14_目录" set D14_act=on
)
:D14_finish0
>>"%a2_pathly%\文件夹生成(D14).bat" echo,
set D14_act=
for /f "usebackq tokens=*" %%i in ("%~0") do (
if "%%i"=="::D14_代码1 end" goto D14_finish1
if defined D14_act (
>>"%a2_pathly%\文件夹生成(D14).bat" echo,%%i
)
if "%%i"=="::D14_代码1" set D14_act=on
)
:D14_finish1
set D14_act=
for /f "usebackq tokens=*" %%i in ("%~0") do (
if "%%i"=="::D14_目录 end" goto D14_finish2
if defined D14_act (
set D14_str1=%%~i
call :D14_main1
)
if "%%i"=="::D14_目录" set D14_act=on
)
:D14_finish2
cls
echo,
echo,完成!
ping /n 2 127.1>nul
goto exit
::一层c
rem ----------------------------------------------------------一层c
:D14_main1
call a\a7_变量处理1.bat 1 1 D14_str1 100
>>"%a2_pathly%\文件夹生成(D14).bat" echo,::%D14_str1%
set D14_str1=%D14_str1%
if exist "%a2_pathly%\%D14_str1%" (
call :D14_main1.1
)
call a\a7_变量处理1.bat 1 1 D14_str1 100
>>"%a2_pathly%\文件夹生成(D14).bat" echo,::%D14_str1% end
set D14_str1=%D14_str1%
goto :eof
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
:D14_main1.1
for /f "tokens=*" %%i in ('dir /ad/b "%a2_pathly%\%D14_str1%"') do (
>>"%a2_pathly%\文件夹生成(D14).bat" echo,%%i
)
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
::D14_代码1
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
::D14_代码1 end
::D14_目录
AKB剧场公演文件夹\STAGES チームA
AKB剧场公演文件夹\STAGES チームK
AKB剧场公演文件夹\STAGES チームB
AKB单曲文件夹
渡り廊下走り隊单曲文件夹
AKB AX
::D14_目录 end

::脚本说明
rem ----------------------------------------------------------脚本说明
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

