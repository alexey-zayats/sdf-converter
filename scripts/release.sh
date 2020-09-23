#!/usr/bin/env bash

ARG1=$1

REALPATH=`realpath $0`
DIRPATH=`dirname $REALPATH`

cd $DIRPATH/..

set -ex

REGISTRY=hub.docker.com/aazayats
IMAGE=sdf-converter

# git pull

docker run --rm -v "$PWD":/app treeder/bump patch

VERSION=`cat VERSION`
echo "version: $VERSION"

# tag it
git add -A
git commit -m "version $VERSION"
git tag -a "$VERSION" -m "version $VERSION"
git push origin $BRANCH
git push --tags

docker build -t ${IMAGE} .
docker tag $REGISTRY/$IMAGE:$VERSION

# push it
docker push $REGISTRY/$IMAGE:$version