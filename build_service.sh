
#!/bin/bash
echo "Logging in to AWS ECR and pull images"
$(aws ecr get-login --no-include-email --region ap-northeast-1)
docker pull 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/api:latest
docker pull mysql:latest
docker pull redis:latest
docker pull 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/jupyter:latest
docker pull 204065533127.dkr.ecr.ap-northeast-1.amazonaws.com/ngrok:latest

curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
