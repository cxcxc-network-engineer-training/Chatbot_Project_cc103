#!/bin/bash
# curl -s:安靜模式 去除進度輸出
# awk -F 指定分割字元
# > NURL 將輸出結果存入NURL文件
curl -s "localhost:4040/api/tunnels" | awk -F',' '{print $3}' | awk -F'"' '{print $4}' | awk -F'//' '{print $2}' > NURL 
#以cat 指定讀取NURL並存入變數$NURL
NURL=`cat ./NURL`
#將$NURL寫入並輸出到./Chatbot_Line/code/secret_key
cat <<EOF > ./Chatbot_Line/code/secret_key
{
 "channel_access_token":"$TOKEN",
  "secret_key":"$SKEY",
  "self_user_id":"$SELFUID",
  "rich_menu_id":"$RICHMID",
  "server_url":"$NURL"
}
EOF
#刪除NURL
rm -f ./NURL
