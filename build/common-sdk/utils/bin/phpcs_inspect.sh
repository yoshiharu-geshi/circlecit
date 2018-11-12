#!/bin/bash

. build/common-sdk/utils/bin/lib/settings.sh

echo "Start"
TARGET_LIST=`git diff --name-only origin/$TARGET_BRANCH | grep -e '.php$'`

if [ -z "$TARGET_LIST" ]; then
    echo "PHP file not changed."
    exit 0
fi

RESULT=`git diff --name-only origin/master \
    | grep -e '.php$' \
    | xargs vendor/bin/phpcs --standard=PSR2 --report=checkstyle \
    | bundle exec checkstyle_filter-git diff origin/master`

echo $RESULT

RESULT=`echo $TARGET_LIST \
    | xargs vendor/bin/phpcs --standard=PSR2 --report=checkstyle \
    | bundle exec checkstyle_filter-git diff origin/$TARGET_BRANCH`

if [ -n "$COMMON_PULL_REQUEST" ]; then
    `echo $RESULT | bundle exec saddler report \
        --require saddler/reporter/github \
        --reporter Saddler::Reporter::Github::PullRequestReviewComment`
fi

RESULT_TEXT=`echo $RESULT | bundle exec saddler report \
    --require saddler/reporter/text \
    --reporter Saddler::Reporter::Text`
if [ -n "$RESULT_TEXT" ]; then
    echo ""
    echo "An error has been detected,this following:"
    echo "$RESULT_TEXT"
    exit 1
else
    echo "Passed"
    exit 0
fi
