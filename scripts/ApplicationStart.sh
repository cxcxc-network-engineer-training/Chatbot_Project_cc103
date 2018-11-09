#!/bin/bash
cd /home/ec2-user/deploy
echo "Running service container "
docker-compose up -d
echo "Testing service container "
touch /home/ec2-user/container_log
touch /home/ec2-user/start_log
sudo docker ps > /home/ec2-user/container_log
containerNum=cat /home/ec2-user/container_log|wc -l
for ((i=0;i<3;i++))
do
  sleep 5
  if [ $containerNum == 6 ];then
    echo "deploy success!" > /home/ec2-user/start_log
    break
fi
  if [ $i == 2 ];then
  echo "deploy fail" > /home/ec2-user/start_log
fi
done
exit 0
