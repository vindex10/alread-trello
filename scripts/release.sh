#!/bin/bash

version=$1
if [ -z $version ]; then
    echo "Specify version to release";
    git describe --tags gh-pages;
    exit 1;
fi;

set -x

treeObjId=$(git write-tree --prefix=docs/)
commitId=$(git commit-tree -p gh-pages -m "release $version" $treeObjId)
git update-ref refs/heads/gh-pages $commitId
git tag "$version" $commitId
git checkout gh-pages
