#!/bin/bash

. .circleci/utils/bin/lib/settings.sh

echo "Start"
TARGET_LIST=`git diff --name-only origin/$TARGET_BRANCH | grep -e '.php$'`

if [ -z "$TARGET_LIST" ]; then
    echo "PHP file not changed."
    exit 0
fi

RESULT=`echo $TARGET_LIST \
    | xargs vendor/bin/phpcs --standard=PSR2 --report=checkstyle`

RESULT_TEXT=`echo $RESULT | bundle exec saddler report \
    --require saddler/reporter/text \
    --reporter Saddler::Reporter::Text`
if [ -n "$RESULT_TEXT" ]; then
    if [ -n "$COMMON_PULL_REQUEST" ]; then
        `echo $RESULT | bundle exec saddler report \
            --require saddler/reporter/github \
            --reporter Saddler::Reporter::Github::PullRequestReviewComment`
    fi

    echo ""
    echo "An error has been detected,this following:"
    echo "$RESULT_TEXT"
    exit 1
else
    echo "Passed"
    exit 0
fi
