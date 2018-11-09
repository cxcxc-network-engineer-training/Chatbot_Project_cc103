#!/bin/bash
echo "stop service container "
cd /home/ec2-user/deploy
docker-compose down --rmi all
exit 0
