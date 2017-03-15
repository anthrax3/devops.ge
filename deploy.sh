#!/bin/bash

#LAST_COMMIT=$(git rev-parse --short HEAD)
#if [[ $? -ne 0 ]]; then
  #echo "Git not found."
  #exit 1
#fi
LAST_COMMIT=$1
echo $LAST_COMMIT

IMAGE="tokozedg/devops.ge:${LAST_COMMIT}"
SERVICE_NAME="devops_ge"

#TODO check docker command exists
SERVICES=$(docker service ls --filter name=${SERVICE_NAME} --quiet | wc -l)
if [[ "${SERVICES}" -eq 0 ]]; then
  docker service create \
    --replicas 1 \
    --name "${SERVICE_NAME}" \
    --update-parallelism 1 \
    --update-delay 10s \
    --publish 80 \
    --restart-condition any \
    "${IMAGE}"
else
  docker service update \
          --image "${IMAGE}" \
          --rollback \
          "${SERVICE_NAME}"
fi
