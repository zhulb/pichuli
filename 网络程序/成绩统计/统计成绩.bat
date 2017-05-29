@echo off
md 临时文件夹
cd.>临时文件夹\成绩.txt
:begin
cls
set "pathly=exit"
echo,
echo,路径中允许^&等特殊符号，但%%要用%%转义才行
echo,
echo,直接拖包含姓名的文本到窗口(学号从小到大)
echo,
echo,输入main来处理导出的成绩数据
echo,
echo,退出:exit(默认)
echo,
set /p pathly=路径 
set pathly="%pathly:"=%"        ::去掉变量中的引号
call :获取源信息 %pathly%
if "%pathly%"=="exit" goto exit
if "%pathly%"=="main" goto main1
set id=1
for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (
cls
call :main %%i
)
cls
echo,完成!即将返回主界面!
ping /n 4 127.1>nul
goto begin
rem ----------------------------------------------------------一层goto区
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit
:main1
cls
echo,将成绩数据文本拖到批处理
set /p pathly=路径 
set pathly="%pathly:"=%"        ::去掉变量中的引号
call :获取源信息 %pathly%
echo,正在导出...
cd.>临时文件夹\学号.txt
cd.>临时文件夹\姓名.txt
cd.>临时文件夹\成绩1.txt
cd.>临时文件夹\成绩2.txt
cd.>临时文件夹\成绩3.txt
cd.>临时文件夹\成绩4.txt
cd.>临时文件夹\成绩5.txt
cd.>临时文件夹\成绩6.txt
cd.>临时文件夹\all.txt

for /f "usebackq tokens=1,2,3,4,5,6,7,8,* delims=#" %%i in ("%pathly%") do (
>>临时文件夹\姓名.txt echo,%%i
>>临时文件夹\学号.txt echo,%%j
>>临时文件夹\成绩1.txt echo,%%k
>>临时文件夹\成绩2.txt echo,%%l
>>临时文件夹\成绩3.txt echo,%%m
>>临时文件夹\成绩4.txt echo,%%n
>>临时文件夹\成绩5.txt echo,%%o
>>临时文件夹\成绩6.txt echo,%%p
>>临时文件夹\all.txt echo,%%q
)
echo,完成导出!即将返回主菜单!
ping /n 4 127.1>nul
goto begin
rem ----------------------------------------------------------一层goto区
rem ----------------------------------------------------------一层call区
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
set type="%~x1"
set type=%type:&=^&%
set type=%type:|=^|%
set pathly=%pathly:"=%
set pathmb=%pathmb:"=%
set name=%name:"=%
set type=%type:"=%
goto :eof
:main
echo,姓名:%1
if %id% lss 10 (
echo,学号:0907110%id%
) else (
echo,学号:090711%id%
)

set /p cj1=成绩一:
if "%cj1%"=="exit" goto begin
set /p cj2=成绩二:
if "%cj2%"=="exit" goto begin
set /p cj3=成绩三:
if "%cj3%"=="exit" goto begin
set /p cj4=成绩四:
if "%cj4%"=="exit" goto begin
set /p cj5=成绩五:
if "%cj5%"=="exit" goto begin
set /p cj6=成绩六:
if "%cj6%"=="exit" goto begin

set /a all=%cj1%+%cj2%+%cj3%+%cj4%+%cj5%+%cj6%
if %id% lss 10 (
>>临时文件夹\成绩.txt (echo,%1#0907110%id%#%cj1%#%cj2%#%cj3%#%cj4%#%cj5%#%cj6%#%all%)
) else (
>>临时文件夹\成绩.txt (echo,%1#090711%id%#%cj1%#%cj2%#%cj3%#%cj4%#%cj5%#%cj6%#%all%)
)
set /a id=%id%+1
goto :eof
rem ----------------------------------------------------------一层call区
