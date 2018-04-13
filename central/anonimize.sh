#!/bin/bash
set -e

export MYSQL_DATABASE=$CLIENT

# wait for server
printf ">>> Waiting for DB server"
while ! mysqladmin ping -h 127.0.0.1 --silent; do
    sleep 1
    printf "."
done
echo " [OK]"

echo ">>> Loading dump into DB"
zcat ${ORIGIN_FILE_PATH} | mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE

echo ">>> Anonymizing"
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /script_anonimizar.sql

echo ">>> Creating dump"
mysqldump -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE | gzip > ${TARGET_FILE_FOLDER}/${TARGET_FILE_NAME}

echo ">>> Changing owner of dump file"
chown $FINAL_FILE_OWNER ${TARGET_FILE_FOLDER}/${TARGET_FILE_NAME}

echo ">>> Done!"
