#!/bin/bash
set -e
set -o pipefail

PG_ID=$(docker run -d --name postgres -e POSTGRES_USER=postgres -e \
  POSTGRES_PASSWORD=postgres postgres:9.4)

docker run --link=postgres:postgres -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres -e POSTGRES_PORT=5432 \
  -e POSTGRES_HOST=postgres \
  -e DJANGO_SETTINGS_MODULE=jury_summons.settings.test \
  quay.io/kerin/jsum-web:${tag} \
  /bin/bash -c "pip3 install -r requirements/test.txt && python manage.py test"

echo "Killing postgres container $(docker kill $PG_ID)"
echo "Removing postgres container $(docker rm $PG_ID)"
