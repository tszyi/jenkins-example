#!/bin/bash

systemctl stop tomcat.service

until [ -z `ps -ef | grep tomcat | grep -v grep | awk '{print $2}'` ];
do
  echo "wait for service to die..."
  sleep 10
done
echo "service down"

rm -rf  /opt/tomcat/webapps/my-app.*
