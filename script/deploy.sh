#!/bin/bash

# region transfer artifact and then restart server
chmod 744 ./target/my-app.war
scp ./target/my-app.war root@192.168.56.108:/opt/apache-tomcat-8.5.60/webapps
service tomcat start
# endregion

# region wait the sevrice, check it alive
until [ `curl  -o /dev/null -I -L -s --connect-timeout 1 -w %{http_code} http://192.168.56.108` == "200" ];
do
  echo "service prepare to start..."
  sleep 5
done
echo 'service is up!'
# endregion
