
#!/bin/bash
if [ $containerNum  > 1 ];then
echo "stop service container "
cd /home/ec2-user/deploy
echo "remove container "
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
fi
