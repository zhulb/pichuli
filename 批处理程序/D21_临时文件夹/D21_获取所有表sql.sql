conn zjdms/zjdms;
spool "D21_临时文件夹\D21_获取所有表sql.txt"
select 'table '||table_name from all_tables where owner='zjdms';
spool off;
exit;
exit;
