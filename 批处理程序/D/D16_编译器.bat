@echo off
set D16_message="%~n0"
set D16_pathmb="%~dp0"
set D16_pathmb=%D16_pathmb:~0,-4%"
pushd %D16_pathmb%
::������
rem ----------------------------------------------------------������
rem һ��������ʱ�ļ���
rem 
set message=������
if exist D16_��ʱ�ļ��� rd /q/s D16_��ʱ�ļ���
md D16_��ʱ�ļ���

rem ������ȡ�����ļ���·��
call a\a2_��ȡ·��.bat 1 1 0 1

rem ���������������롿xxx.bat
set D16_name_type="�����롿%a2_name%%a2_type%"
rem ȥ������
for %%i in (%D16_name_type%) do (
	set D16_name_type=%%~i
)

rem �ġ���ȡȫ����ص��������ļ�
rem ������ڡ�����.txt��
cls
rem ��ʼ��
cd.>D16_��ʱ�ļ���\����.txt
call :D16_main2  a2_pathly
rem ����·�������
>>D16_��ʱ�ļ���\����.txt echo,"%a2_pathly%" %D16_main2.2%
rem ����·������Ҫ�������������ļ���
>D16_��ʱ�ļ���\Ŀ¼.txt echo,"%a2_pathly%"
rem ��ʼ��ȡ��ص��������ļ�
echo,����һ��ƥ��...
call :D16_main3
echo,���ڶ���ƥ��...
call :D16_main3
echo,��������ƥ��...
call :D16_main3
echo,�����Ĵ�ƥ��...
call :D16_main3
echo,�������ƥ��...
call :D16_main3
echo,��������ƥ��...
call :D16_main3
echo, ���ƥ��

rem �塢������.txt���б���������ص��������ļ�������Щ�ļ����Ƶ���ʱ�ļ�����
for /f "tokens=1,*" %%i in (D16_��ʱ�ļ���\����.txt) do (
	echo,RRRRRRRRRRRRRRRRRRRRRRRRRR %%i
	copy %%i D16_��ʱ�ļ���
)

rem ��������Ŀ���ļ����������е��ļ������ݸ��ƽ�ȥ
rem 
cd.>"D16_��ʱ�ļ���\%D16_name_type%"

rem ����.txt�е�һ�б�����ļ�����Ҫ���ñ�ţ�����ļ�������Ҫ������ļ�
set D16_act1=
for /f "tokens=1,*" %%i in (D16_��ʱ�ļ���\����.txt) do (
	if defined D16_act1 (
		>>"D16_��ʱ�ļ���\%D16_name_type%" echo,
		>>"D16_��ʱ�ļ���\%D16_name_type%" echo,
		>>"D16_��ʱ�ļ���\%D16_name_type%" echo,:%%j
	)
	>>"D16_��ʱ�ļ���\%D16_name_type%" type D16_��ʱ�ļ���\%%~nxi
	>>"D16_��ʱ�ļ���\%D16_name_type%" echo,
	set D16_act1=on
)


rem �ߡ�ȥ������ 
set D16_pathly1="D16_��ʱ�ļ���\%D16_name_type%"
call :D16_main1 D16_pathly1

rem ȥ�����к��Ŀ���ļ���call��Ϣ��ĳ����call�������ļ����к�.txt��
call a\a13_�鿴call.bat 1 1 D16_pathly1
for /f "tokens=1,* delims= " %%i in (a13_call��Ϣ2.txt) do (
	cd.>D16_��ʱ�ļ���\���꡿%%i.txt
)


rem �ˡ�ף�ö�ȡĿ���ļ�����Ŀ���ļ��е�a\ax_xxx.bat�滻Ϊax����ʽ
rem ע�⣬Ŀ���ļ�����Ҫȥ�����в���
rem ��Щ�ļ���һ��Ϊ��	�����п��ܵ���ȥ�����в�����
>D16_��ʱ�ļ���\��ʱ�ļ�.txt echo,@echo off
rem cd.>D16_��ʱ�ļ���\��ʱ�ļ�.txt
set D16_act1=
set D16_num1=1
set D16_str1= 
for /f "delims=" %%i in ('findstr ".*" %D16_pathly1%') do (
	set D16_act2=
	if "%%i"=="::������ end" (
		set D16_act1=K
	)
	if defined D16_act1 (
		set D16_str2=%%i
		call :D16_main5
	)
	if defined D16_act2 (
		>>D16_��ʱ�ļ���\��ʱ�ļ�.txt echo,%%i
	)
	if "%%i"=="::������" (
		set D16_act1=on
	)
	call :D16_add1
)
echo,RRRRRRRRRRRRRRRRRR "D16_��ʱ�ļ���\%D16_name_type%"
del /q/s "D16_��ʱ�ļ���\%D16_name_type%"
ren "D16_��ʱ�ļ���\��ʱ�ļ�.txt" "%D16_name_type%"
echo,���!
pause
goto exit
::һ��c
rem ----------------------------------------------------------һ��c
:D16_add1
set /a D16_num1=%D16_num1%+1
goto :eof
::����1
::ȥ������
:D16_main1
rem %1��ֵָ��һ������������������Ӧ�ı���ΪҪȥ�����е��ļ�����·��
set D16_str3.1.1=%1
rem ��Ҫȥ�����е��ļ��ľ���·�����浽D16_str3.1.1.1��(��������)
call :D16_main1.1 "%%%1:"=%%"
rem ��ȡ�ļ�
for %%i in (%D16_str3.1.1.1%) do (
	set D16_str3.1.2=%%~dpi
	set D16_str3.1.3=%%~nxi
)
cd.>"%D16_str3.1.2%��ʱ�ļ�.txt"
for /f "delims=" %%i in ('findstr ".*" %D16_str3.1.1.1%') do (
	>>"%D16_str3.1.2%��ʱ�ļ�.txt" echo,%%i
)
echo,RRRRRRRRRRRRRRRRRrr  %D16_str3.1.1.1%
del /q/s %D16_str3.1.1.1%
ren "%D16_str3.1.2%��ʱ�ļ�.txt" "%D16_str3.1.3%"
goto :eof
:D16_main1.1
set D16_str3.1.1.1=%1
goto :eof
::����1 end

::����2
::��ȡ������·�����ַ����
:D16_main2
set D16_str3.2.1=%1
call :D16_main2.1 "%%%1:"=%%"
for %%i in (%D16_str3.2.1.1%) do (
	set D16_str3.2.2=%%~ni
)
set D16_main2.1=%D16_str3.2.2:~0,1%
set D16_str3.2.3=_
call a\a5_�������1.bat 1 1 D16_str3.2.2 D16_str3.2.3
for /f "tokens=*" %%i in (a5_d.txt) do (
	set D16_main2.2=%%i
	goto D16_finish2.1
)
:D16_finish2.1
goto :eof
:D16_main2.1
set D16_str3.2.1.1=%1
goto :eof
::����2 end
::����3
::��������
rem ��ȡȫ������ļ��ĺ���
rem Ҫ�������ļ����ڡ�Ŀ¼.txt����
rem Ŀ¼.txt�ļ������������´�������ǰ���������ļ������ٴα���ӽ���
:D16_main3
cd.>D16_��ʱ�ļ���\С����.txt
for /f "tokens=*" %%i in (D16_��ʱ�ļ���\Ŀ¼.txt) do (
	echo,     ��ƥ�� --- %%~ni��
	set D16_str3.1=%%~i
	set D16_str3.2=%%~ni
	call a\a13_�鿴call.bat 1 1 D16_str3.1
	call :D16_main3.1
)
cd.>D16_��ʱ�ļ���\Ŀ¼.txt
if exist D16_��ʱ�ļ���\С���� rd /q/s D16_��ʱ�ļ���\С����
md D16_��ʱ�ļ���\С����
for /f "tokens=1,*" %%i in (D16_��ʱ�ļ���\С����.txt) do (
	rem ���û���ļ�˵�����µ��ļ�(�ֲ����ļ�)
	if not exist D16_��ʱ�ļ���\С����\%%j.txt (
		cd.>D16_��ʱ�ļ���\С����\%%j.txt
		rem ���û���ļ�˵�����µ��ļ�(ȫ�����ļ�)
		if not exist D16_��ʱ�ļ���\%%j.txt (
			>>D16_��ʱ�ļ���\����.txt echo,%%i %%j
			>>D16_��ʱ�ļ���\Ŀ¼.txt echo,%%i
		)
	)
)
goto :eof
::����3 end
::����4
::��ȡ������(�ɲ���)
:D16_main4
::����4 end


:D16_main5
if not exist D16_��ʱ�ļ���\���꡿%D16_num1%.txt (
	set D16_act2=on
	goto :eof
)
echo,���꡿%D16_num1%.txt

call a\a5_�������1.bat 1 1 D16_str2 D16_str1
cd.>D16_��ʱ�ļ���\��ʱ�ļ�2.txt
set D16_act5.1=
for /f "tokens=*" %%i in (a5_d.txt) do (
	if defined D16_act5.1 (
		set D16_str5.1=%%i
		call :D16_main5.1
		set D16_act5.1=
	)else (
		>>D16_��ʱ�ļ���\��ʱ�ļ�2.txt (set /p="%%i " <nul)
	)
	if "%%i"=="call" set D16_act5.1=on
)
>>D16_��ʱ�ļ���\��ʱ�ļ�2.txt echo,
>>D16_��ʱ�ļ���\��ʱ�ļ�.txt type D16_��ʱ�ļ���\��ʱ�ļ�2.txt
goto :eof
rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
:D16_main5.1
call :D16_main2 D16_str5.1
>>D16_��ʱ�ļ���\��ʱ�ļ�2.txt (set /p=":%D16_main2.2% " <nul)
goto :eof
:D16_main3.1
set D16_str3.1.1=_
call a\a5_�������1.bat 1 1 D16_str3.2 D16_str3.1.1
for /f "tokens=*" %%i in (a5_d.txt) do (
set D16_str3.1.2=%%i
goto finish0.1
)
:finish0.1
if not exist D16_��ʱ�ļ���\%D16_str3.1.2%.txt (
>D16_��ʱ�ļ���\%D16_str3.1.2%.txt type a13_call��Ϣ2.txt
)
>>D16_��ʱ�ļ���\С����.txt type a13_call��Ϣ3.txt
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
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
��ʾ:���������ɱ�����������ʱ�ͼ����ǩ���Ͳ����ٱ������н��д�����
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
