FROM sebp/lighttpd

MAINTAINER Tornike Zedginidze <tokozedg@gmail.com>

ADD ./output/ /var/www/localhost/htdocs

EXPOSE 80
