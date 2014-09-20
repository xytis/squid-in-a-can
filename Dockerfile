FROM debian:jessie
RUN apt-get -q update
RUN apt-get -qy install squid3

RUN echo "http_port 3129 intercept" > /etc/squid3/squid.conf
RUN echo "http_access allow all" >> /etc/squid3/squid.conf
RUN echo "access_log /var/log/squid3/access.log" >> /etc/squid3/squid.conf

VOLUME /var/log/squid3

RUN chown proxy:proxy /var/log/squid3

CMD [ "squid3", "-N" ]
