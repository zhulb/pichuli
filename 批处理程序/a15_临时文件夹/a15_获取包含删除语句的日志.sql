conn zjzhbg/zjzhbg;
spool "a15_临时文件夹\a15_包含删除语句的日志.txt";
select 'drop table '||table_name||';' from all_tables where owner='ZJZHBG';
spool off;
exit;
