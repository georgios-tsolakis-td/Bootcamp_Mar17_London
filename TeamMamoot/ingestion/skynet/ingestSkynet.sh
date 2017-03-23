#!/bin/bash

echo "Ingestion of Skynet flight data and FAA data"

start=$(date '+%Y%m%d%H%M%S')

echo "Ingestion started: $start"

SOURCE_DIR="${1:-/vagrant/flightdata}"
SERVICE_DIR="${2:-$(echo $(pwd))}"

echo "Loading data to HDFS to $1..."
(exec $SERVICE_DIR/put2HDFS.sh $SOURCE_DIR)
echo "Done"


echo "Creating Hive tables for skynet data to skynet database..."
hive -f $SERVICE_DIR/skynetParquet.hql -d DB=skynet 
echo "Done"
hive -f $SERVICE_DIR/aircraftReg.hql -d DB=aircraft

echo "Creating Hive tables for FAA data to aircraft database..."


echo "Done"


end=$(date '+%Y%m%d%H%M%S')

echo "Ingestion processing time: $(((end - start))) seconds"
echo "Ingestion completed"




