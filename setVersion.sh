#!/bin/bash

version=$1

function setMavenVersion {
    cd $1
    git checkout develop
    git pull
    mvn versions:set -DgenerateBackupPoms=false -DnewVersion=$version
    git add pom.xml
    git commit -m "update version to $version"
    git tag v$version
}

setMavenVersion hafenkran-clusterservice
setMavenVersion hafenkran-userservice
setMavenVersion hafenkran-reportingservice

cd ./hafenkran-client
npm version --no-git-tag-version $version