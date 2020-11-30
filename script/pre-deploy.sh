#!/bin/bash

# region shutdown tomcat, remove old app
service tomcat stop

until [ -z `ps -ef | grep tomcat | grep -v grep | awk '{print $2}'` ];
do
  echo "wait for service to die..."
  sleep 10
done
echo "service down"
# ps -ef | grep tomcat | grep -v grep | awk '{print $2}' | xargs kill -9
rm -rf /opt/apache-tomcat-8.5.60/webapps/my-app.*
# endregion

# exit
