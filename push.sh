#!/bin/bash
set -e

# Does the [docker push] to dockerhub
# I don't do this in the .travis.yml after_success:
# because if commands in the after_success: section fail
# they do NOT fail the travis run.
# https://github.com/travis-ci/travis-ci/issues/758

export BRANCH=$(if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo $TRAVIS_BRANCH; else echo $TRAVIS_PULL_REQUEST_BRANCH; fi)
if [ "${BRANCH}" == "master" ]; then
  docker login --username "${DOCKER_USERNAME}" --password "${DOCKER_PASSWORD}";
  TAG_NAME=$(basename ${TRAVIS_REPO_SLUG})
  docker push cyberdojo/${TAG_NAME};
fi
