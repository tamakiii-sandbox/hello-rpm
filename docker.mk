.PHONY: help build bash clean

IMAGE := tamakiii-sandbox/hello-rpm

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(IMAGE) .

bash: build
	docker run -it --rm -v $(PWD):/work -w /work $(IMAGE) $@

clean:
	docker image rm $(IMAGE)
