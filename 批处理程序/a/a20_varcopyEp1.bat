@echo off
pushd ..
:start


set /p a=�������:
call a/a20_varcopy.bat a a
echo,�Ѿ���a��ֵ��ֵ��b
echo,     ��b:%a.showvalue%��
goto :start


exit