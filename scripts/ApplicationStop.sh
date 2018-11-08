#!/bin/bash
echo "stop service container "
cd /home/ec2-user/deploy
echo "remove container & images"
touch /home/ec2-user/redeploy
repo=204065533127.dkr.ecr.ap-northeast-1.amazonaws.com
docker images | grep $repo > /home/ec2-user/redeploy
rescan=cat /home/ec2-user/redeploy|wc -l
if [ $rescan > 1 ];then
docker-compose down --rmi all
fi
