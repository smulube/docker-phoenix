
# Image name
NAME := umbrellium/phoenix

# Derive tag from git
TAG := $(shell git describe --tags --always --dirty)

# Image labels
IMG := $(NAME):$(TAG)
LATEST := $(NAME):latest

.PHONY: build
build:
	docker build -t $(IMG) .
	docker tag $(IMG) $(LATEST)

.PHONY: push
push:
	docker push $(NAME)
