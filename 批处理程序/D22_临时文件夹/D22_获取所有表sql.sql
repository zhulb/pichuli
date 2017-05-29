conn zjdms/zjdms;
spool "D22_临时文件夹\D22_获取所有表sql.txt"
select 'table '||table_name from all_tables where owner='ZJDMS';
spool off;
exit;
exit;
