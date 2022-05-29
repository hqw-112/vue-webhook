#!/bin/bash
WORK_PATH='/usr/projects/bvideo'
cd $WORK_PATH
echo "清理代码"
git reset --hard master
git clean -f
echo "拉取最新代码"
git pull
echo "开始构建镜像"
docker build -t bvideo:1.0 .
echo "删除旧容器"
docker stop bvideo-container
docker rm bvideo-container
echo "启动新容器"
docker container run -p 9000:9000 -d --name bvideo-container bvideo:1.0
