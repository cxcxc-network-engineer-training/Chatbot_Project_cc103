
#!/bin/bash
cd /home/ec2-user/deploy
echo "Running service container "
docker-compose up -d
echo "Testing service container "
touch /home/ec2-user/container_log
docker ps > /home/ec2-user/container_log
containerNum=cat /home/ec2-user/container_log|wc -l
for ((i=0;i<3;i++))
do  
  sleep 5
  if [ $containerNum == 6 ];then
    echo "service deploy success !!" > /home/ec2-user/lineChatbot_cc103/updateTime
    break
fi
  if [ $i == 2 ];then
  docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
  docker rmi redis:latest
  docker rmi mysql:latest
  docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
  docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest
  echo "service deploy fail" > /home/ec2-user/lineChatbot_cc103/updateTime
fi
done
