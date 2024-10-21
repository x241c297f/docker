#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || ( echo "Error: Cannot enter $SCRIPT_DIR"  && exit 1 )

USERNAME=x241c297f
USERID=$(id -u)
GROUPNAME=$(id -gn)
GROUPID=$(id -g)

IMAGE_NAME=common-dev-base
TAG=latest
docker build \
    --pull \
    -t ${USERNAME}/${IMAGE_NAME}:${TAG} \
    -f ./Dockerfile \
    --build-arg USERNAME=$USERNAME \
    --build-arg USERID="$USERID" \
    --build-arg GROUPNAME="$GROUPNAME" \
    --build-arg GROUPID="$GROUPID" \
    "$@" \
    .

docker push x241c297f/${IMAGE_NAME}:latest
