@echo off
:start
cls
echo,1、启动全文检索服务器
echo,退出请输入e
>nul choice /c 123456789e
if %errorlevel%==1 (
	cls
	pushd "D:\solr_tomcat\bin\"
	start " " "D:\solr_tomcat\bin\startup.bat"
	popd
) else if %errorlevel%==2 (
	cls
	echo,在.classpth问中配置
	echo,另外，在windows中无法重命名来生成一个.开头的文件
	echo,但可以通过cmd命来生成或者重命名为.开头的文件
) else if %errorlevel%==3 (
	cls
	echo,通过sql查询
	echo,select * from user_directories
)else if %errorlevel%==4 (
	cls
	echo,自己以前写的类要加到公司的类中比较麻烦，主要就是因为包名无法统一
	echo,故考虑写个类，能够重新设计包结构
) else if %errorlevel%==5 (
	cls
	echo,插入图片---用于照片上传的默认照片
	echo,在appFile表中创建字段  file_data_clob
	echo,
) else if %errorlevel%==6 (
	cls
	echo,生成32位的unid  com.linewell.core.util.UNIDGenerate
	echo,
) else if %errorlevel%==7 (
	cls
	echo,	 * @see ...
	echo,	 * @deprecated ...
	echo,	 第一个用于提示新方法是什么
	echo,	 第二个可以描述过时信息，并且显示过时的横线
) else if %errorlevel%==8 (
	cls
	echo,1、以前写了项目的表结构
	echo,   考虑用批处理到处所有表的表结构，然后用excel宏编辑格式，最后保存到word的表格中
) else if %errorlevel%==10 (
	echo,即将推出！
	goto :exit
)
pause>nul
goto :start
:exit
ping /n 2 127.1>nul
exit
