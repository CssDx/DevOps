FROM postgres:15.6

RUN mkdir -p /etc/postgresql/ 
RUN chmod 750 /var/lib/postgresql/data

ENTRYPOINT [ "bash", "-c", "\
cat <<EOF > /etc/postgresql/postgresql.conf \n\
listen_addresses = 'localhost, ${DB_REPL_HOST}' \n\
port = ${DB_REPL_PORT} \n\
EOF\n\
rm -rf /var/lib/postgresql/data/* \n\
sleep 10 \n\
echo ${DB_REPL_PASSWORD} | pg_basebackup -v -R \\\n\
  -h ${DB_HOST} -p ${DB_PORT} -U ${DB_REPL_USER} -W -P \\\n\
  -D /var/lib/postgresql/data \n\
docker-entrypoint.sh $@"]

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
