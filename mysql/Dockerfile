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
RUN apk add mysql mysql-client

# 软件包参数配置

RUN mkdir /run/mysqld/ && mkdir -p /apps/mysql/
COPY my.cnf /etc/mysql/my.cnf
COPY init_mysql.sh /apps/
RUN chmod +x /apps/init_mysql.sh
COPY import.sql /apps/

WORKDIR /apps/

# 端口号配置
EXPOSE 3306
VOLUME ["/apps/mysql"]

# 容器命令执行
CMD ["/apps/init_mysql.sh"]