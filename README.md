# Hafenkran

Hafenkran is a web application for easily deploying your docker containers on a Kubernetes cluster.

It consists / requires the following components:
- A database which can be split into multiple databases for each service.
- A Kubernetes cluster
- The Hafenkran-ClusterService for managing the communication to the cluster.
- The Hafenkran-UserService for organizing users and authentication.
- The Hafenkran-ReportingService for extracting results and logs from finished experiments.
- The Hafenkran-Client for the web interface.

## Setup
- The docker-compose file in this repository builds and deploys every service according to their configuration.
- A central Postgres instance is also deployed.
- The Kubernetes cluster needs to managed seperately. Please take a look at the config options of the ClusterService for setup.
- Generally: when further configuration is required the repositories of the respective service should be consulted.