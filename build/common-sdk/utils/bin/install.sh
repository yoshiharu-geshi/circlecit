#!/bin/bash

git remote set-branches --add origin $TRAVIS_BRANCH > /dev/null;
git fetch -q;

list=`git diff origin/$TRAVIS_BRANCH --name-only --diff-filter=MACR`;

# install codesniffer
echo "$list" | grep -q -e '.php$' > /dev/null;
if [ $? -eq 0 ]; then
    composer install --no-dev --working-dir=$TRAVIS_SDK_DIR/utils/codesniffer;
else
    echo 'CodeSniffer installation is skipped.';
fi

# install eslint
echo "$list" | grep -q -e '.js$' > /dev/null;
if [ $? -eq 0 ]; then
    cd $TRAVIS_SDK_DIR/utils/eslint;
    npm install --production;
    cd -;
else
    echo 'ESLint installation is skipped.';
fi
