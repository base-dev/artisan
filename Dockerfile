FROM tghs/phpcli

# NOTE: This image installs dependencies for artisan, but not artisan
# itself.

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y \
    php7.0-mcrypt \
    php7.0-mongodb \
#   php7.0-mssql \   # not in debian yet
#   php7.0-mysqlnd \ # not in debian yet
    php7.0-mysql \
    php7.0-pgsql \
    php7.0-redis \
    php7.0-sqlite3 \
    php7.0-gd

RUN mkdir -p /data
VOLUME ["/data"]
WORKDIR /data

EXPOSE 8000

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["serve", "--host=0.0.0.0"]
