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
RUN apk add nginx

# 软件包参数配置
RUN mkdir /run/nginx
RUN mkdir /apps
RUN mkdir -p /usr/share/nginx/html
COPY conf/nginx.conf /etc/nginx/
COPY conf/vhosts.conf /etc/nginx/conf.d/

# 端口号配置
EXPOSE 80
VOLUME /apps/

# 容器命令执行
ENTRYPOINT ["nginx", "-g", "daemon off;"]