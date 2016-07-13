#!/bin/bash
#-------Fixed bugs in global conf-----------------------------------------#
sed -i '/^<VirtualHost/,/^<\/VirtualHost>/{d}' /etc/httpd/conf/httpd.conf

#------Fixed bugs in vhost.conf-------------------------------------------#
sed -i 's/mntlab/*/' /etc/httpd/conf.d/vhost.conf

#-----Commit varibles and change writes on file logs------------------------#
sed -i 's/export/#export/' /home/tomcat/.bashrc
chown -R tomcat:tomcat /opt/apache/tomcat/current/logs/

#---------Fixed Java-------------------------------------------------------#
alternatives --config java <<< '1'

#-------Change lines in workers.properties---------------------------------#
sed -i 's/worker-jk@ppname/tomcat.worker/' /etc/httpd/conf.d/workers.properties
sed -i 's/192.168.56.100/192.168.56.10/' /etc/httpd/conf.d/workers.properties
sed -i 's/ > \/dev\/null//g' /etc/init.d/tomcat

#-------Fixed errors with firewall-----------------------------------------#
chattr -i /etc/sysconfig/iptables
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
chkconfig tomcat on
service iptables save
service iptables restart
service tomcat start
service httpd restart
