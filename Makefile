IMAGE=hugoguru/validator
VERSION=$(shell echo $${VERSION:-20.6.30})

build:
	@docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):dev-base --target base .
	@docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):dev .

docker-login:
	@docker login -u $${DOCKER_USERNAME} -p $${DOCKER_TOKEN}

docker-push-edge:
	@docker tag $(IMAGE):dev-base $(IMAGE):edge-base
	@docker tag $(IMAGE):dev $(IMAGE):edge
	@docker push $(IMAGE):edge-base
	@docker push $(IMAGE):edge

docker-push-stable:
	@docker tag $(IMAGE):dev-base $(IMAGE):$(VERSION)-base
	@docker tag $(IMAGE):dev $(IMAGE):$(VERSION)
	@docker push $(IMAGE):$(VERSION)-base
	@docker push $(IMAGE):$(VERSION)

docker-push-latest:
	@docker tag $(IMAGE):dev-base $(IMAGE):latest-base
	@docker tag $(IMAGE):dev $(IMAGE):latest
	@docker push $(IMAGE):latest-base
	@docker push $(IMAGE):latest

server:
	@docker run --rm -it \
		-p 8888:8888 \
		-u $$(id -u) \
		$(IMAGE):dev \
		--server