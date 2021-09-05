IMAGE=quay.io/hugoguru/validatornu

define docker_build
	@DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build \
		--build-arg VERSION=$(VNU_VERSION) \
		--platform linux/amd64,linux/arm64 \
		--progress plain \
		--tag $(IMAGE):$(1) \
		.
endef

define docker_push
	@DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build \
		--build-arg VERSION=$(VNU_VERSION) \
		--platform linux/amd64,linux/arm64 \
		--progress plain \
		--tag $(IMAGE):$(1) \
		--push \
		.
endef

build:
	$(call docker_build,dev)

push-edge:
	$(call docker_push,edge)

push-release:
	$(call docker_push,$(VNU_VERSION))
	$(call docker_push,latest)