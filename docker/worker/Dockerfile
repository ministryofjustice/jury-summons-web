FROM quay.io/r4vi/jsum-base:latest
RUN mkdir -p /var/log/celery/ && mkdir -p /var/run/celery/

COPY ./conf/supervisor/apps/celery.conf /etc/supervisor/apps/celery.conf
