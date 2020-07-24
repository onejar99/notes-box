#!/bin/bash

function checkIfErr() {
    ret=$?
    echo "ret=[${ret}]"
    if [ ! $ret = '0' ]; then
        echo "Oops something wrong! exit code: ${ret}"
        exit $ret;
    fi
}

echo "SHELL=[$SHELL]"
echo "HOME=[$HOME]"
echo "GITHUB_WORKSPACE=[$GITHUB_WORKSPACE]"
echo "GITHUB_RUN_ID=[$GITHUB_RUN_ID]"
echo "GITHUB_REPOSITORY=[$GITHUB_REPOSITORY]"
echo "GITHUB_SHA=[$GITHUB_SHA]"
echo "MY_SECRET=[$MY_SECRET]"
echo "USER_NAME=[$USER_NAME]"
echo "USER_EMAIL=[$USER_EMAIL]"
echo "OUTPUT_DIR=[$OUTPUT_DIR]"
echo "whoami=[$(whoami)]"
echo "pwd=[$(pwd)]"
GH_PAGES_FOLDER=${GITHUB_REPOSITORY}_ghpages
export GH_PAGES_FOLDER
echo "GH_PAGES_FOLDER=[$GH_PAGES_FOLDER]"
ls -al

echo '[INFO] Clone repository and switch to branch gh-pages...'
git clone -b gh-pages --single-branch https://${MY_SECRET}@github.com/${GITHUB_REPOSITORY}.git ${GH_PAGES_FOLDER} # error if no gh-pages branch
checkIfErr
# git clone https://${MY_SECRET}@github.com/${GITHUB_REPOSITORY}.git ${GH_PAGES_FOLDER}
# checkIfErr
# cd ${GH_PAGES_FOLDER}
# git checkout -b gh-pages
# checkIfErr
# cd ..

echo '[INFO] Copy GitBook output pages...'
ls -al
rm -rf $GH_PAGES_FOLDER/$BOOK_DIR
cp -rf $OUTPUT_DIR $GH_PAGES_FOLDER/$BOOK_DIR
cd $GH_PAGES_FOLDER
ls -al

echo '[INFO] Add new commit for gh-pages...'
git config --local user.name $USER_NAME
git config --local user.email $USER_EMAIL
git status
git add --all
git commit -m "Deploy to Github Pages 🥂 (from $GITHUB_SHA)"
checkIfErr
echo '[INFO] Push to gh-pages...'
git push --set-upstream origin gh-pages -f
checkIfErr
echo '[INFO] Deploy gh-pages completed! 💪💯'
