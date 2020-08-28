FROM php:cli-alpine

# 换为国内镜像，以加速docker image制作速度，非中国镜内用户请注释掉下一行
RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main' > /etc/apk/repositories
RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/community' >> /etc/apk/repositories

RUN apk update && apk upgrade

#时区配置
ENV TIMEZONE Asia/Shanghai
RUN apk add tzdata git
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN echo $TIMEZONE > /etc/timezone

# 软件包安装
RUN git clone -b v4.5.2 https://gitee.com/swoole/swoole.git /usr/src/php/ext/swoole
RUN docker-php-ext-install pdo_mysql swoole
RUN apk del git

RUN apk add libstdc++

# 从国内镜像安装composer，并配置成默认从国内镜像安装composer包
RUN wget -O /bin/composer https://mirrors.aliyun.com/composer/composer.phar 
RUN chmod +x /bin/composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

WORKDIR /apps
VOLUME /apps

# 端口号配置
# EXPOSE 9000

# 容器命令执行
CMD ["sh"]
