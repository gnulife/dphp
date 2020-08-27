#!/bin/bash

# 清除已有的
docker stop swoole
docker rm swoole
docker rmi water/swoole

# 重新生成
docker build -t water/swoole ./
