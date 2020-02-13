#!/bin/sh

shutdown() {
  echo "Stopping all services..."
  pkill -P $$ &> /dev/null
  docker-compose down &> /dev/null
  exit 0
}

trap "shutdown" SIGINT SIGTERM

echo "Starting db..."
docker-compose up -d hafenkran-db &> db.log &
echo "Starting client..."
npm start --prefix hafenkran-client &> client.log &
sleep 5
echo "Starting US..."
mvn spring-boot:run -Dspring-boot.run.profiles=dev -f hafenkran-userservice &> us.log &
echo "Starting RS..."
mvn spring-boot:run -Dspring-boot.run.profiles=dev -f hafenkran-reportingservice &> rs.log &
echo "Starting CS..."
mvn spring-boot:run -Dspring-boot.run.profiles=dev -f hafenkran-clusterservice &> cs.log &
echo "Done"

echo "Press CTRL-C to stop the services"
child=$!
wait "$child"
