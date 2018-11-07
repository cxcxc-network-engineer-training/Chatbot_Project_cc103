
curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo yum install -y awslogs
#sed -i 's/us-east-1/ap-northeast-1/g' /etc/awslogs/awscli.conf
#sed -i 's/\/var\/log\/messages/\/home\/ec2-user\/Chatbot_Project\/Chatbot_Dev\/code\/my.log/g' /etc/awslogs/awslogs.conf
sudo service awslogs start
