.PHONY: help

help:
	@cat $(firstword $(MAKEFILE_LIST))

/root/rpmbuild:
	rpmdev-setuptree

/root/rpmbuild/SOURCES/hello-0.0.1: dist/hello-0.0.1.tar.gz
	cp $< $@

/root/rpmbuild/SPEC/hello.spec: /root/rpmbuild/SOURCES/hello-0.0.1
	rpmdev-newspec hello --output $@

dist/hello-0.0.1.tar.gz: dist/hello-0.0.1
	tar --create --file $@ $<

dist/hello-0.0.1/hello.sh: dist/hello-0.0.1
	echo '#!/bin/sh' > $@
	echo 'echo "Hello world"' >> $@

dist/hello-0.0.1:
	mkdir $@

dist:
	mkdir $@

clean:
	rm -rf dist
