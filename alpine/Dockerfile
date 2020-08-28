FROM alpine:latest

# 换为国内镜像，以加速docker image制作速度，非中国镜内用户请注释掉下一行
RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main' > /etc/apk/repositories
RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/community' >> /etc/apk/repositories

RUN apk update && apk upgrade

#时区配置
ENV TIMEZONE Asia/Shanghai
RUN apk add tzdata
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
RUN echo $TIMEZONE > /etc/timezone

# 容器命令执行
CMD ["sh"]
