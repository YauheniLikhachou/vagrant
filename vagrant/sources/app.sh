!#/bin/bash

sudo yum update
sudo yum install -y java
sudo mkdir tomcat
cd tomcat/
sudo wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-8/v8.5.3/bin/apache-tomcat-8.5.3.tar.gz
sudo tar xzvf apache-tomcat-8.5.3.tar.gz
cd apache-tomcat-8.5.3/
sudo chmod 755 bin/
cd bin/
sudo ./startup.sh
cd..
sudo chmod 750 bin/

