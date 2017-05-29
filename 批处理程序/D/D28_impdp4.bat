@echo off
pushd ..
popd
set D28_message="%~n0"
set D28_pathmb="%~dp0"
set D28_pathmb=%D28_pathmb:~0,-4%
pushd %D28_pathmb%
::Ö÷´úÂë
rem ----------------------------------------------------------Ö÷´úÂë
:D28_start

ping /n 127.1>nul
echo,µÇÂ½ÑéÖ¤...(ÇëÊäÈëz)
setlocal EnableDelayedExpansion
echo,z|choice /c abcdefghijklmnopqrstuvwxyz>nul
echo,%errorlevel%
endlocal
echo,%errorlevel%
if not "%errorlevel%"=="26" (
	goto D28_start
)

cls
for /l %%i in (1,1,1) do (
	call :D28_speak
)
echo,
echo,OracleÊı¾İ¿âÅúÁ¿µ¼ÈëdmpÎÄ¼ş

echo,ËµÃ÷£º1¡¢dmpÎÄ¼ş·ÅÈëÅú´¦ÀíËùÔÚÎÄ¼ş¼Ğ
echo,      2¡¢ÎÄ¼şÃûÖ»ÄÜÊÇÅäÖÃµ±ÖĞµÄÃû³Æ
echo,Çë°´ÈÎÒâ¼ü¿ªÊ¼
pause>nul

if not exist D28_ÁÙÊ±ÎÄ¼ş¼Ğ (
	md D28_ÁÙÊ±ÎÄ¼ş¼Ğ
)
cd.>D28_ÁÙÊ±ÎÄ¼ş¼Ğ\ÈÕÖ¾.txt


rem ·ÇÅäÖÃÎÄ¼şÅäÖÃ
call a\a26_dpdump.bat D28_Oracle.directory 1
cls
rem set D28_Oracle.directory=D:\oracle10g\admin\orcl\dpdump
set D28_Oracle.dbaName=sys
set D28_Oracle.dbaPwd=orcl
set D28_Oracle.dbaDatabase=orcl

rem ¼ÓÔØÓÃ»§ĞÅÏ¢
call a\a18_SimpleTable.bat "%~0" ::D28_userdata D28_users
echo,%users.list[]%



rem ÓÃ»§Ñ¡ÔñÒªµ¼ÈëµÄÎÄ¼ş
for /l %%i in (1,1,%D28_users.list[]%) do (
	call :D28_STRING.show %%i %%D28_users.list[%%i].name%%
)
echo,ÇëÊäÈëÒªµ¼ÈëµÄÓÃ»§
echo,Àı[]  ÊäÈë1 2 3 4(×¢Òâ£º²»ÒªÖØ¸´)
set /p D28_string$=

rem µ¼ÈëdmpÎÄ¼ş

set D28_string=
for /l %%i in (1,1,%D28_users.list[]%) do (
	call :D28_String.append %%i
)

set D28_num=1
for %%i in (%D28_string$%) do (
	call :D28_ORACLE.impdp %%D28_users.list[%%i].name%% %%D28_users.list[%%i].pwd%% %%D28_users.list[%%i].database%% %%D28_users.list[%%i].tablespace%%
)

pause
exit
::Ò»²ãc
rem ----------------------------------------------------------Ò»²ãc
::º¯Êı1
:D28_STRING.show
echo,%1¡¢%2
goto :eof

:D28_speak
rem mshta vbscript:createobject("sapi.spvoice").speak("»¶Ó­Ê¹ÓÃ and merry christmas and happy new year!")(window.close)
rem mshta vbscript:createobject("sapi.spvoice").speak("ÖìĞ¡Çà")(window.close)
goto :eof




:D28_String.append

if "%D28_string%"=="" (
	set D28_string=%1
) else (
	set D28_string=%D28_string% %1
)
goto :eof

:D28_ORACLE.impdp
ping /n 4 127.1>nul
cls
echo,ÕıÔÚµ¼ÈëµÚ%D28_num%¸ö(¹²%D28_user.count%)%1.dmp...
if not exist "%~dp0""%~1".dmp (
	>>D28_ÁÙÊ±ÎÄ¼ş¼Ğ\ÈÕÖ¾.txt echo,%1.dmpÎÄ¼ş²»´æÔÚ
	echo,ÌáÊ¾£ºÎÄ¼ş²»´æÔÚ---%1.dmp
	echo,Çë²é¿´ÈÕÖ¾ÎÄ¼ş!
	ping /n 2 127.1>nul
	goto :eof
)
echo,Ò»¡¢É¾³ıÓÃ»§
echo,1¡¢Éú³ÉÖØ½¨ÓÃ»§sqlÎÄ¼ş
(echo,drop user %1 cascade;
echo,create user %1 identified by %1 default tablespace zhbg;
echo,grant connect,resource to %1;
echo,grant dba to %1;
echo,exit;
)>D28_ÁÙÊ±ÎÄ¼ş¼Ğ\D28_dropUser.sql
echo,2¡¢Ö´ĞĞsql£¬ÖØ½¨ÓÃ»§
sqlplus sys/orcl as sysdba@orcl @D28_ÁÙÊ±ÎÄ¼ş¼Ğ\D28_dropUser.sql
echo,¶ş¡¢¿½±´ÎÄ¼ş
echo,1¡¢É¾³ı¾ÉÎÄµµ
if exist %D28_Oracle.directory%\%1.dmp (
	del %D28_Oracle.directory%\%1.dmp
)
echo,2¡¢¿½±´ÎÄ¼ş
copy "%~dp0""%~1".dmp %D28_Oracle.directory%
echo,Èı¡¢µ¼ÈëÎÄ¼ş(ÆÁ±ÎÊä³ö)...
::1>nul 2>nul @impdp %1/%1 dumpfile=%1.dmp logfile=%1.log
impdp %1/%2 dumpfile=%1.dmp logfile=%1.log
set /a D28_num=%D28_num%+1
goto :eof
::º¯Êı1 end
::º¯Êı2
::º¯Êı2 end
rem ----------------------------------------------------------Ò»²ãc end
::Ò»²ãc end
::¶ş²ãc
rem ----------------------------------------------------------¶ş²ãc
rem ----------------------------------------------------------¶ş²ãc end
::¶ş²ãc end
::Èı²ãc
rem ----------------------------------------------------------Èı²ãc
rem ----------------------------------------------------------Èı²ãc end
::Èı²ãc end
::ËÄ²ãc
rem ----------------------------------------------------------ËÄ²ãc
rem ----------------------------------------------------------ËÄ²ãc end
::ËÄ²ãc end
::Îå²ãc
rem ----------------------------------------------------------Îå²ãc
rem ----------------------------------------------------------Îå²ãc end
::Îå²ãc end
::½Å±¾ËµÃ÷
rem ----------------------------------------------------------½Å±¾ËµÃ÷
rem ----------------------------------------------------------½Å±¾ËµÃ÷ end
::½Å±¾ËµÃ÷ end
::ÊôĞÔËµÃ÷
¡¾µ÷ÓÃ-±»µ÷ÓÃ¡¿:µ÷ÓÃ
¡¾ÎÄ¼ş¹¦ÄÜÀà ¡¿:
¡¾ÎÄ¼şÃû³Æ   ¡¿:
::ÊôĞÔËµÃ÷ end
:exit
cls
echo,&echo,¼´½«ÍË³ö!
ping /n 2 127.1>nul
exit

rem ÅäÖÃÎÄ¼şÅäÖÃ
rem ÓÃ»§±í
::D28_userdata
name;pwd;database;tablespace
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
::D28_userdata_end

rem ----------------------------------------------------------Ö÷´úÂë end
::Ö÷´úÂë end