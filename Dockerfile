#Download Base Image
FROM devopsedu/webapp
RUN apt-get update && apt-get -y install sudo
RUN rm /var/www/html/index.html
COPY website/ /var/www/html/
RUN sudo chown -R www-data:www-data /var/www/html

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/run/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
