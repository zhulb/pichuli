@echo off
set D14_message="%~n0"
set D14_pathmb="%~dp0"
set D14_pathmb=%D14_pathmb:~0,-4%
pushd %D14_pathmb%
::������
rem ----------------------------------------------------------������
set message=����Ŀ¼�ṹ
:D14_begin
cls
call a\a2_��ȡ·��.bat 1 1 0 1
call a\a10_·���ж�2.bat 1 1 a2_pathly
if "%a10_result%"=="wj" (
cls
echo,
echo,Ŀ�����ļ�!
ping /n 2 127.1>nul
goto :D14_begin
)
cd.>"%a2_pathly%\�ļ�������(D14).bat"
>>"%a2_pathly%\�ļ�������(D14).bat" echo,@echo off
>>"%a2_pathly%\�ļ�������(D14).bat" (set /p nothing="set file=" <nul)
set D14_act=
for /f "usebackq tokens=*" %%i in ("%~0") do (
if "%%i"=="::D14_Ŀ¼ end" goto D14_finish0
if defined D14_act (
>>"%a2_pathly%\�ļ�������(D14).bat" (set /p nothing=""^" <nul)
>>"%a2_pathly%\�ļ�������(D14).bat" (set /p nothing="%%i" <nul)
>>"%a2_pathly%\�ļ�������(D14).bat" (set /p nothing="" ^" <nul)
)
if "%%i"=="::D14_Ŀ¼" set D14_act=on
)
:D14_finish0
>>"%a2_pathly%\�ļ�������(D14).bat" echo,
set D14_act=
for /f "usebackq tokens=*" %%i in ("%~0") do (
if "%%i"=="::D14_����1 end" goto D14_finish1
if defined D14_act (
>>"%a2_pathly%\�ļ�������(D14).bat" echo,%%i
)
if "%%i"=="::D14_����1" set D14_act=on
)
:D14_finish1
set D14_act=
for /f "usebackq tokens=*" %%i in ("%~0") do (
if "%%i"=="::D14_Ŀ¼ end" goto D14_finish2
if defined D14_act (
set D14_str1=%%~i
call :D14_main1
)
if "%%i"=="::D14_Ŀ¼" set D14_act=on
)
:D14_finish2
cls
echo,
echo,���!
ping /n 2 127.1>nul
goto exit
::һ��c
rem ----------------------------------------------------------һ��c
:D14_main1
call a\a7_��������1.bat 1 1 D14_str1 100
>>"%a2_pathly%\�ļ�������(D14).bat" echo,::%D14_str1%
set D14_str1=%D14_str1%
if exist "%a2_pathly%\%D14_str1%" (
call :D14_main1.1
)
call a\a7_��������1.bat 1 1 D14_str1 100
>>"%a2_pathly%\�ļ�������(D14).bat" echo,::%D14_str1% end
set D14_str1=%D14_str1%
goto :eof
rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
:D14_main1.1
for /f "tokens=*" %%i in ('dir /ad/b "%a2_pathly%\%D14_str1%"') do (
>>"%a2_pathly%\�ļ�������(D14).bat" echo,%%i
)
goto :eof
rem ----------------------------------------------------------����c end
::����c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c end
::�Ĳ�c end
::���c
rem ----------------------------------------------------------���c
rem ----------------------------------------------------------���c end
::���c end
::D14_����1
for %%a in (%file%) do (
call :setup %%~a
)
echo,&echo,���
pause>nul
exit
:setup
echo,%*
set "act="
rem ----------ע��:set "act=" ɾ���˻�������act
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
::D14_����1 end
::D14_Ŀ¼
AKB�糡�����ļ���\STAGES ���`��A
AKB�糡�����ļ���\STAGES ���`��K
AKB�糡�����ļ���\STAGES ���`��B
AKB�����ļ���
�ɤ������ߤ�꠵����ļ���
AKB AX
::D14_Ŀ¼ end

::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:����
���ļ������� ��:
���ļ�����   ��:
::����˵�� end
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
rem ----------------------------------------------------------������ end
::������ end

