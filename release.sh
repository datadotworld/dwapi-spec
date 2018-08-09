#!/usr/bin/env bash
set -o nounset -o xtrace -o errexit -o pipefail

NOW_VERSION="0.16.2"
NEXT_VERSION="0.16.1"

PAYLOAD="{
    \"build_parameters\": {
        \"MVN_RELEASE_TAG\": \"v${NOW_VERSION}\",
        \"MVN_RELEASE_VER\": \"${NOW_VERSION}\",
        \"MVN_RELEASE_DEV_VER\": \"${NEXT_VERSION}-SNAPSHOT\",
        \"MVN_RELEASE_USER_EMAIL\": \"kenny.shittu@data.world\",
        \"MVN_RELEASE_USER_NAME\": \"Via CircleCI\"
    }
}"
curl -v -X POST -H "Content-Type: application/json" -d "${PAYLOAD}" "https://circleci.com/api/v1/project/datadotworld/dwapi-spec/tree/master?circle-token=79ee68a72eaf3b5e1dcfb495735728dd130b4be5"
