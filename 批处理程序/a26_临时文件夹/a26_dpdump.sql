spool "a26_临时文件夹\a26_dpdump.txt";
select directory_path from dba_directories where directory_name='DATA_PUMP_DIR'/****注意要大写******/;
spool off;
exit;
