#!/bin/bash
set -x #echo commands as we run them
IMAGENAME=${1:-jpapejr/razee-cluster-cleaner}
c=$(buildah from docker.io/centos:latest)
m=$(buildah mount $c)
cp ./mongo.repo $m/etc/yum.repos.d/mongodb-org-4.0.repo
buildah run $c yum install -y mongodb-org
buildah run $c mongo -version
cp ./entrypoint.sh $m
cp ./mongo.js $m
chmod +x $m/entrypoint.sh
buildah unmount $c
buildah config --entrypoint /entrypoint.sh $c
buildah commit $c $IMAGENAME
buildah rm $c
