#!/bin/bash

git checkout gh-pages

version=$1
if [ -z $version ]; then
    echo "Specify version to release";
    git describe --tags;
    exit 1;
fi;

git merge --no-ff -m "release $version" master
git tag "$version"
