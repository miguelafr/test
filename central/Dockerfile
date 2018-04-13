FROM mysql:5.6

ENV ORIGIN_FILE_PATH=/original_dump.gz \
    TARGET_FILE_FOLDER=/output \
    TARGET_FILE_NAME=anonymized_dump.sql.gz \
    FINAL_FILE_OWNER=mysql \
    DB_NAME=\
    MYSQL_ROOT_PASSWORD=password

COPY ["script_anonimizar.sql", "anonimize.sh", "/"]

ENTRYPOINT []
CMD ["/anonimize.sh"]
