#!/bin/bash

SOURCE_DIR="${1:-/vagrant/flightdata}"
OUTPUT_DIR=/data/flightdata

echo "Creation of directories in HDFS"

if [[ $(hdfs dfs -test -d $OUTPUT_DIR) -ne 0 ]] ; 
then
 hdfs dfs -mkdir -p $OUTPUT_DIR; 
fi

echo "Put aircraft registrations data from edge node to HDFS $OUTPUT_DIR/aircraft-registrations "
hdfs dfs -put $SOURCE_DIR/aircraft-registrations/ $OUTPUT_DIR


echo "Put flight data from edge node to HDFS $OUTPUT_DIR/parquet-trimmed "
hdfs dfs -put $SOURCE_DIR/parquet-trimmed/ $OUTPUT_DIR

