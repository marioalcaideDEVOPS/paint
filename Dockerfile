FROM registry.access.redhat.com/ubi7/ubi

MAINTAINER Mario malcaidedonoso@gmail.com

USER root

RUN yum update -y && yum install httpd -y && yum clean all

COPY index.html flow.js main.js perlin.js utils.js /var/www/html/

EXPOSE 8080

RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && chmod -R g=u /var/log/httpd /var/run/httpd

USER 1001

ENTRYPOINT ["httpd","-D","FOREGROUND"]   

