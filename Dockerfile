FROM localhost:5000/tghs-phpcli

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y \
    php7.0-mcrypt \
#   php7.0-mongo \   # not in debian yet
#   php7.0-mssql \   # not in debian yet
#   php7.0-mysqlnd \ # not in debian yet
    php7.0-pgsql \
#   php7.0-redis \   # not in debian yet
    php7.0-sqlite3 \
    php7.0-gd

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["php", "artisan"]
CMD ["--help"]