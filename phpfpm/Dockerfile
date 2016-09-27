FROM alpine:latest
MAINTAINER water youwater@gmail.com

# 换为国内镜像，以加速docker image制作速度，非中国镜内用户请注释掉下一行
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/' /etc/apk/repositories
RUN apk update && apk upgrade

#时区配置
ENV TIMEZONE Asia/Shanghai
RUN apk add tzdata
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN echo $TIMEZONE > /etc/timezone

# 软件包安装
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