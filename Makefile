REPO      ?= tsrivishnu/elasticsearch-head
TAG       ?= 5_$(shell date +'%Y%m%d')
ALPINETAG ?= 5-alpine_$(shell date +'%Y%m%d')

all: build push

build: Dockerfile-alpine Dockerfile
	docker build --rm -t $(REPO):$(ALPINETAG) -f Dockerfile-alpine .
	docker build --rm -t $(REPO):$(TAG) -f Dockerfile-alpine .

push:
	docker push $(REPO):$(ALPINETAG)
	docker push $(REPO):$(TAG)

