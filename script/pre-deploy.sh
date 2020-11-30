#!/bin/bash

# region shutdown tomcat, remove old app
service tomcat stop
# ps -ef | grep tomcat | awk '{print $2}' | xargs kill -9
rm -rf /opt/apache-tomcat-8.5.60/webapps/my-app.*
# endregion

