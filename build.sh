#!/bin/bash

npm install --prefix hafenkran-client
mvn clean package  -DskipTests -f hafenkran-clusterservice
mvn clean package  -DskipTests -f hafenkran-userservice
mvn clean package  -DskipTests -f hafenkran-reportingservice
