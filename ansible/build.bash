#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || ( echo "Error: Cannot enter $SCRIPT_DIR"  && exit 1 )

USERNAME=x241c297f
IMAGE_NAME=ansible
TAG=latest

docker build \
    --pull \
    -t ${USERNAME}/${IMAGE_NAME}:${TAG} \
    -f ./Dockerfile \
    "$@" \
    .

docker push "${USERNAME}"/"${IMAGE_NAME}":"${TAG}"
