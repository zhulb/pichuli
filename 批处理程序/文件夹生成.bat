@echo off
set file="AKB�糡�����ļ���\STAGES ���`��A" "AKB�糡�����ļ���\STAGES ���`��K" "AKB�糡�����ļ���\STAGES ���`��B" "AKB�����ļ���" "�ɤ������ߤ�꠵����ļ���" "AKB AX"
for %%a in (%file%) do (
set pathly=%%i
call :setup
)
echo,&echo,���
pause>nul
exit
:setup
call ��������\��������.bat 1 1
echo,%pathly:"=%
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
1st Stage ��PARTY��ʼ�ޤ�衹
2nd Stage ���ᤤ�����ä���
3rd Stage ���l���Τ���ˡ�
4th Stage ���������ޡ������С�
5th Stage �����۽�ֹ������
6th Stage ��Ŀ���ߡ�
::AKB�糡�����ļ���\STAGES ���`��A end
::AKB�糡�����ļ���\STAGES ���`��K
1st Stage ��PARTY��ʼ�ޤ�衹
2nd Stage ���ഺ���`�륺��
3rd Stage ��×�ڥѥ��������
4th Stage ����K�٥뤬�Q�롹
5th Stage �����Ϥ��꡹
6th Stage ��RESET��
::AKB�糡�����ļ���\STAGES ���`��K end
::AKB�糡�����ļ���\STAGES ���`��B
1st Stage ���ഺ���`�륺��
2nd Stage ���ᤤ�����ä���
3rd Stage ���ѥ���ޥɥ饤�֡�
4th Stage �������ɥ��ҹ������
5th Stage ���������`��Ů��
::AKB�糡�����ļ���\STAGES ���`��B end
::AKB�����ļ���
��������01st �@�λ��Ӥ餿��
��������02st �����`�ȡ��Ҥ��
01st �ᤤ�����ä�
02nd �Ʒ���аħ�򤹤�
03rd �X�路�Ƥ�������
04th BINGO!
05th �W��̫�
06th Ϧꖤ�Ҋ�Ƥ��뤫
07th ��ޥ󥹡������
08th �@�λ��Ӥ餿��2008
09th Baby! Baby! Baby!
10th �������������
11th 10��@
12th �極�ץ饤��!
13th �Ԥ��UMaybe
14th RIVER
15th �@�Ζ�
16th �ݥ˩`�Ʃ`��ȥ��奷��
17th �إө`��`�Ʃ`�����
18th Beginner
19th ����󥹤�혷�
20th �@��ľ�ˤʤ�
21st Everyday, ������`����
22nd �ե饤�󥰥��å�
23rd �L�ϴ����Ƥ���
24th �Ϥ���ޥꥳ
25th GIVE ME FIVE!
26th ���Ĥ�Sounds good!
::AKB�����ļ��� end
::�ɤ������ߤ�꠵����ļ���
01st �तδ�����������å���
02nd ���ݻ���
03rd ��赤����Τ�
04th ���å���٘�
05th �ഺ�Υե�å�
06th �����
07th �Х�󥿥��󣮥��å�
08th �ؤ��äԥ�����
::�ɤ������ߤ�꠵����ļ��� end
::AKB AX
AKB AX 2008
AKB AX 2009
AKB AX 2010
AKB AX 2011
AKB AX 2012
AKB AX 2013
::AKB AX end
