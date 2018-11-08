#!/bin/bash
docker ps > /home/ec2-user/container_log
containerNum=cat /home/ec2-user/container_log|wc -l
if [ $containerNum  > 1 ];then
echo "stop service container "
cd /home/ec2-user/deploy
echo "remove container "
docker stop $(docker ps -a -q)
docker rm -f $(docker ps -a -q)
echo "remove images "
docker rmi -f $(docker images -a -q)
fi
