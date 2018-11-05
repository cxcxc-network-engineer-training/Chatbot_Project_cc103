set -ex
git submodule init 
git submodule update
#set registry
USERNAME=204065533127.dkr.ecr.ap-northeast-1.amazonaws.com
IAMGE1=redis
IAMGE2=jupyter
IAMGE3=ngrok
IAMGE4=api
IAMGE5=mysql

docker build -t $USERNAME/$IAMGE1:latest 
docker build -t $USERNAME/$IAMGE2:latest -f Chatbot_Line_cc103/dockerfile/dockerfile-jupyter2 Chatbot_Line_cc103/dockerfile/
docker build -t $USERNAME/$IAMGE3:latest -f Chatbot_Line_cc103/dockerfile/dockerfile-ngrok Chatbot_Line_cc103/dockerfile/
docker build -t $USERNAME/$IAMGE4:latest -f Chatbot_Dev_cc103/dockerfile/dockerfile-api Chatbot_Dev_cc103/dockerfile/
docker build -t $USERNAME/$IAMGE5:latest 



redis_ver=`cat redis_ver`
echo "redis_ver: $redis_ver"
docker tag $USERNAME/$IAMGE1:latest $USERNAME/$IAMGE1:$redis_ver
jupyter_ver=`cat jupyter_ver`
echo "jupyter_ver: $jupyter_ver"
docker tag $USERNAME/$IAMGE2:latest $USERNAME/$IAMGE2:$jupyter_ver
ngrok_ver=`cat ngrok_ver`
echo "ngrok_ver: $ngrok_ver"
docker tag $USERNAME/$IAMGE3:latest $USERNAME/$IAMGE3:$ngrok_ver
api_ver=`cat api_ver`
echo "redis_ver: $api_ver"
docker tag $USERNAME/$IAMGE4:latest $USERNAME/$IAMGE4:$api_ver
mysql_ver=`cat mysql_ver`
echo "mysql_ver: $mysql_ver"
docker tag $USERNAME/$IAMGE5:latest $USERNAME/$IAMGE5:$mysql_ver

docker push $USERNAME/$IAMGE1:$redis_ver
docker push $USERNAME/$IAMGE2:$jupyter_ver
docker push $USERNAME/$IAMGE3:$ngrok_ver
docker push $USERNAME/$IAMGE4:$api_ver
docker push $USERNAME/$IAMGE5:$mysql_ver
