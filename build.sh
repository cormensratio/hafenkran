#!/bin/bash

git submodule init
git submodule update
git submodule foreach 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; git clean -dfx'

mvn clean package  -DskipTests -f hafenkran-clusterservice
mvn clean package  -DskipTests -f hafenkran-userservice
mvn clean package  -DskipTests -f hafenkran-reportingservice