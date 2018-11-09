
#!/bin/bash
cd /home/ec2-user/deploy
echo "Running service container "
version=`cat VERSION|cut -d ';' -f 1`
docker-compose -f $version/docker-compose.yml up -d
echo "Testing service container "
touch /home/ec2-user/container_log
docker ps > /home/ec2-user/container_log
containerNum=`cat /home/ec2-user/container_log|wc -l`
for ((i=0;i<3;i++))
do
  sleep 5
  if [ $containerNum == 6 ];then
    echo "remove image second "
    pversion=`cat VERSION|cut -d ';' -f 2`
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:$pversion
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/mysql:$pversion
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/redis:$pversion
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:$pversion
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:$pversion
    echo "service deploy success !!" > /home/ec2-user/lineChatbot/updateTime
    break
  fi
  if [ $i == 2 ];then
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
    docker rmi redis:latest
    docker rmi mysql:latest
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
    docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest
    pversion=`cat VERSION|cut -d ';' -f 2`
    docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:$pversion 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
    docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:$pversion 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
    docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:$pversion 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest
    docker-compose -f $pversion/docker-compose.yml up -d
    echo "service deploy fail QQ" > /home/ec2-user/lineChatbot/updateTime
  fi
done
date >> /home/ec2-user/lineChatbot/updateTime
