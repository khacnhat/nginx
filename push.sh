#!/bin/bash
set -e

export BRANCH=$(if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo $TRAVIS_BRANCH; else echo $TRAVIS_PULL_REQUEST_BRANCH; fi)
if [ "${BRANCH}" == "master" ]; then
  docker login --username "${DOCKER_USERNAME}" --password "${DOCKER_PASSWORD}";
  docker push cyberdojo/nginx;
fi
