FROM water/alpine

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