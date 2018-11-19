#!/bin/bash

. build/common-sdk/utils/bin/lib/settings.sh

echo "Start"
TARGET_LIST=`git diff --name-only --diff-filter=MACR origin/$TARGET_BRANCH | grep -e '.php$'`

if [ -z "$TARGET_LIST" ]; then
    echo "PHP file not changed."
    exit 0
fi

RESULT=`vendor/bin/phpmd "$(echo $TARGET_LIST | tr ' ' ',')" text unusedcode,cleancode,codesize`

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
