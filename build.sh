#!/bin/bash

git submodule foreach "(git checkout develop; git pull; cd ..)"
mvn clean package  -DskipTests -f hafenkran-clusterservice
mvn clean package  -DskipTests -f hafenkran-userservice
mvn clean package  -DskipTests -f hafenkran-reportingservice

cd ./hafenkran-client
npm install
cd ..
