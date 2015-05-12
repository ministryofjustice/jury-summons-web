.PHONY: all

default: build-images

build-images:
	docker build -t builder . && docker run builder | docker build -t quay.io/kerin/jsum-base:$(GIT_SHA) -
	docker build -t quay.io/kerin/jsum-web:$(GIT_SHA) -f docker/web/Dockerfile .
	docker build -t quay.io/kerin/jsum-worker:$(GIT_SHA) -f docker/worker/Dockerfile .

push-images: build-images
	docker push quay.io/kerin/jsum-base
	docker push quay.io/kerin/jsum-web
	docker push quay.io/kerin/jsum-worker
