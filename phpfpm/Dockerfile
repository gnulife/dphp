FROM water/alpine
MAINTAINER water youwater@gmail.com

# 软件包安装
RUN apk update
RUN apk add php5 \
	php5-fpm \
	php5-opcache \
	php5-intl \
    php5-mcrypt \
    php5-openssl \
    php5-gmp \
    php5-json \
    php5-dom \
    php5-pdo \
    php5-zip \
    php5-zlib \
    php5-mysql \
    php5-mysqli \
    php5-bcmath \
    php5-gd \
    php5-xcache \
    php5-pdo_mysql \
    php5-gettext \
    php5-xml \
    php5-xmlreader \
    php5-xmlrpc \
    php5-bz2 \
    php5-memcache \
    php5-iconv \
    php5-curl \
    php5-ctype \
    php5-phar \
    php5-redis@testing \
    php5-xdebug@community \
    openssl

# 从国内镜像安装composer，并配置成默认从国内镜像安装composer包
RUN php -r "readfile('http://install.phpcomposer.com/installer');" | php -- --install-dir=/bin/ --filename=composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

# 软件包参数配置
ENV PHP_MEMORY_LIMIT 512M
ENV MAX_UPLOAD 50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV MAX_EXECUTION_TIME 600
ENV PHP_MAX_POST 100M

RUN touch /etc/php5/fpm.d/none.conf
RUN chmod 777 -R /var/log/

RUN echo "zend_extension=xdebug.so" > /etc/php5/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /etc/php5/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /etc/php5/conf.d/xdebug.ini \
    && echo "xdebug.remote_log=/apps/logs/xdebug.log" >> /etc/php5/conf.d/xdebug.ini \
    && echo "xdebug.remote_mode=req" >> /etc/php5/conf.d/xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /etc/php5/conf.d/xdebug.ini \
    && echo "xdebug.remote_host = 192.168.1.121" >> /etc/php5/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back = 0" >> /etc/php5/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=true" >> /etc/php5/conf.d/xdebug.ini 

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/php-fpm.conf && \
sed -i -e "s/listen\s*=\s*127.0.0.1:9000/listen = 9000/g" /etc/php5/php-fpm.conf && \
sed -i "s|date.timezone =.*|date.timezone = ${TIMEZONE}|" /etc/php5/php.ini && \
sed -i "s|memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|" /etc/php5/php.ini && \
sed -i "s|upload_max_filesize =.*|upload_max_filesize = ${MAX_UPLOAD}|" /etc/php5/php.ini && \
sed -i "s|max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|" /etc/php5/php.ini && \
sed -i "s|max_execution_time =.*|max_execution_time = ${MAX_EXECUTION_TIME}|" /etc/php5/php.ini && \
sed -i "s|post_max_size =.*|max_file_uploads = ${PHP_MAX_POST}|" /etc/php5/php.ini && \
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/php.ini && \
sed -i "s/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/" /etc/php5/php.ini && \
sed -i "s/display_errors = Off/display_errors = On/" /etc/php5/php.ini && \
sed -i "s/;catch_workers_output = yes/catch_workers_output = yes/" /etc/php5/php-fpm.conf && \
sed -i "s/;error_log = php_errors.log/error_log = \/apps\/logs\/php_errors.log/" /etc/php5/php.ini && \
mkdir /apps

WORKDIR /apps

VOLUME /apps

# 端口号配置
EXPOSE 9000

# 容器命令执行
CMD ["php-fpm"]