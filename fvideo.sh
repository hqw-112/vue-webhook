#!/bin/bash
WORK_PATH='/usr/projects/fvideo'
cd $WORK_PATH
echo "清理代码"
git reset --hard master
git clean -f
echo "拉取最新代码"
git pull
echo "打包最新代码"
npm run build
echo "开始构建镜像"
docker build -t fvideo:1.0 .
echo "删除旧容器"
docker stop fvideo-container
docker rm fvideo-container
echo "启动新容器"
docker container run -p 80:80 -d --name fvideo-container fvideo:1.0
