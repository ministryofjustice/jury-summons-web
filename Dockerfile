FROM ubuntu:trusty

RUN echo "Europe/London" > /etc/timezone  &&  dpkg-reconfigure -f noninteractive tzdata

RUN sed -i "s/http:\/\/archive/http:\/\/gb.archive/g" /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties \
        python3 python3-pip

RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update && apt-get install -y \
        build-essential git python3-dev python3-setuptools \
        curl libpq-dev ruby nodejs python3-pip

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10

WORKDIR /app

RUN npm install -g bower gulp
RUN gem install sass --no-ri --no-rdoc

COPY ./requirements/ /app/requirements/
ENV PIP_DOWNLOAD_CACHE ./pip_download_cache
RUN pip3 install -r requirements/dev.txt
RUN pip3 wheel --wheel-dir=./wheels -r ./requirements/prod.txt

COPY ./package.json /app/package.json
RUN npm install

COPY . /app
RUN bower install --allow-root
RUN ./node_modules/.bin/gulp build

# don't need asset-src anymore
RUN rm -rf ./node_modules && rm -rf ./jury_summons/assets-src/ && rm -rf ./pip_download_cache/

COPY ./Dockerfile.runtime ./Dockerfile

# Export the context & runtime docker file
CMD tar -cf - .
