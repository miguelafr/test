FROM mysql:5.6

COPY ["docker-entrypoint.sh", "/usr/local/bin/"]

ENV ORIGIN_FILE_PATH=/central.sql.gz \
    TARGET_FILE_FOLDER=/output \
    TARGET_FILE_NAME=central_anonymized.sql.gz \
    FINAL_FILE_OWNER=mysql \
    CLIENT=\
    MYSQL_ROOT_PASSWORD=password

COPY ["script_anonimizar.sql", "anonimize.sh", "/"]

CMD ["mysqld", "--character-set-server=utf8", "--collation-server=utf8_unicode_ci", "--max-allowed-packet=128M"]