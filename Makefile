.PHONY: all

default: build-images

build-images:
	docker build -t builder . && docker run builder | docker build -t quay.io/kerin/jsum-web:latest -
	docker tag quay.io/kerin/jsum-web:latest quay.io/kerin/jsum-web:$(git_sha)

push-images: build-images
	docker push quay.io/kerin/jsum-web
