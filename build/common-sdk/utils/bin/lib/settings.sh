#!/bin/bash
MAX_ONE_COMMENT_SIZE=100000;

TARGET_BRANCH=$CIRCLE_BRANCH
COMMON_PULL_REQUEST=$CIRCLE_PULL_REQUEST

if [[ ${CIRCLE_PULL_REQUEST} =~ ([0-9]+)$ ]]; then
  PULL_REQUEST_NUM=${BASH_REMATCH[1]}
fi

url="https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls/$PULL_REQUEST_NUM"

TARGET_BRANCH=$(
  curl -s -H "Authorization: token $GITHUB_ACCESS_TOKEN" "$url" | jq '.base.ref' | tr -d '"'
)

echo "target branch is $TARGET_BRANCH"
