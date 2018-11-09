#!/bin/bash
sudo yum install -y awslogs
sudo sed -i 's/us-east-1/ap-northeast-1/g' /etc/awslogs/awscli.conf
sudo sed -i 's/\/var\/log\/messages/\/home\/ec2-user\/Chatbot_Project_cc103\/Chatbot_Dev_cc103\/code\/my.log/g' /etc/awslogs/awslogs.conf
sudo service awslogs start
exit 0
