FROM water/alpine

# 软件包安装
RUN apk add php7 \
        php7-fpm \
        php7-opcache \
        php7-session \
        php7-xml \
        php7-ctype \
        php7-gd \
        php7-json \
        php7-posix \
        php7-curl \
        php7-dom \
        php7-pdo \
        php7-pdo_mysql \
        php7-sockets \
        php7-zlib \
        php7-mcrypt \
        php7-mysqli \
        php7-sqlite3 \
        php7-bz2 \
        php7-phar \
        php7-posix \
        php7-zip \
        php7-calendar \
        php7-iconv \
        php7-imap \
        php7-soap \
        php7-dev \
        php7-pear \
        php7-pecl-redis \
        php7-mbstring \
        php7-exif \
        php7-xsl \
        php7-ldap \
        php7-openssl \
        php7-bcmath \
	    php7-tokenizer

# 从国内镜像安装composer，并配置成默认从国内镜像安装composer包
RUN wget -O /bin/composer https://mirrors.aliyun.com/composer/composer.phar 
RUN chmod +x /bin/composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 软件包参数配置
ENV PHP_MEMORY_LIMIT 512M
ENV MAX_UPLOAD 50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV MAX_EXECUTION_TIME 600
ENV PHP_MAX_POST 100M

# RUN touch /etc/php7/fpm.d/none.conf
RUN chmod 777 -R /var/log/

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php7/php-fpm.conf && \
sed -i -e "s/listen\s*=\s*127.0.0.1:9000/listen = 9000/g" /etc/php7/php-fpm.d/www.conf && \
sed -i "s|date.timezone =.*|date.timezone = ${TIMEZONE}|" /etc/php7/php.ini && \
sed -i "s|memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|" /etc/php7/php.ini && \
sed -i "s|upload_max_filesize =.*|upload_max_filesize = ${MAX_UPLOAD}|" /etc/php7/php.ini && \
sed -i "s|max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|" /etc/php7/php.ini && \
sed -i "s|max_execution_time =.*|max_execution_time = ${MAX_EXECUTION_TIME}|" /etc/php7/php.ini && \
sed -i "s|post_max_size =.*|max_file_uploads = ${PHP_MAX_POST}|" /etc/php7/php.ini && \
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php7/php.ini && \
sed -i "s/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/" /etc/php7/php.ini && \
sed -i "s/display_errors = Off/display_errors = On/" /etc/php7/php.ini && \
sed -i "s/;catch_workers_output = yes/catch_workers_output = yes/" /etc/php7/php-fpm.conf && \
sed -i "s/;error_log = php_errors.log/error_log = \/apps\/logs\/php_errors.log/" /etc/php7/php.ini 

WORKDIR /apps

VOLUME /apps

# 端口号配置
EXPOSE 9000

# 容器命令执行
CMD ["php-fpm7"]
# CMD ["sh"]
