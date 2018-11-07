
#!/bin/bash
echo "stop service container "
cd /home/ec2-user/deploy
echo "remove container "
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
