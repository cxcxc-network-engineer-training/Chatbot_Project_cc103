
#!/bin/bash
echo "stop service container "
cd /home/ec2-user/deploy
pversion=`cat VERSION|cut -d ';' -f 2`
echo "remove container "
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
echo "re-tag image "
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:$pversion
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:$pversion
docker tag 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:$pversion
echo "remove image first "
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
docker rmi 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest
