FROM water/alpine
MAINTAINER water youwater@gmail.com

# 软件包安装
RUN apk add redis

# 端口号配置
EXPOSE 6379

# 容器命令执行
CMD ["redis-server"]