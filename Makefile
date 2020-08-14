IMAGE=hugoguru/validator
VERSION=$(shell echo $${VERSION:-20.6.30})

build:
	@docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):dev .

docker-login:
	@docker login -u $${DOCKER_USERNAME} -p $${DOCKER_TOKEN}

docker-push-stable:
	@docker tag $(IMAGE):dev $(IMAGE):$(VERSION)
	@docker tag $(IMAGE):dev $(IMAGE):latest
	@docker push $(IMAGE):$(VERSION)
	@docker push $(IMAGE):latest

docker-push-edge:
	@docker tag $(IMAGE):dev $(IMAGE):edge
	@docker push $(IMAGE):edge
