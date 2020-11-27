#!/bin/bash

# region deploy
scp ./target/my-app.war root@192.168.56.108:/opt/apache-tomcat-8.5.60/webapps
# endregion

# region check alive
until [ `curl  -o /dev/null -I -L -s --connect-timeout 1 -w %{http_code} http://192.168.56.108` == "200" ];
do
  echo "service prepare to start..."
  sleep 5
done
# endregion
