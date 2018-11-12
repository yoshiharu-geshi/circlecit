#!/bin/bash

. build/common-sdk/utils/bin/lib/settings.sh

PHP_VERSION="`php -v | tr -d '\n' | cut -d ' ' -f2`";
COMMENT_TITLE="# PHP Syntax (${PHP_VERSION}) Inspection Result: ";

TARGET_LIST=`git diff --name-only origin/$TARGET_BRANCH | grep -e '.php$'`

if [ -z "$TARGET_LIST" ]; then
    echo 'PHP syntax inspection is skipped.';
    # echo "${COMMENT_TITLE}Skipped";

    exit 0;
else
    RESULT=`echo "$TARGET_LIST" | xargs -I{} php -l {} | grep -e '^No' -v`;
    if [ -n $RESULT ]; then
        echo $RESULT;
        exit 0;
    else
        echo "Passed";
        exit 0;
    fi
fi
