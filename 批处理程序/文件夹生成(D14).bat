@echo off
set file="AKB�糡�����ļ���\STAGES ���`��A" "AKB�糡�����ļ���\STAGES ���`��K" "AKB�糡�����ļ���\STAGES ���`��B" "AKB�����ļ���" "�ɤ������ߤ�꠵����ļ���" "AKB AX" 
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
::AKB�糡�����ļ���\STAGES ���`��A
::AKB�糡�����ļ���\STAGES ���`��A end
::AKB�糡�����ļ���\STAGES ���`��K
::AKB�糡�����ļ���\STAGES ���`��K end
::AKB�糡�����ļ���\STAGES ���`��B
::AKB�糡�����ļ���\STAGES ���`��B end
::AKB�����ļ���
::AKB�����ļ��� end
::�ɤ������ߤ�꠵����ļ���
::�ɤ������ߤ�꠵����ļ��� end
::AKB AX
::AKB AX end
