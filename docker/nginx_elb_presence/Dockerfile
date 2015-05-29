FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y python-boto python-requests

ADD bin/elb-presence /bin/elb-presence

CMD ["/bin/elb-presence"]
