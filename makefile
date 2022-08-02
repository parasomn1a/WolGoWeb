BINARY="wol"
VERSION="0.2"

build:
	docker build -t ${BINARY}:${VERSION} -f docker/Dockerfile .

push:
	docker tag ${BINARY}:${VERSION} parasomnia/${BINARY}:${VERSION}
	docker push parasomnia/${BINARY}:${VERSION}
