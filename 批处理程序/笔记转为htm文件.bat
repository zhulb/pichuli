@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,------------------�ʼǸ�ʽҪ��:^
&echo,^
&echo,rem ------��һ��^
&echo,1 ����1^
&echo,����1^
&echo,2 ����2^
&echo,����2^
&echo,rem ------��һ�� end^
&echo,rem ------�ڶ���^
&echo,.....^
&echo,^(���ע�͸�ʽ ::: ע������^)^
&echo,ע�Ͳ��������htlm�ļ���
:begin
cls
pushd "%~dp0"
if not exist ·������\��ȡ·��.bat (
echo,
echo,ȱ���ļ�
ping /n 2 127.1>nul
goto exit
)
call ·������\��ȡ·��.bat 1 1
if not exist ��ʱ�ļ��� md ��ʱ�ļ���
cd.>��ʱ�ļ���\��ʱ�ļ�.zlb
for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (
>>��ʱ�ļ���\��ʱ�ļ�.zlb echo,%%i
)
rem ------------------------------------------------------------------------------����Ŀ¼
set num="һ�����������߰˾�ʮ"
set fenlei=1
set id =1
cd.>"%pathmb%%name%.htm"
copy ��ҳͷ����\��ҳͷ����.zlb "%pathmb%%name%.htm"
cls
echo,
echo,1,���ڵ���Ŀ¼...
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
>>"%pathmb%%name%.htm" echo,^</p^>^<a name="������ҳ" class="STYLE9"^>��ҳ^</a^>^</p^>
for /f "usebackq tokens=1,2,* delims=, " %%i in ("%pathly%") do (
>��ʱ�ļ���\i��k.txt (echo,%%i %%k)
>��ʱ�ļ���\j.txt echo,%%j
call :����Ŀ¼
)
echo,���
rem ------------------------------------------------------------------------------����Ŀ¼ end
rem ------------------------------------------------------------------------------��������
echo,
echo,2,���ڵ�������...
set fenlei=1
set id=1
set skip=-1
for /f "usebackq tokens=1,2,* delims=, " %%i in ("��ʱ�ļ���\��ʱ�ļ�.zlb") do (
>��ʱ�ļ���\i��k.txt (echo,%%i %%k)
>��ʱ�ļ���\j.txt echo,%%j
call :��������
)
echo.���
rd /q /s ��ʱ�ļ���
ping /n 2 127.1>nul
goto begin
rem ------------------------------------------------------------------------------�������� end
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
rem ----------------------------------------------------------һ��call
:��������
set /a skip=%skip%+1
for /f "usebackq tokens=1,* delims= " %%i in ("��ʱ�ļ���\i��k.txt") do (
if "%%i"=="rem" (
if "%%j"=="end" (
goto :eof
 ) else call :�������
goto :eof
  )
if "%%i"==":::" goto :eof
)
for /f "usebackq tokens=1,* delims= " %%i in ("��ʱ�ļ���\i��k.txt") do (
if "%%i"=="%id%" (
call :���������� %%i
goto :eof
 )
)
if "%skip%"=="0" (
for /f "usebackq tokens=* delims= " %%i in ("��ʱ�ļ���\��ʱ�ļ�.zlb") do (
>>"%pathmb%%name%.htm" echo,^<p^>%%i^</p^>
goto :eof
 )
)
for /f "usebackq skip=%skip% tokens=* delims= " %%i in ("��ʱ�ļ���\��ʱ�ļ�.zlb") do (
>>"%pathmb%%name%.htm" echo,^<p^>%%i^</p^>
goto :eof
)
goto :eof
:��ȡԴ��Ϣ
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
:����Ŀ¼
for /f "usebackq tokens=1,* delims= " %%i in ("��ʱ�ļ���\i��k.txt") do (
if "%%i"=="rem" (
if "%%j"=="end" (
goto :eof
 ) else call :�������
goto :eof
  )
)
for /f "usebackq tokens=1,* delims= " %%i in ("��ʱ�ļ���\i��k.txt") do (
if "%%i"=="%id%" (
call :�������� %%i
set /a id=%id%+1
 )
)
goto :eof
rem ----------------------------------------------------------һ��call end
rem ----------------------------------------------------------����call
:��������
set c=%time:~-1%
if "%c%"=="0" set c=1
if %c% gtr 7 set c=4
for /f "usebackq tokens=* delims= " %%i in ("��ʱ�ļ���\j.txt") do (
>>"%pathmb%%name%.htm" echo,^<p^>^<span class="STYLE%c%"^>%1,^</span^>^<a href="#%%i" class="STYLE%c%"^>%%i^</a^>^</p^>
)
goto :eof
:����������
set c=%time:~-1%
if "%c%"=="0" set c=1
if %c% gtr 7 set c=4
>>"%pathmb%%name%.htm" echo,^<p^>^<a href="#������ҳ" class="STYLE8"^>������ҳ^</a^>^</p^>
set /a id=%id%+1
for /f "usebackq tokens=* delims= " %%i in ("��ʱ�ļ���\j.txt") do (
>>"%pathmb%%name%.htm" echo,^<p^>^<span class="STYLE%c%"^>%1,^</span^>^<a name="#%%i" class="STYLE%c%"^>%%i^</a^>^</p^>
)
goto :eof
:�������
setlocal EnableDelayedExpansion
>>"%pathmb%%name%.htm" (set /p="^<p class="STYLE9"^>!num:~%fenlei%,1!��" <nul)
endlocal
set id=1
set /a fenlei=%fenlei%+1
for /f "usebackq tokens=* delims=-" %%i in ("��ʱ�ļ���\j.txt") do (
>>"%pathmb%%name%.htm" echo,%%i^</p^>
)
goto :eof
rem ----------------------------------------------------------����call end
