#!/bin/bash
docker build -t builder . && docker run builder | docker build -t dockerception -
docker-compose up --no-build
