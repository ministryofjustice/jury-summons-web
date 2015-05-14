FROM nginx:1.9

RUN apt-get update -y && apt-get install curl -y

EXPOSE 80 443
# confd
RUN curl -L -o /usr/local/bin/confd \
    https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64
RUN chmod +x /usr/local/bin/confd
ADD ./conf/confd /etc/confd

# remove default nginx conf
RUN rm /etc/nginx/conf.d/default.conf

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./bin/confd-watch.sh /usr/local/bin/confd-watch
RUN chmod +x /usr/local/bin/confd-watch

CMD ["/usr/local/bin/confd-watch"]
