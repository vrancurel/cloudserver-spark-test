NS = vrancurel
VERSION ?= latest
FLAGS =

.PHONY: build push deploy clean

build:
	cd spark-base ; docker build $(FLAGS) -t $(NS)/spark-base:$(VERSION) .
	cd spark-master ; docker build $(FLAGS) -t $(NS)/spark-master:$(VERSION) .
	cd spark-worker ; docker build $(FLAGS) -t $(NS)/spark-worker:$(VERSION) .
	cd s3 ; docker build $(FLAGS) -t $(NS)/s3:$(VERSION) .

push:
	cd spark-base ; docker push $(NS)/spark-base:$(VERSION)
	cd spark-master ; docker push $(NS)/spark-master:$(VERSION)
	cd spark-worker ; docker push $(NS)/spark-worker:$(VERSION)
	cd s3 ; docker push $(NS)/s3:$(VERSION)

deploy:
	docker stack deploy -c docker-stack.yml zenko-prod

clean:
	docker stack rm zenko-prod
