#!/bin/bash

wget https://junzisun.com/adb/download -O /tmp/aircrafts.csv.gz
gunzip /tmp/aircrafts.csv.gz
hdfs dfs -mkdir /data/aircrafts/
hdfs dfs -put /tmp/aircrafts.csv /data/aircrafts
