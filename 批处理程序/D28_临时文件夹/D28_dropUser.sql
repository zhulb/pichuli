drop user zjzhbg cascade;
create user zjzhbg identified by zjzhbg default tablespace zhbg;
grant connect,resource to zjzhbg;
grant dba to zjzhbg;
exit;
