#!/usr/bin/env bash
set -o nounset -o xtrace -o errexit -o pipefail

PAYLOAD="{
    \"build_parameters\": {
        \"MVN_RELEASE_TAG\": \"v${DWAPISPEC_NOW_VERSION}\",
        \"MVN_RELEASE_VER\": \"${DWAPISPEC_NOW_VERSION}\",
        \"MVN_RELEASE_DEV_VER\": \"${DWAPISPEC_NEXT_VERSION}-SNAPSHOT\",
        \"MVN_RELEASE_USER_EMAIL\": \"${DWAPISPEC_RELEASE_USER_EMAIL}\",
        \"MVN_RELEASE_USER_NAME\": \"Via CircleCI\",
        \"CIRCLE_JOB\": \"release_build\"
    }
}"
curl -v -X POST -H "Content-Type: application/json" -d "${PAYLOAD}" "https://circleci.com/api/v1.1/project/github/datadotworld/dwapi-spec/tree/master?circle-token=${CIRCLE_TOKEN}"
