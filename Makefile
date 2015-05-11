.PHONY: all

default: build-images

build-images:
	docker build -t builder . && docker run builder | docker build -t quay.io/kerin/jsum-base -
	docker build -t quay.io/kerin/jsum-web -f docker/web/Dockerfile .
	docker build -t quay.io/kerin/jsum-worker -f docker/worker/Dockerfile .

push-images: build-images
	docker push quay.io/kerin/jsum-base:$(GIT_SHA)
	docker push quay.io/kerin/jsum-web:$(GIT_SHA)
	docker push quay.io/kerin/jsum-worker:$(GIT_SHA)
