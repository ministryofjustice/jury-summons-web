.PHONY: all

default: build-images

build-images:
    docker build -t builder . && docker run builder | docker build -t quay.io/kerin/jsum-base:latest -
    docker tag quay.io/kerin/jsum-base:latest quay.io/kerin/jsum-base:$(git_sha)

    docker build -t quay.io/kerin/jsum-web:latest -f docker/web/Dockerfile .
    docker build -t quay.io/kerin/jsum-worker:latest -f docker/worker/Dockerfile .

    docker tag quay.io/kerin/jsum-web:latest quay.io/kerin/jsum-web:$(git_sha)
    docker tag quay.io/kerin/jsum-worker:latest quay.io/kerin/jsum-worker:$(git_sha)

push-images: build-images
    docker push quay.io/kerin/jsum-base
    docker push quay.io/kerin/jsum-web
    docker push quay.io/kerin/jsum-worker
