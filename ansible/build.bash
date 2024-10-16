#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || ( echo "Error: Cannot enter $SCRIPT_DIR"  && exit 1 )

USERNAME=x241c297f

IMAGE_NAME=ansible
docker build \
    --pull \
    -t x241c297f/${IMAGE_NAME}:latest \
    -f ./Dockerfile \
    --build-arg USERNAME=$USERNAME \
    "$@" \
    .

docker push x241c297f/${IMAGE_NAME}:latest
