#!/bin/bash

# 清除已有的
docker stop mysql
docker rm mysql
docker rmi water/mysql

# 重新生成
docker build -t water/mysql ./
