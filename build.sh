#!/bin/bash

git submodule update --recursive --remote
mvn clean package  -DskipTests -f hafenkran-clusterservice
mvn clean package  -DskipTests -f hafenkran-userservice
mvn clean package  -DskipTests -f hafenkran-reportingservice

cd ./hafenkran-client
npm install
npm start

cd ..