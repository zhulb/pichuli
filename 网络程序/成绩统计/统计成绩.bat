@echo off
md ��ʱ�ļ���
cd.>��ʱ�ļ���\�ɼ�.txt
:begin
cls
set "pathly=exit"
echo,
echo,·��������^&��������ţ���%%Ҫ��%%ת�����
echo,
echo,ֱ���ϰ����������ı�������(ѧ�Ŵ�С����)
echo,
echo,����main���������ĳɼ�����
echo,
echo,�˳�:exit(Ĭ��)
echo,
set /p pathly=·�� 
set pathly="%pathly:"=%"        ::ȥ�������е�����
call :��ȡԴ��Ϣ %pathly%
if "%pathly%"=="exit" goto exit
if "%pathly%"=="main" goto main1
set id=1
for /f "usebackq tokens=* delims= " %%i in ("%pathly%") do (
cls
call :main %%i
)
cls
echo,���!��������������!
ping /n 4 127.1>nul
goto begin
rem ----------------------------------------------------------һ��goto��
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit
:main1
cls
echo,���ɼ������ı��ϵ�������
set /p pathly=·�� 
set pathly="%pathly:"=%"        ::ȥ�������е�����
call :��ȡԴ��Ϣ %pathly%
echo,���ڵ���...
cd.>��ʱ�ļ���\ѧ��.txt
cd.>��ʱ�ļ���\����.txt
cd.>��ʱ�ļ���\�ɼ�1.txt
cd.>��ʱ�ļ���\�ɼ�2.txt
cd.>��ʱ�ļ���\�ɼ�3.txt
cd.>��ʱ�ļ���\�ɼ�4.txt
cd.>��ʱ�ļ���\�ɼ�5.txt
cd.>��ʱ�ļ���\�ɼ�6.txt
cd.>��ʱ�ļ���\all.txt

for /f "usebackq tokens=1,2,3,4,5,6,7,8,* delims=#" %%i in ("%pathly%") do (
>>��ʱ�ļ���\����.txt echo,%%i
>>��ʱ�ļ���\ѧ��.txt echo,%%j
>>��ʱ�ļ���\�ɼ�1.txt echo,%%k
>>��ʱ�ļ���\�ɼ�2.txt echo,%%l
>>��ʱ�ļ���\�ɼ�3.txt echo,%%m
>>��ʱ�ļ���\�ɼ�4.txt echo,%%n
>>��ʱ�ļ���\�ɼ�5.txt echo,%%o
>>��ʱ�ļ���\�ɼ�6.txt echo,%%p
>>��ʱ�ļ���\all.txt echo,%%q
)
echo,��ɵ���!�����������˵�!
ping /n 4 127.1>nul
goto begin
rem ----------------------------------------------------------һ��goto��
rem ----------------------------------------------------------һ��call��
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
set type="%~x1"
set type=%type:&=^&%
set type=%type:|=^|%
set pathly=%pathly:"=%
set pathmb=%pathmb:"=%
set name=%name:"=%
set type=%type:"=%
goto :eof
:main
echo,����:%1
if %id% lss 10 (
echo,ѧ��:0907110%id%
) else (
echo,ѧ��:090711%id%
)

set /p cj1=�ɼ�һ:
if "%cj1%"=="exit" goto begin
set /p cj2=�ɼ���:
if "%cj2%"=="exit" goto begin
set /p cj3=�ɼ���:
if "%cj3%"=="exit" goto begin
set /p cj4=�ɼ���:
if "%cj4%"=="exit" goto begin
set /p cj5=�ɼ���:
if "%cj5%"=="exit" goto begin
set /p cj6=�ɼ���:
if "%cj6%"=="exit" goto begin

set /a all=%cj1%+%cj2%+%cj3%+%cj4%+%cj5%+%cj6%
if %id% lss 10 (
>>��ʱ�ļ���\�ɼ�.txt (echo,%1#0907110%id%#%cj1%#%cj2%#%cj3%#%cj4%#%cj5%#%cj6%#%all%)
) else (
>>��ʱ�ļ���\�ɼ�.txt (echo,%1#090711%id%#%cj1%#%cj2%#%cj3%#%cj4%#%cj5%#%cj6%#%all%)
)
set /a id=%id%+1
goto :eof
rem ----------------------------------------------------------һ��call��
