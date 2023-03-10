#!/usr/bin/env bash

REPOSITORY=/home/ec2-user/app/step1/gitaction
cd $REPOSITORY

APP_NAME=java
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep '.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 종료할 프로세스 없음"
else
  echo "> kill -9 $CURRENT_PID"
  sudo kill -15 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_PATH 배포"
sudo nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &
