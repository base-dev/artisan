FROM tghs/phpcli

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

ENTRYPOINT ["php", "artisan"]
CMD ["--help"]
