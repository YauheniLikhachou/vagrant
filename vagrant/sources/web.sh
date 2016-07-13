!#/bin/bash

sudo yum update
sudo yum install -y httpd, vim, httpd-devel.x86_64
sudo chkconfig httpd on
sudo service httpd start
mkdir mod_jk
cd mod_jk/
wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.41-src.tar.gz
tar xzvf tomcat-connectors-1.2.41-src.tar.gz
cd tomcat-connectors-1.2.41-src/native/
sudo ./configure --with-apxs=/usr/sbin/apxs
sudo make
sudo make install
udo cp -f /vagrant/sources/mntlab/httpd.conf /etc/httpd/conf
sudo cp -f /vagrant/sources/mntlab/worker.properties /etc/httpd/conf
sudo service httpd restart

