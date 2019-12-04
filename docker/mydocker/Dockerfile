FROM centos:7
ADD gowp.sh /
ADD wp-config.php /var/www/html/wp-config.php
#安装httpd
RUN yum install  httpd -y
#安装php
RUN yum install epel-release yum-utils -y
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm  -y
RUN yum-config-manager --enable remi-php72 -y
RUN yum install php php-mysql -y
RUN yum install rsync -y

#安装mysql
RUN yum install mariadb-server mariadb -y
WORKDIR /root
ADD create_db.sql /root/create_db.sql
ADD server.cnf /etc/my.cnf.d/server.cnf
ADD setup.sh /root/setup.sh
RUN yum clean all
RUN chmod +x /root/setup.sh
#安装wordpress
WORKDIR /
COPY latest.tar.gz /
RUN  tar xzvf latest.tar.gz
RUN sh gowp.sh
#暴露端口
EXPOSE 3306 80
CMD ["/root/setup.sh"]

