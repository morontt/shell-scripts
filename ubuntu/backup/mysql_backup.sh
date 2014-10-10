#!/bin/bash

databases="dbname1 dbname2 dbname3"

currentdate=`date '+%Y%m%d'`

for database in $databases; do
    dumpname=$currentdate"_"$database
    mysqldump -h localhost -u dbuser --password=dbpassword $database | gzip > /path/to/backup/$dumpname.gz
done
