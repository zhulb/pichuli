@echo off
:start
cls
echo,1������ȫ�ļ���������
echo,�˳�������e
>nul choice /c 123456789e
if %errorlevel%==1 (
	cls
	pushd "D:\solr_tomcat\bin\"
	start " " "D:\solr_tomcat\bin\startup.bat"
	popd
) else if %errorlevel%==2 (
	cls
	echo,��.classpth��������
	echo,���⣬��windows���޷�������������һ��.��ͷ���ļ�
	echo,������ͨ��cmd�������ɻ���������Ϊ.��ͷ���ļ�
) else if %errorlevel%==3 (
	cls
	echo,ͨ��sql��ѯ
	echo,select * from user_directories
)else if %errorlevel%==4 (
	cls
	echo,�Լ���ǰд����Ҫ�ӵ���˾�����бȽ��鷳����Ҫ������Ϊ�����޷�ͳһ
	echo,�ʿ���д���࣬�ܹ�������ư��ṹ
) else if %errorlevel%==5 (
	cls
	echo,����ͼƬ---������Ƭ�ϴ���Ĭ����Ƭ
	echo,��appFile���д����ֶ�  file_data_clob
	echo,
) else if %errorlevel%==6 (
	cls
	echo,����32λ��unid  com.linewell.core.util.UNIDGenerate
	echo,
) else if %errorlevel%==7 (
	cls
	echo,	 * @see ...
	echo,	 * @deprecated ...
	echo,	 ��һ��������ʾ�·�����ʲô
	echo,	 �ڶ�������������ʱ��Ϣ��������ʾ��ʱ�ĺ���
) else if %errorlevel%==8 (
	cls
	echo,1����ǰд����Ŀ�ı�ṹ
	echo,   �����������������б�ı�ṹ��Ȼ����excel��༭��ʽ����󱣴浽word�ı����
) else if %errorlevel%==10 (
	echo,�����Ƴ���
	goto :exit
)
pause>nul
goto :start
:exit
ping /n 2 127.1>nul
exit
