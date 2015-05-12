.PHONY: all

default: build-images

build-images:
	docker build -t builder . && docker run builder | docker build -t quay.io/r4vi/jsum-base:latest -
	docker tag quay.io/r4vi/jsum-base:latest quay.io/r4vi/jsum-base:$(git_sha)

	docker build -t quay.io/r4vi/jsum-web:latest -f docker/web/Dockerfile .
	docker build -t quay.io/r4vi/jsum-worker:latest -f docker/worker/Dockerfile .

	docker tag quay.io/r4vi/jsum-web:latest quay.io/r4vi/jsum-web:$(git_sha)
	docker tag quay.io/r4vi/jsum-worker:latest quay.io/r4vi/jsum-worker:$(git_sha)

push-images: build-images
	docker push quay.io/r4vi/jsum-base
	docker push quay.io/r4vi/jsum-web
	docker push quay.io/r4vi/jsum-worker
