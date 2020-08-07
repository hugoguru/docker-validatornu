IMAGE=hugoguru/html5validator

build:
	@docker build -t $(IMAGE):dev .

docker-login:
	@docker login -u $${DOCKER_USERNAME} -p $${DOCKER_TOKEN}

docker-push-edge:
	@docker tag $(IMAGE):dev $(IMAGE):edge
	@docker push $(IMAGE):edge