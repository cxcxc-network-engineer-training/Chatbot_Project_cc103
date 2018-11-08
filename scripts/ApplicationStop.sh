#!/bin/bash
echo "stop service container "
cd /home/ec2-user/deploy
echo "remove container & images"
sudo docker-compose down --rmi all
