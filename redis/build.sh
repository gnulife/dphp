#!/bin/bash

# 清除已有的
docker stop redis
docker rm redis
docker rmi water/redis 

# 重新生成
docker build -t water/redis ./
