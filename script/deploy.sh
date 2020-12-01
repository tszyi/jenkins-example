#!/bin/bash

systemctl start tomcat

until [ `curl  -o /dev/null -I -L -s --connect-timeout 1 -w %{http_code} http://192.168.56.108` == "200" ];
do
  echo "service prepare to start..."
  sleep 5
done

echo 'service is up!'
