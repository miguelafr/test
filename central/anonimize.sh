#!/bin/bash
set -e

export MYSQL_DATABASE=$DB_NAME
export MYSQL_USER=$DB_NAME
export MYSQL_PASSWORD=password

# RUN original entrypoint on background
docker-entrypoint.sh mysqld \
    --explicit-defaults-for-timestamp=1 \
    --character-set-server=utf8 \
    --collation-server=utf8_unicode_ci \
    --max-allowed-packet=128M \
    --datadir=/tmp/mysql &

# wait for server
while ! mysqladmin ping -h 127.0.0.1 --silent; do
    sleep 1
done

echo ">>> Loading dump into DB"
zcat ${ORIGIN_FILE_PATH} | mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE

echo ">>> Anonymizing"
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /script_anonimizar.sql

echo ">>> Creating dump"
mysqldump -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE | gzip > ${TARGET_FILE_FOLDER}/${TARGET_FILE_NAME}

echo ">>> Done!"
