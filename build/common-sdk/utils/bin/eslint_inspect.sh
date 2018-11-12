#!/bin/bash

. build/common-sdk/utils/bin/lib/settings.sh

COMMENT_TITLE="# ESLint Inspection Result: ";

TARGET_LIST=`git diff --name-only origin/$TARGET_BRANCH | grep -e '.js$'`

if [ -z "$TARGET_LIST" ]; then
    echo 'ESLint inspection is skipped.';
    echo "${COMMENT_TITLE}Skipped";

    exit 0;
else
    echo "$TARGET_LIST";
    exit 0;
fi
