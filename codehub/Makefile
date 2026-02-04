
DOCKER_IMAGE=ghcr.io/vivsoftorg/codehub:0.0.1
DOCKER_PLATFORMS=linux/amd64,linux/arm64
# Set NO_CACHE=1 to disable Docker build cache
NO_CACHE?=0

.PHONY: build-and-push

build-and-push:
	docker buildx build \
		--platform $(DOCKER_PLATFORMS) \
		--push \
		-t $(DOCKER_IMAGE) \
		$(if $(filter 1,$(NO_CACHE)),--no-cache,) \
		.
