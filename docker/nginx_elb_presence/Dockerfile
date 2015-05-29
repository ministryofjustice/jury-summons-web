FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y python-boto python-requests

ADD ./bin/elb_presence /bin/elb_presence

CMD ["/bin/elb_presence"]
