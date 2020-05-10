@echo off
set pathly="%~0"
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,------------------笔记格式要求:^
&echo,^
&echo,rem ------第一类^
&echo,1 标题1^
&echo,内容1^
&echo,2 标题2^
&echo,内容2^
&echo,rem ------第一类 end^
&echo,rem ------第二类^
&echo,.....^
&echo,^(添加注释格式 ::: 注释内容^)^
&echo,注释不会出现在htlm文件中
:begin
cls
pushd "%~dp0"
if not exist 路径处理\获取路径.bat (
echo,
echo,缺少文件
ping /n 2 127.1>nul
goto exit
)
call 路径处理\获取路径.bat 1 1
if not exist 临时文件夹 md 临时文件夹
cd.>临时文件夹\临时文件.zlb
for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (
>>临时文件夹\临时文件.zlb echo,%%i
)
rem ------------------------------------------------------------------------------导出目录
set num="一二三四五六七八九十"
set fenlei=1
set id =1
cd.>"%pathmb%%name%.htm"
copy 网页头代码\网页头代码.zlb "%pathmb%%name%.htm"
cls
echo,
echo,1,正在导入目录...
>>"%pathmb%%name%.htm" echo,^<title^>%title%^</title^>
>>"%pathmb%%name%.htm" (echo,^<style type="text/css"^>
echo,^<!--
echo,.STYLE1 {color: #7C00F9}
echo,.STYLE2 {color: #FF00FF}
echo,.STYLE3 {color: #00FFFF}
echo,.STYLE4 {color: #EE2B92; }
echo,.STYLE5 {color: #CCCC33}
echo,.STYLE6 {color: #FF8000}
echo,.STYLE7 {color: #00FF00}
echo,.STYLE8 {
echo,	color: #FF0000;
echo,	font-weight: bold;
echo,	font-style: italic;
echo,	font-size: 24px;
echo,}
echo,.STYLE9 {
echo,	color:#0000FF;
echo,	font-weight: bold;
echo,	font-style: italic;
echo,	font-size: 34px;
echo,}
echo,--^>
echo,^</style^>
echo,^</head^>
echo,
echo,^<body^>
)
>>"%pathmb%%name%.htm" echo,^</p^>^<a name="返回首页" class="STYLE9"^>首页^</a^>^</p^>
for /f "usebackq tokens=1,2,* delims=, " %%i in ("%pathly%") do (
>临时文件夹\i、k.txt (echo,%%i %%k)
>临时文件夹\j.txt echo,%%j
call :导出目录
)
echo,完成
rem ------------------------------------------------------------------------------导出目录 end
rem ------------------------------------------------------------------------------导出正文
echo,
echo,2,正在导入正文...
set fenlei=1
set id=1
set skip=-1
for /f "usebackq tokens=1,2,* delims=, " %%i in ("临时文件夹\临时文件.zlb") do (
>临时文件夹\i、k.txt (echo,%%i %%k)
>临时文件夹\j.txt echo,%%j
call :导出正文
)
echo.完成
rd /q /s 临时文件夹
ping /n 2 127.1>nul
goto begin
rem ------------------------------------------------------------------------------导出正文 end
rem ----------------------------------------------------------一层goto
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------一层call
:导出正文
set /a skip=%skip%+1
for /f "usebackq tokens=1,* delims= " %%i in ("临时文件夹\i、k.txt") do (
if "%%i"=="rem" (
if "%%j"=="end" (
goto :eof
 ) else call :输出分类
goto :eof
  )
if "%%i"==":::" goto :eof
)
for /f "usebackq tokens=1,* delims= " %%i in ("临时文件夹\i、k.txt") do (
if "%%i"=="%id%" (
call :导出标题正 %%i
goto :eof
 )
)
if "%skip%"=="0" (
for /f "usebackq tokens=* delims= " %%i in ("临时文件夹\临时文件.zlb") do (
>>"%pathmb%%name%.htm" echo,^<p^>%%i^</p^>
goto :eof
 )
)
for /f "usebackq skip=%skip% tokens=* delims= " %%i in ("临时文件夹\临时文件.zlb") do (
>>"%pathmb%%name%.htm" echo,^<p^>%%i^</p^>
goto :eof
)
goto :eof
:获取源信息
set pathly="%~1"
set pathly=%pathly:&=^&%
set pathly=%pathly:|=^|%
set pathmb="%~dp1"
set pathmb=%pathmb:&=^&%
set pathmb=%pathmb:|=^|%
set name="%~n1"
set name=%name:&=^&%
set name=%name:|=^|%
set title="%~n1"
set title=%title:&=^^^&%
set title=%title:|=^^^|%
set type="%~x1"
set type=%type:&=^&%
set type=%type:|=^|%
set pathly=%pathly:"=%
set pathmb=%pathmb:"=%
set name=%name:"=%
set title=%title:"=%
set type=%type:"=%
goto :eof
:导出目录
for /f "usebackq tokens=1,* delims= " %%i in ("临时文件夹\i、k.txt") do (
if "%%i"=="rem" (
if "%%j"=="end" (
goto :eof
 ) else call :输出分类
goto :eof
  )
)
for /f "usebackq tokens=1,* delims= " %%i in ("临时文件夹\i、k.txt") do (
if "%%i"=="%id%" (
call :导出标题 %%i
set /a id=%id%+1
 )
)
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------二层call
:导出标题
set c=%time:~-1%
if "%c%"=="0" set c=1
if %c% gtr 7 set c=4
for /f "usebackq tokens=* delims= " %%i in ("临时文件夹\j.txt") do (
>>"%pathmb%%name%.htm" echo,^<p^>^<span class="STYLE%c%"^>%1,^</span^>^<a href="#%%i" class="STYLE%c%"^>%%i^</a^>^</p^>
)
goto :eof
:导出标题正
set c=%time:~-1%
if "%c%"=="0" set c=1
if %c% gtr 7 set c=4
>>"%pathmb%%name%.htm" echo,^<p^>^<a href="#返回首页" class="STYLE8"^>返回首页^</a^>^</p^>
set /a id=%id%+1
for /f "usebackq tokens=* delims= " %%i in ("临时文件夹\j.txt") do (
>>"%pathmb%%name%.htm" echo,^<p^>^<span class="STYLE%c%"^>%1,^</span^>^<a name="#%%i" class="STYLE%c%"^>%%i^</a^>^</p^>
)
goto :eof
:输出分类
setlocal EnableDelayedExpansion
>>"%pathmb%%name%.htm" (set /p="^<p class="STYLE9"^>!num:~%fenlei%,1!、" <nul)
endlocal
set id=1
set /a fenlei=%fenlei%+1
for /f "usebackq tokens=* delims=-" %%i in ("临时文件夹\j.txt") do (
>>"%pathmb%%name%.htm" echo,%%i^</p^>
)
goto :eof
rem ----------------------------------------------------------二层call end
