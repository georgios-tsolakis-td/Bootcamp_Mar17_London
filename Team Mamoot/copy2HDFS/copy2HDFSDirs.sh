#!/bin/bash

echo "PURPOSE: put data to HDFS from edge node"

start=$(date '+%Y%m%d%H%M%S')


echo "Started: $start"

if [[ "$#" -lt 1 ]]; then

echo -e  "Nothing to do. Not enough input arguments. 
\nFirst argument is a full path to the source directory with data in edge node."

else

SOURCE_DIR="$1"
OUTPUT_DIR=/data/flightdata

echo "Creation of directories in HDFS"

hdfs dfs -mkdir -p /vagrant/flightdata 

echo "Put aircraft registrations data from edge node to HDFS $OUTPUT_DIR/aircraft-registrations "

hdfs dfs -put $SOURCE_DIR/aircraft-registrations/ $OUTPUT_DIR

echo "Put flight data from edge node to HDFS $OUTPUT_DIR/parquet-trimmed "

hdfs dfs -put $SOURCE_DIR/parquet-trimmed/ $OUTPUT_DIR

fi


end=$(date '+%Y%m%d%H%M%S')

echo "Total processing time: $(((end - start))) seconds"
echo "Completed"

exit


