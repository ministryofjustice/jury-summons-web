FROM quay.io/r4vi/jsum-base:latest


RUN add-apt-repository -y ppa:nginx/stable \
       && apt-get update -o Dir::Etc::sourcelist="sources.list.d/nginx-stable-trusty.list" \
            -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0" && \
        apt-get install -y nginx

RUN service nginx stop && rm /etc/init.d/nginx

COPY ./conf/uwsgi /etc/uwsgi
COPY ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx/sites-enabled /etc/nginx/sites-enabled
COPY ./conf/supervisor/apps/nginx.conf /etc/supervisor/apps/nginx.conf
COPY ./conf/supervisor/apps/uwsgi.conf /etc/supervisor/apps/uwsgi.conf

EXPOSE 80
EXPOSE 443
