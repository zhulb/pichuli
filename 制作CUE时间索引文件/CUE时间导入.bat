@echo off

title CUE信息导入

:begin

cls

rem ----------------------------------------------------------------------------------导入时间数据

set pathly=exit

echo,

echo,将含有时间数据的文本、或者标准格式的信息文件拖到批处理

echo,

echo,路径中可以使用特殊符号^&等，但%%要用%%转义

echo,

echo,输入a来添加歌词的"MC、未命名"行

echo,

echo,退出:exit(默认)

echo,

set /p pathly=路径 

set pathly="%pathly:"=%"

       ::去掉变量中的引号

call :获取源信息 %pathly%

if "%pathly%"=="a" goto MC

if "%pathly%"=="exit" goto exit

set "wjlx="

       ::文件类型说明变量(标准格式:本脚本生成的CUE文本，或一般时间数据文本)

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::时间" set wjlx=bz&goto 类型判断结束

)

set wjlx=pt

:类型判断结束

if not exist 临时文件夹 md 临时文件夹

if "%wjlx%"=="bz" (

call :标准文件时间导入

) else call :普通文件时间导入

rem --------------------------------------------将时间数据保存到数组

setlocal EnableDelayedExpansion

set number=1

for /f "usebackq tokens=1,* delims=#" %%i in ("临时文件夹\时间数据(未排序).zlb") do (

set "a[!number!]=%%i"

set /a number=!number!+1

)

set /a number=!number!-1

cls

rem --------------------------------------------将时间数据保存到数组 end

rem --------------------------------------------排序

echo,正在排序...

echo,

rem ----------------------------------------------------------------------判断是否至少有一个时间

if not defined a[1] cls&echo,----------没有时间信息，无法排序&goto exit

rem ----------------------------------------------------------------------判断是否至少有一个时间 end

if !number! equ 1 goto finishpx

set id=1

:add id

for /l %%a in (!id!,1,!number!) do (

if !a[%id%]! gtr !a[%%a]! set change=!a[%id%]!&set a[!id!]=!a[%%a]!&set a[%%a]=!change!

)

set /a id=!id!+1

if !id! equ !number! goto finishpx

goto add id

rem --------------------------------------------排序 end

:finishpx

cd.>"临时文件夹\时间数据(已排序).zlb"

for /l %%a in (1,1,!number!) do (

echo,!a[%%a]!#K>>临时文件夹\时间数据^(已排序^).zlb

)

(echo,!number!)>"临时文件夹\时间数据个数.zlb"

endlocal

rem ----------------------------------------------------------------------------------导入时间数据 end

rem ----------------------------------------------------------------------------------导入歌名数据

cls

cd.>临时文件夹\歌名数据.zlb

set pathly=exit

echo,

echo,将含有歌名信息的文本、或者标准格式的信息文件拖到批处理

echo,

echo,歌名中可以使用特殊符号^&等，但%%要用%%转义

echo,

echo,路径中可以使用特殊符号^&等，但%%要用%%转义

echo,

echo,跳过:exit(默认)

echo,

set /p pathly=路径 

set pathly="%pathly:"=%"

         ::去掉变量中的引号

call :获取源信息 %pathly%

if "%pathly%"=="exit" goto 音乐文件路径

set "wjlx="

          ::文件类型说明变量(标准格式:本脚本生成的CUE文本，或一般时间数据文本)

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::歌名" set wjlx=bz&goto 类型判断结束1

)

set wjlx=pt

:类型判断结束1

if "%wjlx%"=="bz" (

call :标准文件歌名导入

) else call :普通文件歌名导入

rem ----------------------------------------------------------------------------------导入歌名数据

rem ----------------------------------------------------------------------------------音乐文件路径

:音乐文件路径

cls

cd.>临时文件夹\音乐文件路径.zlb

set pathly=exit

echo,

echo,将目标音乐文件拖到批处理上

echo,

echo,路径中可以使用特殊符号^&等，但%%要用%%转义

echo,

echo,跳过:exit(默认)

echo,

set /p pathly=路径 

set pathly="%pathly:"=%"

              ::去掉变量中的引号

call :获取源信息 %pathly%

if "%pathly%"=="exit" goto 其它信息填写

echo,"%name%%type%">临时文件夹\音乐文件路径.zlb

set nameoffile="%name%"

rem ----------------------------------------------------------------------------------音乐文件路径 end

rem ----------------------------------------------------------------------------------其它信息

:其它信息填写

copy 其它信息填写.zlb 临时文件夹\其它信息填写.zlb

cls

echo,

echo,----------请在临时文件夹\其它信息填写.zlb中输入其它信息

echo,

echo,----------若有标准文件或者不输入了可以跳过输入

echo,

echo,----------filename:CUE文件名

echo,

echo,----------title:专辑名称

echo,

echo,----------performer:演唱者

echo,

echo,----------请按任意键继续

pause>nul

cls

cd.>临时文件夹\filename.zlb

cd.>临时文件夹\performer.zlb

cd.>临时文件夹\title.zlb

set pathly=exit

echo,

echo,将含有其它信息数据的文本、或者标准格式的信息文件拖到批处理

echo,

echo,路径中可以使用特殊符号^&等，但%%要用%%转义

echo,

echo,跳过:exit(默认)

echo,

set /p pathly=路径 

set pathly="%pathly:"=%"

              ::去掉变量中的引号

call :获取源信息 %pathly%

if "%pathly%"=="exit" goto 信息导入完毕

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::filename end" goto 跳出循环3

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>"临时文件夹\filename.zlb"

   ) else echo,%%j#K>"临时文件夹\filename.zlb"

 )

if "%%j"=="::filename" set "kz=on"&echo,找到filename保存位置

)

:跳出循环3

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::performer end" goto 跳出循环4

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>"临时文件夹\performer.zlb"

   ) else echo,%%j#K>"临时文件夹\performer.zlb"

 )

if "%%j"=="::performer" set "kz=on"&echo,找到performer保存位置

)

:跳出循环4

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::title end" goto :信息导入完毕

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>"临时文件夹\title.zlb"

   ) else echo,%%j#K>"临时文件夹\title.zlb"

 )

if "%%j"=="::title" set "kz=on"&echo,找到title保存位置

)

rem ----------------------------------------------------------------------------------其它信息 end

:信息导入完毕

echo,

echo,等待2秒...

ping /n 2 127.1>nul

rem ----------------------------------------------------------------------------------输出到文件

cd.>临时文件.zlb

cls

echo,

echo,正在输出到文件...

echo,

rem -----------------------------------输出片头

echo,输出片头...

for /f "usebackq tokens=1,* delims=#" %%i in ("临时文件夹\performer.zlb") do (

call :performer "%%~i"

goto finishp

)

:finishp

if defined performer (

echo,PERFORMER %performer% >临时文件.zlb

) else (echo,PERFORMER " " )>临时文件.zlb

for /f "usebackq tokens=1,* delims=#" %%i in ("临时文件夹\title.zlb") do (

call :title "%%~i"

goto finisht

)

:finisht

if defined title (

echo,TITLE %title% >>临时文件.zlb

) else (echo,TITLE " " )>>临时文件.zlb

for /f "usebackq tokens=1,* delims=#" %%i in ("临时文件夹\音乐文件路径.zlb") do (

call :file "%%~i"

goto finishf

)

:finishf

if defined file (

echo,FILE %file% WAVE >>临时文件.zlb

) else (echo,FILE " " WAVE )>>临时文件.zlb

echo,  TRACK 01 AUDIO >>临时文件.zlb

for /f "usebackq tokens=1,* delims=#" %%i in ("临时文件夹\歌名数据.zlb") do (

call :歌名1 "%%~i"

goto finish歌名1

)

:finish歌名1

if defined geming (

echo,    TITLE %geming% >>临时文件.zlb

) else (echo,    TITLE " " )>>临时文件.zlb

if defined performer (

echo,    PERFORMER %performer% >>临时文件.zlb

) else (echo,    PERFORMER " " )>>临时文件.zlb

for /f "useback tokens=1,* delims=#" %%i in ("临时文件夹\时间数据(已排序).zlb") do (

call :时间1 "%%~i"

goto finish时间1

)

:finish时间1

echo,    INDEX 01 %shijian:~1,-4%:%shijian:~-4,-2%:%shijian:~-2% >>临时文件.zlb

rem -----------------------------------输出片头 end

for /f "usebackq tokens=* delims= " %%i in ("临时文件夹\时间数据个数.zlb") do (

set number=%%i

)

rem -----------------------------------导出歌名、时间

echo,输出歌名、时间...

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

rem -----------------------------------导出歌名、时间 end

rem ----------------------------------------------------------------------------------输出到文件 end

rem ----------------------------------------------------------------------------------制作备份

:beifen

echo,制作备份...

echo,

(echo,&echo,&echo,rem ----------------------------------------------------------------------信息备份

echo,rem #::filename)>>临时文件.zlb

set "filename="

for /f "usebackq tokens=1,* delims=#" %%i in ("临时文件夹\filename.zlb") do (

call :filename "%%~i"

)

if defined filename (

echo,rem #%filename%>>临时文件.zlb

) else (echo,rem #)>>临时文件.zlb

(echo,rem #::filename end)>>临时文件.zlb

(echo,&echo,

echo,rem #::performer)>>临时文件.zlb

if defined performer (

echo,rem #%performer%>>临时文件.zlb

) else (echo,rem #)>>临时文件.zlb

(echo,rem #::performer end)>>临时文件.zlb

(echo,&echo,

echo,rem #::title)>>临时文件.zlb

if defined title (

echo,rem #%title%>>临时文件.zlb

) else (echo,rem #)>>临时文件.zlb

(echo,rem #::title end)>>临时文件.zlb

(echo,&echo,

echo,rem #::file)>>临时文件.zlb

if defined file (

echo,rem #%file%>>临时文件.zlb

) else (echo,rem #)>>临时文件.zlb

(echo,rem #::file end)>>临时文件.zlb

(echo,&echo,&echo,&echo,rem #::时间)>>临时文件.zlb

for /f "usebackq tokens=1,* delims=#" %%i in ("临时文件夹\时间数据(已排序).zlb") do (

echo,rem #%%i>>临时文件.zlb

)

(echo,rem #::时间 end)>>临时文件.zlb

(echo,rem #共有%number%个数据&echo,&echo,

echo,rem #::歌名)>>临时文件.zlb

set number=1

for /f "usebackq tokens=1,* delims=#" %%i in ("临时文件夹\歌名数据.zlb") do (

echo,rem #%%i>>临时文件.zlb

call :歌名数据个数

)

set /a number=%number%-1

(echo,rem #::歌名 end)>>临时文件.zlb

(echo,rem #共有%number%个数据&echo,&echo,)>>临时文件.zlb

(echo,&echo,&echo,rem ----------------------------------------------------------------------信息备份 end)>>临时文件.zlb

rem ----------------------------------------------------------------------------------制作备份 end

rem ----------------------------------------------------------------------------------重命名文件

echo,完成备份

if defined filename (

ren "临时文件.zlb" %filename2%.cue

) else (

if defined file (

ren "临时文件.zlb" %nameoffile%.cue

  ) else ren "临时文件.zlb" "未命名CUE索引文件.cue"

)

echo,

echo,已经完成

echo,

echo,等待2秒...

echo,

ping /n 2 127.1>nul

rd /s /q 临时文件夹

goto begin

rem ----------------------------------------------------------------------------------重命名文件 end

rem ----------------------------------------------------------一层goto

:exit

cls

echo,

echo,即将退出

echo,

ping /n 2 127.1>nul

exit

rem ------------------------------------------continuelss

:continuelss

set "geming="

echo,  TRACK 0%id% AUDIO >>临时文件.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("临时文件夹\歌名数据.zlb") do (

call :歌名2 "%%~i"

goto finish歌名2

)

:finish歌名2

if defined geming (

echo,    TITLE %geming% >>临时文件.zlb

) else (echo,    TITLE " " )>>临时文件.zlb

if defined performer (

echo,    PERFORMER %performer% >>临时文件.zlb

) else (echo,    PERFORMER " " )>>临时文件.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("临时文件夹\时间数据(已排序).zlb") do (

call :时间1 "%%~i"

goto finish时间2

)

:finish时间2

(echo,    INDEX 00 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% 

echo,    INDEX 01 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% )>>临时文件.zlb

goto :daochu

rem ------------------------------------------continuelss end

rem ------------------------------------------continuegtr

:continuegtr

set "geming="

echo,  TRACK %id% AUDIO >>临时文件.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("临时文件夹\歌名数据.zlb") do (

call :歌名2 "%%~i"

goto finish歌名3

)

:finish歌名3

if defined geming (

echo,    TITLE %geming% >>临时文件.zlb

) else (echo,    TITLE " " )>>临时文件.zlb

if defined performer (

echo,    PERFORMER %performer% >>临时文件.zlb

) else (echo,    PERFORMER " " )>>临时文件.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("临时文件夹\时间数据(已排序).zlb") do (

call :时间1 "%%~i"

goto finish时间3

)

:finish时间3

(echo,    INDEX 00 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% 

echo,    INDEX 01 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% )>>临时文件.zlb

goto :daochu

rem ------------------------------------------continuegtr end

rem ------------------------------------------overlss

:overlss

echo,  TRACK 0%id% AUDIO >>临时文件.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("临时文件夹\歌名数据.zlb") do (

call :歌名2 "%%~i"

goto finish歌名4

)

:finish歌名4

if defined geming (

echo,    TITLE %geming% >>临时文件.zlb

) else (echo,    TITLE " " )>>临时文件.zlb

if defined performer (

echo,    PERFORMER %performer% >>临时文件.zlb

) else (echo,    PERFORMER " " )>>临时文件.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("临时文件夹\时间数据(已排序).zlb") do (

call :时间1 "%%~i"

goto finish时间4

)

:finish时间4

(echo,    INDEX 01 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% )>>临时文件.zlb

goto beifen

rem ------------------------------------------overlss end

rem ------------------------------------------overgtr

:overgtr

echo,  TRACK %id% AUDIO >>临时文件.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("临时文件夹\歌名数据.zlb") do (

call :歌名2 "%%~i"

goto finish歌名5

)

:finish歌名5

if defined geming (

echo,    TITLE %geming% >>临时文件.zlb

) else (echo,    TITLE " " )>>临时文件.zlb

if defined performer (

echo,    PERFORMER %performer% >>临时文件.zlb

) else (echo,    PERFORMER " " )>>临时文件.zlb

for /f "usebackq tokens=1,* skip=%skip% delims=#" %%i in ("临时文件夹\时间数据(已排序).zlb") do (

call :时间1 "%%~i"

goto finish时间5

)

:finish时间5

(echo,    INDEX 01 %shijian:~0,-4%:%shijian:~-4,-2%:%shijian:~-2% )>>临时文件.zlb

goto beifen

rem ------------------------------------------overgtr end

:MC

cls

set pathly=exit

if not exist 临时文件夹 md 临时文件夹

cd.>临时文件夹\MC.txt

cd.>临时文件夹\未命名.txt

for /l %%i in (1,1,50) do (

set a[%%i]=

set b[%%i]=

)

set "number3="

echo,

echo,在临时文件夹\MC.txt及未命名.txt中输入各自所在行数(一行一个数字)

echo,

echo,输入完毕后将含有歌词数据的文本、或者标准格式的信息文件拖到批处理

echo,

echo,路径中可以使用特殊符号^&等，但%%要用%%转义

echo,

echo,返回输入exit(默认)

echo,

set /p pathly=路径 

set pathly="%pathly:"=%"

       ::去掉变量中的引号

call :获取源信息 %pathly%

if /i "%pathly%"=="exit" goto begin

set "wjlx="

       ::文件类型说明变量(标准格式:本脚本生成的CUE文本，或一般时间数据文本)

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::歌名" set wjlx=bz&goto 类型判断结束2

)

set wjlx=pt

:类型判断结束2

cd.>"%pathmb%临时文件.txt"

for /f "usebackq tokens=* delims=" %%i in ("%pathly%") do (

echo,%%i>>"%pathmb%临时文件.txt"

)

del /q /s "%pathly%"

ren "%pathmb%临时文件.txt" "%name%%type%"

cls

for /f "usebackq tokens=* delims= " %%i in ("临时文件夹\MC.txt") do (

call :defined %%i

)

for /f "usebackq tokens=* delims= " %%i in ("临时文件夹\未命名.txt") do (

call :未命名 %%i

)

cd.>"%pathmb%%name%(临时).txt"

if /i "%wjlx%"=="pt" call :普通

if /i "%wjlx%"=="bz" call :标准

del /q /s "%pathly%"

cls

echo,

echo,完成

ren "%pathmb%%name%(临时).txt" "%name%%type%"

ping /n 2 127.1>nul

goto begin

rem ----------------------------------------------------------一层goto end

rem ----------------------------------------------------------一层call

:未命名

set b[%1]=未命名

goto :eof

:defined

set a[%1]=MC

goto :eof

:歌名数据个数

set /a number=%number%+1

goto :eof

:filename

set filename="%~1"

set filename="%filename:"=%"

set filename2=%filename%

set filename=%filename:&=^&%

set filename=%filename:|=^|%

goto :eof

:歌名2

set geming="%~1"

set geming="%geming:"=%"

goto :eof

:时间1

set shijian="%~1"

set shijian=%shijian:"=%

goto :eof

:歌名1

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

:标准文件时间导入

cd.>"临时文件夹\时间数据(未排序).zlb"

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::时间 end" goto 跳出循环1

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>>"临时文件夹\时间数据(未排序).zlb"

   ) else echo,%%j#K>>"临时文件夹\时间数据(未排序).zlb"

 )

if "%%j"=="::时间" set "kz=on"&echo,找到时间保存位置

)

:跳出循环1

set "kz="

goto :eof

:普通文件时间导入

cd.>"临时文件夹\时间数据(未排序).zlb"

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

echo,%%i#K>>"临时文件夹\时间数据(未排序).zlb"

)

goto :eof

:标准文件歌名导入

set "kz="

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

if "%%j"=="::歌名 end" goto 跳出循环2

if defined kz (

if /i not "%%i"=="rem " (

echo,%%i#K>>"临时文件夹\歌名数据.zlb"

   ) else echo,%%j#K>>"临时文件夹\歌名数据.zlb"

 )

if "%%j"=="::歌名" set "kz=on"&echo,找到歌名保存位置

)

:跳出循环2

set "kz="

goto :eof

:普通文件歌名导入

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly%") do (

echo,%%i#K>>"临时文件夹\歌名数据.zlb"

)

goto :eof

:获取源信息

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

rem ----------------------------------------------------------一层call end

rem ----------------------------------------------------------三层call

rem ----------------------------------------------------------三层call end

rem ----------------------------------------------------------二层call

:普通

if "%wjlx%"=="bz" (

set pathly1=临时文件夹\歌词数据.zlb

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

if defined a[%number%] echo,rem #mc>>"%pathmb%%name%(临时).txt"&set /a number=%number%+1&goto :back

if defined b[%number%] echo,rem #未命名>>"%pathmb%%name%(临时).txt"&set /a number=%number%+1&goto :back

if %number2% equ 0 (

for /f "usebackq tokens=1,* delims=#" %%i in ("%pathly1%") do (

if "%%i"=="rem " (

>>"%pathmb%%name%(临时).txt" echo,rem #%%j&set /a number2=%number2%+1&set /a number=%number%+1&goto back

   )else (>>"%pathmb%%name%(临时).txt" echo,rem #%%i&set /a number2=%number2%+1&set /a number=%number%+1&goto back)

 )

)

for /f "usebackq tokens=1,* skip=%number2% delims=#" %%i in ("%pathly1%") do (

if "%%i"=="rem " (

>>"%pathmb%%name%(临时).txt" echo,rem #%%j&set /a number2=%number2%+1&set /a number=%number%+1&goto back

   )else (>>"%pathmb%%name%(临时).txt" echo,rem #%%i&set /a number2=%number2%+1&set /a number=%number%+1&goto back)

 )

)

goto back

:标准

for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (

if "%%i"=="rem #::歌名" goto finishqian

>>"%pathmb%%name%(临时).txt" echo,%%i

)

:finishqian

echo,rem #::歌名>>"%pathmb%%name%(临时).txt"

set act=

cd.>临时文件夹\歌词数据.zlb

for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (

if "%%i"=="rem #::歌名 end" goto finishqian2

if defined act (>>临时文件夹\歌词数据.zlb echo,%%i)

if "%%i"=="rem #::歌名" set act=act

)

:finishqian2

call :普通

set act=

echo,rem #::歌名 end>>"%pathmb%%name%(临时).txt"

for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (

if defined act (

>>"%pathmb%%name%(临时).txt" echo,%%i

)

if "%%i"=="rem #::歌名 end" set act=act

)

goto :eof

rem ----------------------------------------------------------二层call end

rem ----------------------------------------------------------二层goto

:finish

goto :eof

rem ----------------------------------------------------------二层goto end

rem ----------------------------------------------------------三层call

:number3add

set /a number3=%number3%+1

goto :eof

rem ----------------------------------------------------------三层call end

