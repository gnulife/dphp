FROM water/alpine
MAINTAINER water youwater@gmail.com

# 软件包安装
RUN apk add php7@community \
        php7-fpm@community \
        php7-opcache@community \
        php7-session@community \
        php7-xml@community \
        php7-ctype@community \
        php7-gd@community \
        php7-json@community \
        php7-posix@community \
        php7-curl@community \
        php7-dom@community \
        php7-pdo@community \
        php7-pdo_mysql@community \
        php7-sockets@community \
        php7-zlib@community \
        php7-mcrypt@community \
        php7-mysqli@community \
        php7-sqlite3@community \
        php7-bz2@community \
        php7-phar@community \
        php7-posix@community \
        php7-zip@community \
        php7-calendar@community \
        php7-iconv@community \
        php7-imap@community \
        php7-soap@community \
        php7-dev@community \
        php7-pear@community \
        php7-redis@testing \
        php7-mbstring@community \
        php7-xdebug@community \
        php7-exif@community \
        php7-xsl@community \
        php7-ldap@community \
        php7-openssl@community \
        php7-bcmath@community

RUN ln -s /usr/bin/php7 /usr/bin/php

# 从国内镜像安装composer，并配置成默认从国内镜像安装composer包
RUN php -r "readfile('http://install.phpcomposer.com/installer');" | php -- --install-dir=/bin/ --filename=composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

# 软件包参数配置
ENV PHP_MEMORY_LIMIT 512M
ENV MAX_UPLOAD 50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV MAX_EXECUTION_TIME 600
ENV PHP_MAX_POST 100M

# RUN touch /etc/php7/fpm.d/none.conf
RUN chmod 777 -R /var/log/

RUN echo "zend_extension=xdebug.so" > /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_log=/apps/logs/xdebug.log" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_mode=req" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_host = 192.168.1.121" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back = 0" >> /etc/php7/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=true" >> /etc/php7/conf.d/xdebug.ini 

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
sed -i "s/;error_log = php_errors.log/error_log = \/apps\/logs\/php_errors.log/" /etc/php7/php.ini && \
mkdir /apps

WORKDIR /apps

VOLUME /apps

# 端口号配置
EXPOSE 9000

# 容器命令执行
CMD ["php-fpm7"]
