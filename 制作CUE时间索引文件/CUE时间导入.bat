@echo off

title CUE��Ϣ����

:begin

cls

rem ----------------------------------------------------------------------------------����ʱ������

set pathly=exit

echo,

echo,������ʱ�����ݵ��ı������߱�׼��ʽ����Ϣ�ļ��ϵ�������

echo,

echo,·���п���ʹ���������^&�ȣ���%%Ҫ��%%ת��

echo,

echo,����a����Ӹ�ʵ�"MC��δ����"��

echo,

echo,�˳�:exit(Ĭ��)

echo,

set /p pathly=·�� 

set pathly="%pathly:"=%"

       ::ȥ�������е�����

call :��ȡԴ��Ϣ %pathly%

if "%pathly%"=="a" goto MC

if "%pathly%"=="exit" goto exit

set "wjlx="

       ::�ļ�����˵������(��׼��ʽ:���ű����ɵ�CUE�ı�����һ��ʱ�������ı�)

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::ʱ��" set wjlx=bz&goto �����жϽ���

)

set wjlx=pt

:�����жϽ���

if not exist ��ʱ�ļ��� md ��ʱ�ļ���

if "%wjlx%"=="bz" (

call :��׼�ļ�ʱ�䵼��

) else call :��ͨ�ļ�ʱ�䵼��

rem --------------------------------------------��ʱ�����ݱ��浽����

setlocal EnableDelayedExpansion

set number=1

for /f "usebackq tokens=1,* delims=#" %%i in ("��ʱ�ļ���\ʱ������(δ����).zlb") do (

set "a[!number!]=%%i"

set /a number=!number!+1

)

set /a number=!number!-1

cls

rem --------------------------------------------��ʱ�����ݱ��浽���� end

rem --------------------------------------------����

echo,��������...

echo,

rem ----------------------------------------------------------------------�ж��Ƿ�������һ��ʱ��

if not defined a[1] cls&echo,----------û��ʱ����Ϣ���޷�����&goto exit

rem ----------------------------------------------------------------------�ж��Ƿ�������һ��ʱ�� end

if !number! equ 1 goto finishpx

set id=1

:add id

for /l %%a in (!id!,1,!number!) do (

if !a[%id%]! gtr !a[%%a]! set change=!a[%id%]!&set a[!id!]=!a[%%a]!&set a[%%a]=!change!

)

set /a id=!id!+1

if !id! equ !number! goto finishpx

goto add id

rem --------------------------------------------���� end

:finishpx

cd.>"��ʱ�ļ���\ʱ������(������).zlb"

for /l %%a in (1,1,!number!) do (

echo,!a[%%a]!#K>>��ʱ�ļ���\ʱ������^(������^).zlb

)

(echo,!number!)>"��ʱ�ļ���\ʱ�����ݸ���.zlb"

endlocal

rem ----------------------------------------------------------------------------------����ʱ������ end

rem ----------------------------------------------------------------------------------�����������

cls

cd.>��ʱ�ļ���\��������.zlb

set pathly=exit

echo,

echo,�����и�����Ϣ���ı������߱�׼��ʽ����Ϣ�ļ��ϵ�������

echo,

echo,�����п���ʹ���������^&�ȣ���%%Ҫ��%%ת��

echo,

echo,·���п���ʹ���������^&�ȣ���%%Ҫ��%%ת��

echo,

echo,����:exit(Ĭ��)

echo,

set /p pathly=·�� 

set pathly="%pathly:"=%"

         ::ȥ�������е�����

call :��ȡԴ��Ϣ %pathly%

if "%pathly%"=="exit" goto �����ļ�·��

set "wjlx="

          ::�ļ�����˵������(��׼��ʽ:���ű����ɵ�CUE�ı�����һ��ʱ�������ı�)

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::����" set wjlx=bz&goto �����жϽ���1

)

set wjlx=pt

:�����жϽ���1

if "%wjlx%"=="bz" (

call :��׼�ļ���������

) else call :��ͨ�ļ���������

rem ----------------------------------------------------------------------------------�����������

rem ----------------------------------------------------------------------------------�����ļ�·��

:�����ļ�·��

cls

cd.>��ʱ�ļ���\�����ļ�·��.zlb

set pathly=exit

echo,

echo,��Ŀ�������ļ��ϵ���������

echo,

echo,·���п���ʹ���������^&�ȣ���%%Ҫ��%%ת��

echo,

echo,����:exit(Ĭ��)

echo,

set /p pathly=·�� 

set pathly="%pathly:"=%"

              ::ȥ�������е�����

call :��ȡԴ��Ϣ %pathly%

if "%pathly%"=="exit" goto ������Ϣ��д

echo,"%name%%type%">��ʱ�ļ���\�����ļ�·��.zlb

set nameoffile="%name%"

rem ----------------------------------------------------------------------------------�����ļ�·�� end

rem ----------------------------------------------------------------------------------������Ϣ

:������Ϣ��д

copy ������Ϣ��д.zlb ��ʱ�ļ���\������Ϣ��д.zlb

cls

echo,

echo,----------������ʱ�ļ���\������Ϣ��д.zlb������������Ϣ

echo,

echo,----------���б�׼�ļ����߲������˿�����������

echo,

echo,----------filename:CUE�ļ���

echo,

echo,----------title:ר������

echo,

echo,----------performer:�ݳ���

echo,

echo,----------�밴���������

pause>nul

cls

cd.>��ʱ�ļ���\filename.zlb

cd.>��ʱ�ļ���\performer.zlb

cd.>��ʱ�ļ���\title.zlb

set pathly=exit

echo,

echo,������������Ϣ���ݵ��ı������߱�׼��ʽ����Ϣ�ļ��ϵ�������

echo,

echo,·���п���ʹ���������^&�ȣ���%%Ҫ��%%ת��

echo,

echo,����:exit(Ĭ��)

echo,

set /p pathly=·�� 

set pathly="%pathly:"=%"

              ::ȥ�������е�����

call :��ȡԴ��Ϣ %pathly%

if "%pathly%"=="exit" goto ��Ϣ�������

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::filename end" goto ����ѭ��3

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>"��ʱ�ļ���\filename.zlb"

   ) else echo,%%j#K>"��ʱ�ļ���\filename.zlb"

 )

if "%%j"=="::filename" set "kz=on"&echo,�ҵ�filename����λ��

)

:����ѭ��3

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::performer end" goto ����ѭ��4

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>"��ʱ�ļ���\performer.zlb"

   ) else echo,%%j#K>"��ʱ�ļ���\performer.zlb"

 )

if "%%j"=="::performer" set "kz=on"&echo,�ҵ�performer����λ��

)

:����ѭ��4

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::title end" goto :��Ϣ�������

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>"��ʱ�ļ���\title.zlb"

   ) else echo,%%j#K>"��ʱ�ļ���\title.zlb"

 )

if "%%j"=="::title" set "kz=on"&echo,�ҵ�title����λ��

)

rem ----------------------------------------------------------------------------------������Ϣ end

:��Ϣ�������

echo,

echo,�ȴ�2��...

ping /n 2 127.1>nul

rem ----------------------------------------------------------------------------------������ļ�

cd.>��ʱ�ļ�.zlb

cls

echo,

echo,����������ļ�...

echo,

rem -----------------------------------���Ƭͷ

echo,���Ƭͷ...

for /f "usebackq tokens=1,* delims=#" %%i in ("��ʱ�ļ���\performer.zlb") do (

call :performer "%%~i"

goto finishp

)

:finishp

if defined performer (

echo,PERFORMER %performer% >��ʱ�ļ�.zlb

) else (echo,PERFORMER " " )>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* delims=#" %%i in ("��ʱ�ļ���\title.zlb") do (

call :title "%%~i"

goto finisht

)

:finisht

if defined title (

echo,TITLE %title% >>��ʱ�ļ�.zlb

) else (echo,TITLE " " )>>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* delims=#" %%i in ("��ʱ�ļ���\�����ļ�·��.zlb") do (

call :file "%%~i"

goto finishf

)

:finishf

if defined file (

echo,FILE %file% WAVE >>��ʱ�ļ�.zlb

) else (echo,FILE " " WAVE )>>��ʱ�ļ�.zlb

echo,  TRACK 01 AUDIO >>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* delims=#" %%i in ("��ʱ�ļ���\��������.zlb") do (

call :����1 "%%~i"

goto finish����1

)

:finish����1

if defined geming (

echo,    TITLE %geming% >>��ʱ�ļ�.zlb

) else (echo,    TITLE " " )>>��ʱ�ļ�.zlb

if defined performer (

echo,    PERFORMER %performer% >>��ʱ�ļ�.zlb

) else (echo,    PERFORMER " " )>>��ʱ�ļ�.zlb

for /f "useback tokens=1,* delims=#" %%i in ("��ʱ�ļ���\ʱ������(������).zlb") do (

call :ʱ��1 "%%~i"

goto finishʱ��1

)

:finishʱ��1

echo,    INDEX 01 %shijian:~1,-4%:%shijian:~-4,-2%:%shijian:~-2% >>��ʱ�ļ�.zlb

rem -----------------------------------���Ƭͷ end

for /f "usebackq tokens=* delims= " %%i in ("��ʱ�ļ���\ʱ�����ݸ���.zlb") do (

set number=%%i

)

rem -----------------------------------����������ʱ��

echo,���������ʱ��...

echo,

set id=1

if %number% equ 1 goto beifen

:daochu

set /a id =%id%+1

set /a skip=%id%-1

if %id% equ %number% (

if %id% lss 10 (

goto overlss

 ) else goto overgtr

)

if %id% lss 10 (

goto continuelss

) else goto continuegtr

rem -----------------------------------����������ʱ�� end

rem ----------------------------------------------------------------------------------������ļ� end

rem ----------------------------------------------------------------------------------��������

:beifen

echo,��������...

echo,

(echo,&echo,&echo,rem ----------------------------------------------------------------------��Ϣ����

echo,rem #::filename)>>��ʱ�ļ�.zlb

set "filename="

for /f "usebackq tokens=1,* delims=#" %%i in ("��ʱ�ļ���\filename.zlb") do (

call :filename "%%~i"

)

if defined filename (

echo,rem #%filename%>>��ʱ�ļ�.zlb

) else (echo,rem #)>>��ʱ�ļ�.zlb

(echo,rem #::filename end)>>��ʱ�ļ�.zlb

(echo,&echo,

echo,rem #::performer)>>��ʱ�ļ�.zlb

if defined performer (

echo,rem #%performer%>>��ʱ�ļ�.zlb

) else (echo,rem #)>>��ʱ�ļ�.zlb

(echo,rem #::performer end)>>��ʱ�ļ�.zlb

(echo,&echo,

echo,rem #::title)>>��ʱ�ļ�.zlb

if defined title (

echo,rem #%title%>>��ʱ�ļ�.zlb

) else (echo,rem #)>>��ʱ�ļ�.zlb

(echo,rem #::title end)>>��ʱ�ļ�.zlb

(echo,&echo,

echo,rem #::file)>>��ʱ�ļ�.zlb

if defined file (

echo,rem #%file%>>��ʱ�ļ�.zlb

) else (echo,rem #)>>��ʱ�ļ�.zlb

(echo,rem #::file end)>>��ʱ�ļ�.zlb

(echo,&echo,&echo,&echo,rem #::ʱ��)>>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* delims=#" %%i in ("��ʱ�ļ���\ʱ������(������).zlb") do (

echo,rem #%%i>>��ʱ�ļ�.zlb

)

(echo,rem #::ʱ�� end)>>��ʱ�ļ�.zlb

(echo,rem #����%number%������&echo,&echo,

echo,rem #::����)>>��ʱ�ļ�.zlb

set number=1

for /f "usebackq tokens=1,* delims=#" %%i in ("��ʱ�ļ���\��������.zlb") do (

echo,rem #%%i>>��ʱ�ļ�.zlb

call :�������ݸ���

)

set /a number=%number%-1

(echo,rem #::���� end)>>��ʱ�ļ�.zlb

(echo,rem #����%number%������&echo,&echo,)>>��ʱ�ļ�.zlb

(echo,&echo,&echo,rem ----------------------------------------------------------------------��Ϣ���� end)>>��ʱ�ļ�.zlb

rem ----------------------------------------------------------------------------------�������� end

rem ----------------------------------------------------------------------------------�������ļ�

echo,��ɱ���

if defined filename (

ren "��ʱ�ļ�.zlb" %filename2%.cue

) else (

if defined file (

ren "��ʱ�ļ�.zlb" %nameoffile%.cue

  ) else ren "��ʱ�ļ�.zlb" "δ����CUE�����ļ�.cue"

)

echo,

echo,�Ѿ����

echo,

echo,�ȴ�2��...

echo,

ping /n 2 127.1>nul

rd /s /q ��ʱ�ļ���

goto begin

rem ----------------------------------------------------------------------------------�������ļ� end

rem ----------------------------------------------------------һ��goto

:exit

cls

echo,

echo,�����˳�

echo,

ping /n 2 127.1>nul

exit

rem ------------------------------------------continuelss

:continuelss

set "geming="

echo,  TRACK 0%id% AUDIO >>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("��ʱ�ļ���\��������.zlb") do (

call :����2 "%%~i"

goto finish����2

)

:finish����2

if defined geming (

echo,    TITLE %geming% >>��ʱ�ļ�.zlb

) else (echo,    TITLE " " )>>��ʱ�ļ�.zlb

if defined performer (

echo,    PERFORMER %performer% >>��ʱ�ļ�.zlb

) else (echo,    PERFORMER " " )>>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("��ʱ�ļ���\ʱ������(������).zlb") do (

call :ʱ��1 "%%~i"

goto finishʱ��2

)

:finishʱ��2

(echo,    INDEX 00 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% 

echo,    INDEX 01 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% )>>��ʱ�ļ�.zlb

goto :daochu

rem ------------------------------------------continuelss end

rem ------------------------------------------continuegtr

:continuegtr

set "geming="

echo,  TRACK %id% AUDIO >>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("��ʱ�ļ���\��������.zlb") do (

call :����2 "%%~i"

goto finish����3

)

:finish����3

if defined geming (

echo,    TITLE %geming% >>��ʱ�ļ�.zlb

) else (echo,    TITLE " " )>>��ʱ�ļ�.zlb

if defined performer (

echo,    PERFORMER %performer% >>��ʱ�ļ�.zlb

) else (echo,    PERFORMER " " )>>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("��ʱ�ļ���\ʱ������(������).zlb") do (

call :ʱ��1 "%%~i"

goto finishʱ��3

)

:finishʱ��3

(echo,    INDEX 00 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% 

echo,    INDEX 01 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% )>>��ʱ�ļ�.zlb

goto :daochu

rem ------------------------------------------continuegtr end

rem ------------------------------------------overlss

:overlss

echo,  TRACK 0%id% AUDIO >>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("��ʱ�ļ���\��������.zlb") do (

call :����2 "%%~i"

goto finish����4

)

:finish����4

if defined geming (

echo,    TITLE %geming% >>��ʱ�ļ�.zlb

) else (echo,    TITLE " " )>>��ʱ�ļ�.zlb

if defined performer (

echo,    PERFORMER %performer% >>��ʱ�ļ�.zlb

) else (echo,    PERFORMER " " )>>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("��ʱ�ļ���\ʱ������(������).zlb") do (

call :ʱ��1 "%%~i"

goto finishʱ��4

)

:finishʱ��4

(echo,    INDEX 01 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% )>>��ʱ�ļ�.zlb

goto beifen

rem ------------------------------------------overlss end

rem ------------------------------------------overgtr

:overgtr

echo,  TRACK %id% AUDIO >>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("��ʱ�ļ���\��������.zlb") do (

call :����2 "%%~i"

goto finish����5

)

:finish����5

if defined geming (

echo,    TITLE %geming% >>��ʱ�ļ�.zlb

) else (echo,    TITLE " " )>>��ʱ�ļ�.zlb

if defined performer (

echo,    PERFORMER %performer% >>��ʱ�ļ�.zlb

) else (echo,    PERFORMER " " )>>��ʱ�ļ�.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("��ʱ�ļ���\ʱ������(������).zlb") do (

call :ʱ��1 "%%~i"

goto finishʱ��5

)

:finishʱ��5

(echo,    INDEX 01 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% )>>��ʱ�ļ�.zlb

goto beifen

rem ------------------------------------------overgtr end

:MC

cls

set pathly=exit

if not exist ��ʱ�ļ��� md ��ʱ�ļ���

cd.>��ʱ�ļ���\MC.txt

cd.>��ʱ�ļ���\δ����.txt

for /l %%i in (1,1,50) do (

set a[%%i]=

set b[%%i]=

)

set "number3="

echo,

echo,����ʱ�ļ���\MC.txt��δ����.txt�����������������(һ��һ������)

echo,

echo,������Ϻ󽫺��и�����ݵ��ı������߱�׼��ʽ����Ϣ�ļ��ϵ�������

echo,

echo,·���п���ʹ���������^&�ȣ���%%Ҫ��%%ת��

echo,

echo,��������exit(Ĭ��)

echo,

set /p pathly=·�� 

set pathly="%pathly:"=%"

       ::ȥ�������е�����

call :��ȡԴ��Ϣ %pathly%

if /i "%pathly%"=="exit" goto begin

set "wjlx="

       ::�ļ�����˵������(��׼��ʽ:���ű����ɵ�CUE�ı�����һ��ʱ�������ı�)

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::����" set wjlx=bz&goto �����жϽ���2

)

set wjlx=pt

:�����жϽ���2

cd.>"%pathmb%��ʱ�ļ�.txt"

for /f "usebackq tokens=* delims=" %%i in ("%pathly%") do (

echo,%%i>>"%pathmb%��ʱ�ļ�.txt"

)

del /q /s "%pathly%"

ren "%pathmb%��ʱ�ļ�.txt" "%name%%type%"

cls

for /f "usebackq tokens=* delims= " %%i in ("��ʱ�ļ���\MC.txt") do (

call :defined %%i

)

for /f "usebackq tokens=* delims= " %%i in ("��ʱ�ļ���\δ����.txt") do (

call :δ���� %%i

)

cd.>"%pathmb%%name%(��ʱ).txt"

if /i "%wjlx%"=="pt" call :��ͨ

if /i "%wjlx%"=="bz" call :��׼

del /q /s "%pathly%"

cls

echo,

echo,���

ren "%pathmb%%name%(��ʱ).txt" "%name%%type%"

ping /n 2 127.1>nul

goto begin

rem ----------------------------------------------------------һ��goto end

rem ----------------------------------------------------------һ��call

:δ����

set b[%1]=δ����

goto :eof

:defined

set a[%1]=MC

goto :eof

:�������ݸ���

set /a number=%number%+1

goto :eof

:filename

set filename="%~1"

set filename="%filename:"=%"

set filename2=%filename%

set filename=%filename:&=^&%

set filename=%filename:|=^|%

goto :eof

:����2

set geming="%~1"

set geming="%geming:"=%"

goto :eof

:ʱ��1

set shijian="%~1"

set shijian=%shijian:"=%

goto :eof

:����1

set geming="%~1"

set geming="%geming:"=%"

goto :eof

:file

set file="%~1"

set file="%file:"=%"

goto :eof

:file2

set file="%~1"

set file="%file:"=%"

set file=%file:&=^&%

set file=%file:|+^|%

goto :eof

:title

set title="%~1"

set title="%title:"=%"

goto :eof

:performer

set performer="%~1"

set performer="%performer:"=%"

goto :eof

:��׼�ļ�ʱ�䵼��

cd.>"��ʱ�ļ���\ʱ������(δ����).zlb"

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::ʱ�� end" goto ����ѭ��1

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>>"��ʱ�ļ���\ʱ������(δ����).zlb"

   ) else echo,%%j#K>>"��ʱ�ļ���\ʱ������(δ����).zlb"

 )

if "%%j"=="::ʱ��" set "kz=on"&echo,�ҵ�ʱ�䱣��λ��

)

:����ѭ��1

set "kz="

goto :eof

:��ͨ�ļ�ʱ�䵼��

cd.>"��ʱ�ļ���\ʱ������(δ����).zlb"

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

echo,%%i#K>>"��ʱ�ļ���\ʱ������(δ����).zlb"

)

goto :eof

:��׼�ļ���������

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::���� end" goto ����ѭ��2

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>>"��ʱ�ļ���\��������.zlb"

   ) else echo,%%j#K>>"��ʱ�ļ���\��������.zlb"

 )

if "%%j"=="::����" set "kz=on"&echo,�ҵ���������λ��

)

:����ѭ��2

set "kz="

goto :eof

:��ͨ�ļ���������

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

echo,%%i#K>>"��ʱ�ļ���\��������.zlb"

)

goto :eof

:��ȡԴ��Ϣ

set pathly="%~1"

set pathly=%pathly:&=^&%

set pathly=%pathly:|=^|%

set pathly1="%~1"

set pathly1=%pathly1:&=^&%

set pathly1=%pathly1:|=^|%

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

set pathly1=%pathly1:"=%

set pathmb=%pathmb:"=%

set name=%name:"=%

set type=%type:"=%

goto :eof

rem ----------------------------------------------------------һ��call end

rem ----------------------------------------------------------����call

rem ----------------------------------------------------------����call end

rem ----------------------------------------------------------����call

:��ͨ

if "%wjlx%"=="bz" (

set pathly1=��ʱ�ļ���\�������.zlb

)

set number=1

set number2=0

set number3=0

for /f "usebackq tokens=* delims= " %%i in ("%pathly1%") do (

call :number3add

 )

)

:back

if %number2% equ %number3% goto finish

if defined a[%number%] echo,rem #mc>>"%pathmb%%name%(��ʱ).txt"&set /a number=%number%+1&goto :back

if defined b[%number%] echo,rem #δ����>>"%pathmb%%name%(��ʱ).txt"&set /a number=%number%+1&goto :back

if %number2% equ 0 (

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly1%") do (

if "%%i"=="rem " (

>>"%pathmb%%name%(��ʱ).txt" echo,rem #%%j&set /a number2=%number2%+1&set /a number=%number%+1&goto back

   )else (>>"%pathmb%%name%(��ʱ).txt" echo,rem #%%i&set /a number2=%number2%+1&set /a number=%number%+1&goto back)

 )

)

for /f "usebackq tokens=1,* skip=%number2% delims=#" %%i in ("%pathly1%") do (

if "%%i"=="rem " (

>>"%pathmb%%name%(��ʱ).txt" echo,rem #%%j&set /a number2=%number2%+1&set /a number=%number%+1&goto back

   )else (>>"%pathmb%%name%(��ʱ).txt" echo,rem #%%i&set /a number2=%number2%+1&set /a number=%number%+1&goto back)

 )

)

goto back

:��׼

for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (

if "%%i"=="rem #::����" goto finishqian

>>"%pathmb%%name%(��ʱ).txt" echo,%%i

)

:finishqian

echo,rem #::����>>"%pathmb%%name%(��ʱ).txt"

set act=

cd.>��ʱ�ļ���\�������.zlb

for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (

if "%%i"=="rem #::���� end" goto finishqian2

if defined act (>>��ʱ�ļ���\�������.zlb echo,%%i)

if "%%i"=="rem #::����" set act=act

)

:finishqian2

call :��ͨ

set act=

echo,rem #::���� end>>"%pathmb%%name%(��ʱ).txt"

for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (

if defined act (

>>"%pathmb%%name%(��ʱ).txt" echo,%%i

)

if "%%i"=="rem #::���� end" set act=act

)

goto :eof

rem ----------------------------------------------------------����call end

rem ----------------------------------------------------------����goto

:finish

goto :eof

rem ----------------------------------------------------------����goto end

rem ----------------------------------------------------------����call

:number3add

set /a number3=%number3%+1

goto :eof

rem ----------------------------------------------------------����call end

