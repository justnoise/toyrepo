#!/bin/bash

echo "running tests"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$SCRIPT_DIR/..
cd $ROOT_DIR

echo "root directory: $ROOT_DIR"

CURRENT_BRANCH=$(echo $GIT_BRANCH   | sed -e "s|origin/||g")
CURRENT_TAG=$(git tag -l --points-at HEAD | head -n 1)

sleep 10

echo "current branch: $CURRENT_BRANCH"
echo "git local branch: $GIT_BRANCH_LOCAL"
echo "current tag: $CURRENT_TAG"

if [[ $CURRENT_BRANCH == "master" ]]; then
    echo "detected that we are currently on master branch"
else
    echo "detected that we are currently on $CURRENT_BRANCH branch"
fi

if [[ $CURRENT_TAG =~ ^v[0-9].* ]]; then
    echo "we are currently on a release tag"
fi

echo "done"

sleep 10

echo "totally done"
