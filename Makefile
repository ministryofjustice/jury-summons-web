.PHONY: all

default: build-images

build-images:
	docker build -t builder . && docker run builder | docker build -t quay.io/kerin/jsum-web:latest -
	docker tag -f quay.io/kerin/jsum-web:latest quay.io/kerin/jsum-web:$(git_sha)

push-images:
	docker push quay.io/kerin/jsum-web
