#!/bin/bash

# 清除已有的
docker stop nginx
docker rm nginx
docker rmi water/nginx

# 重新生成
docker build -t water/nginx ./
