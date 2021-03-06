#!/bin/bash
CONTAINERNAME=mockbuild:latest
CACHEPATH=/var/cache/docker-builder/mock
[ -z "${DIST}" ] && DIST=6
DNSPARAM="--dns 172.18.80.136"
docker run ${DNSPARAM} -i -t --privileged --rm -v ${CACHEPATH}/cache:/var/cache/mock -v ${CACHEPATH}/lib:/var/lib/mock ${CONTAINERNAME} \
    bash -c "sed -i 's|%EXTRAREPOURL%|http://fakeurl/|g' /etc/mock/centos${DIST}.cfg ;\
             sudo -u abuild /usr/bin/mock -r centos${DIST} -v --update"
