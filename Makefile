
IMAGE_NAME="i2p.i2p-builder"
PWD=`pwd`
USER=`id -u`
#USERMODE=-u "$(USER):$(USER)"
TIME=`date +%Y%m%d`

all: ubuntu-latest ubuntu-rolling ubuntu-devel debian-oldstable debian-stable debian-testing debian-unstable

ubuntu-latest: docker-ubuntu-latest
	docker run -it --rm $(USERMODE) -v "$(PWD)/i2p.i2p-ubuntu-latest":/java/i2p.i2p:z "$(IMAGE_NAME):ubuntu-latest" | tee docker-ubuntu-latest.log
	make copy-ubuntu-latest
	touch ubuntu-latest

ubuntu-rolling: docker-ubuntu-rolling
	docker run -it --rm $(USERMODE) -v "$(PWD)/i2p.i2p-ubuntu-rolling":/java/i2p.i2p:z "$(IMAGE_NAME):ubuntu-rolling" | tee docker-ubuntu-rolling.log
	make copy-ubuntu-rolling
	touch ubuntu-rolling

ubuntu-devel: docker-ubuntu-devel
	docker run -it --rm $(USERMODE) -v "$(PWD)/i2p.i2p-ubuntu-devel":/java/i2p.i2p:z "$(IMAGE_NAME):ubuntu-devel" | tee docker-ubuntu-devel.log
	make copy-ubuntu-devel
	touch ubuntu-devel

debian-oldstable: docker-debian-oldstable
	docker run -it --rm $(USERMODE) -v "$(PWD)/i2p.i2p-debian-oldstable":/java/i2p.i2p:z "$(IMAGE_NAME):debian-oldstable" | tee docker-debian-oldstable.log
	make copy-debian-oldstable
	touch debian-oldstable

debian-stable: docker-debian-stable
	docker run -it --rm $(USERMODE) -v "$(PWD)/i2p.i2p-debian-stable":/java/i2p.i2p:z "$(IMAGE_NAME):debian-stable" | tee docker-debian-stable.log
	make copy-debian-stable
	touch debian-stable

debian-testing: docker-debian-testing
	docker run -it --rm $(USERMODE) -v "$(PWD)/i2p.i2p-debian-testing":/java/i2p.i2p:z "$(IMAGE_NAME):debian-testing" |	tee docker-debian-testing.log
	make copy-debian-testing
	touch debian-testing

debian-unstable: docker-debian-unstable
	docker run -it --rm $(USERMODE) -v "$(PWD)/i2p.i2p-debian-unstable":/java/i2p.i2p:z "$(IMAGE_NAME):debian-unstable" | tee docker-debian-unstable.log
	make copy-debian-unstable
	touch debian-unstable

# Copy debs

copy-ubuntu-latest:
	cp -v i2p.i2p-ubuntu-latest/i2p_*_all.deb \
		i2p_1.7.0-11-ubuntu-latest-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-latest/i2p-doc_*_all.deb \
		i2p-doc_1.7.0-11-ubuntu-latest-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-latest/i2p-router_*_all.deb \
		i2p-router_1.7.0-11-ubuntu-latest-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-latest/libjbigi-jni_*_amd64.deb \
		libjbigi-jni_1.7.0-11-ubuntu-latest-$(TIME)-1_amd64.deb

copy-ubuntu-rolling:
	cp -v i2p.i2p-ubuntu-rolling/i2p_*_all.deb \
		i2p_1.7.0-11-ubuntu-rolling-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-rolling/i2p-doc_*_all.deb \
		i2p-doc_1.7.0-11-ubuntu-rolling-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-rolling/i2p-router_*_all.deb \
		i2p-router_1.7.0-11-ubuntu-rolling-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-rolling/libjbigi-jni_*_amd64.deb \
		libjbigi-jni_1.7.0-11-ubuntu-rolling-$(TIME)-1_amd64.deb

copy-ubuntu-devel:
	cp -v i2p.i2p-ubuntu-devel/i2p_*_all.deb \
		i2p_1.7.0-11-ubuntu-devel-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-devel/i2p-doc_*_all.deb \
		i2p-doc_1.7.0-11-ubuntu-devel-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-devel/i2p-router_*_all.deb \
		i2p-router_1.7.0-11-ubuntu-devel-$(TIME)-1_all.deb
	cp -v i2p.i2p-ubuntu-devel/libjbigi-jni_*_amd64.deb \
		libjbigi-jni_1.7.0-11-ubuntu-devel-$(TIME)-1_amd64.deb

copy-debian-oldstable:
	cp -v i2p.i2p-debian-oldstable/i2p_*_all.deb \
		i2p_1.7.0-11-debian-oldstable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-oldstable/i2p-doc_*_all.deb \
		i2p-doc_1.7.0-11-debian-oldstable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-oldstable/i2p-router_*_all.deb \
		i2p-router_1.7.0-11-debian-oldstable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-oldstable/libjbigi-jni_*_amd64.deb \
		libjbigi-jni_1.7.0-11-debian-oldstable-$(TIME)-1_amd64.deb

copy-debian-stable:
	cp -v i2p.i2p-debian-stable/i2p_*_all.deb \
		i2p_1.7.0-11-debian-stable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-stable/i2p-doc_*_all.deb \
		i2p-doc_1.7.0-11-debian-stable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-stable/i2p-router_*_all.deb \
		i2p-router_1.7.0-11-debian-stable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-stable/libjbigi-jni_*_amd64.deb \
		libjbigi-jni_1.7.0-11-debian-stable-$(TIME)-1_amd64.deb

copy-debian-testing:
	cp -v i2p.i2p-debian-testing/i2p_*_all.deb \
		i2p_1.7.0-11-debian-testing-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-testing/i2p-doc_*_all.deb \
		i2p-doc_1.7.0-11-debian-testing-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-testing/i2p-router_*_all.deb \
		i2p-router_1.7.0-11-debian-testing-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-testing/libjbigi-jni_*_amd64.deb \
		libjbigi-jni_1.7.0-11-debian-testing-$(TIME)-1_amd64.deb

copy-debian-unstable:
	cp -v i2p.i2p-debian-unstable/i2p_*_all.deb \
		i2p_1.7.0-11-debian-unstable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-unstable/i2p-doc_*_all.deb \
		i2p-doc_1.7.0-11-debian-unstable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-unstable/i2p-router_*_all.deb \
		i2p-router_1.7.0-11-debian-unstable-$(TIME)-1_all.deb
	cp -v i2p.i2p-debian-unstable/libjbigi-jni_*_amd64.deb \
		libjbigi-jni_1.7.0-11-debian-unstable-$(TIME)-1_amd64.deb

# Image generators

images: docker-ubuntu-latest docker-ubuntu-rolling docker-ubuntu-devel docker-debian-oldstable docker-debian-stable docker-debian-testing docker-debian-unstable

docker-ubuntu-latest: Dockerfile-ubuntu-latest
	docker build -f Dockerfile-ubuntu-latest -t "$(IMAGE_NAME)":ubuntu-latest .

docker-ubuntu-rolling: Dockerfile-ubuntu-rolling
	docker build -f Dockerfile-ubuntu-rolling -t "$(IMAGE_NAME)":ubuntu-rolling .

docker-ubuntu-devel: Dockerfile-ubuntu-devel
	docker build -f Dockerfile-ubuntu-devel -t "$(IMAGE_NAME)":ubuntu-devel .

docker-debian-oldstable: Dockerfile-debian-oldstable
	docker build -f Dockerfile-debian-oldstable -t "$(IMAGE_NAME)":debian-oldstable .

docker-debian-stable: Dockerfile-debian-stable
	docker build -f Dockerfile-debian-stable -t "$(IMAGE_NAME)":debian-stable .

docker-debian-testing: Dockerfile-debian-testing
	docker build -f Dockerfile-debian-testing -t "$(IMAGE_NAME)":debian-testing .

docker-debian-unstable: Dockerfile-debian-unstable
	docker build -f Dockerfile-debian-unstable -t "$(IMAGE_NAME)":debian-unstable .

## Dockerfile generators

dockerfiles: Dockerfile-ubuntu-latest Dockerfile-ubuntu-rolling Dockerfile-ubuntu-devel Dockerfile-debian-oldstable Dockerfile-debian-stable Dockerfile-debian-testing Dockerfile-debian-unstable

Dockerfile-ubuntu-latest:
	echo "FROM ubuntu:latest" > Dockerfile-ubuntu-latest
	cat partial-Dockerfile >> Dockerfile-ubuntu-latest

Dockerfile-ubuntu-rolling:
	echo "FROM ubuntu:rolling" > Dockerfile-ubuntu-rolling
	cat partial-Dockerfile >> Dockerfile-ubuntu-rolling

Dockerfile-ubuntu-devel:
	echo "FROM ubuntu:devel" > Dockerfile-ubuntu-devel
	cat partial-Dockerfile >> Dockerfile-ubuntu-devel

Dockerfile-debian-oldstable:
	echo "FROM debian:oldstable" > Dockerfile-debian-oldstable
	cat partial-Dockerfile >> Dockerfile-debian-oldstable

Dockerfile-debian-stable:
	echo "FROM debian:stable" > Dockerfile-debian-stable
	cat partial-Dockerfile >> Dockerfile-debian-stable

Dockerfile-debian-testing:
	echo "FROM debian:testing" > Dockerfile-debian-testing
	cat partial-Dockerfile >> Dockerfile-debian-testing

Dockerfile-debian-unstable:
	echo "FROM debian:unstable" > Dockerfile-debian-unstable
	cat partial-Dockerfile >> Dockerfile-debian-unstable

# Cleanup targets

clean: clean-Dockerfile-ubuntu-latest clean-Dockerfile-ubuntu-rolling clean-Dockerfile-ubuntu-devel clean-Dockerfile-debian-oldstable clean-Dockerfile-debian-stable clean-Dockerfile-debian-testing clean-Dockerfile-debian-unstable
	rm -rf i2p.i2p-ubuntu-latest i2p.i2p-ubuntu-rolling i2p.i2p-ubuntu-devel i2p.i2p-debian-oldstable i2p.i2p-debian-stable i2p.i2p-debian-testing i2p.i2p-debian-unstable ubuntu-* debian-* *.deb || \
		sudo rm rm -rf i2p.i2p-ubuntu-latest i2p.i2p-ubuntu-rolling i2p.i2p-ubuntu-devel i2p.i2p-debian-oldstable i2p.i2p-debian-stable i2p.i2p-debian-testing i2p.i2p-debian-unstable

clean-Dockerfile-ubuntu-latest:
	docker rmi "$(IMAGE_NAME):ubuntu-latest"; true
	rm -f Dockerfile-ubuntu-latest

clean-Dockerfile-ubuntu-rolling:
	docker rmi "$(IMAGE_NAME):ubuntu-rolling"; true
	rm -f Dockerfile-ubuntu-rolling

clean-Dockerfile-ubuntu-devel:
	docker rmi "$(IMAGE_NAME):ubuntu-devel"; true
	rm -f Dockerfile-ubuntu-devel

clean-Dockerfile-debian-oldstable:
	docker rmi "$(IMAGE_NAME):debian-oldstable"; true
	rm -f Dockerfile-debian-oldstable

clean-Dockerfile-debian-stable:
	docker rmi "$(IMAGE_NAME):debian-stable"; true
	rm -f Dockerfile-debian-stable

clean-Dockerfile-debian-testing:
	docker rmi "$(IMAGE_NAME):debian-testing"; true
	rm -f Dockerfile-debian-testing

clean-Dockerfile-debian-unstable:
	docker rmi "$(IMAGE_NAME):debian-unstable"; true
	rm -f Dockerfile-debian-unstable
