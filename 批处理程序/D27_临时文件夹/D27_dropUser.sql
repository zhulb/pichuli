drop user zjdms cascade;
create user zjdms identified by zjdms default tablespace zhbg;
grant connect,resource to zjdms;
grant dba to zjdms;
exit;
