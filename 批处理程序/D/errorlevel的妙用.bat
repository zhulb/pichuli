@echo off
rem &&ǰ�������ɹ�ʱִ��  ||ǰ�������ʧ��ʱִ��
>nul copy D:\af.txt E:\&&echo,ok||echo,no

pause
exit

rem ����ĳ���˵��errorlevel�ڹرձ����ӳ���չ��ֵ���䣬��ʹ����ֵ���ڱ����ӳ���չ�Ĺ������趨�ĵ�
rem �����ӳ���չ�Ǳ��ػ��ģ����ж���ı����ڹرպ�ȫ����Ч��������ͨ��errorlevel������������Ϣ
rem ���ݵķ�ʽ�ǽ��choic

echo,%errorlevel%
setlocal enabledelayedexpansion
(echo,a|1>nul 2>nul choice /c abcdefghijklmnopqrstuvwxyz)
endlocal
echo,%errorlevel%
pause>nul