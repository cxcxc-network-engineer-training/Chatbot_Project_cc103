set -ex
git submodule init 
git submodule update
#set registry
USERNAME=204065533127.dkr.ecr.ap-northeast-1.amazonaws.com
IAMGE1=jupyter
IAMGE2=ngrok
IAMGE3=api

docker build -t $USERNAME/$IAMGE1:latest -f Chatbot_Line_cc103/dockerfile/dockerfile-jupyter2 Chatbot_Line_cc103/dockerfile/
docker build -t $USERNAME/$IAMGE2:latest -f Chatbot_Line_cc103/dockerfile/dockerfile-ngrok Chatbot_Line_cc103/dockerfile/
docker build -t $USERNAME/$IAMGE3:latest -f Chatbot_Dev_cc103/dockerfile/dockerfile-api Chatbot_Dev_cc103/dockerfile/


jupyter_ver=`cat version/jupyter_ver`
echo "jupyter_ver: $jupyter_ver"
docker tag $USERNAME/$IAMGE1:latest $USERNAME/$IAMGE1:$jupyter_ver
ngrok_ver=`cat version/ngrok_ver`
echo "ngrok_ver: $ngrok_ver"
docker tag $USERNAME/$IAMGE2:latest $USERNAME/$IAMGE2:$ngrok_ver
api_ver=`cat version/api_ver`
echo "redis_ver: $api_ver"
docker tag $USERNAME/$IAMGE3:latest $USERNAME/$IAMGE3:$api_ver



docker push $USERNAME/$IAMGE1:$jupyter_ver
docker push $USERNAME/$IAMGE2:$ngrok_ver
docker push $USERNAME/$IAMGE3:$api_ver
