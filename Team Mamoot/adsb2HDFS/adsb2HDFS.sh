#!/bin/bash

function help_menu() {
    echo ". adsb2HDFS.sh [-d] [-s]"
    echo "Commands:"
    echo "  clear : Removes all files generated"
    echo "Arguments:"
    echo "  -d | --days : Retrieve data from yesterday til [-d | --days] ago. 7 days as defaul value."
    echo "  -h | --help : Help menu"
    echo "  -s | --skip : Skips the download and extraction phase"
}

function init() {
    echo "----- Starting ingest from ads-b exchange data -----"
    DAYS_FROM_YESTERDAY=7
    ADSBEXCHANGE_FOLDER=/vagrant/adsbexchange
    SKIP_DOWNLOAD_UNZIP=0
    ADSBEXCHANGE_TEMP_FOLDER=/data/tmp/adsbexchange
    HDFS_FOLDER=/data/flightdata/adsbexchange
    mkdir -p $ADSBEXCHANGE_TEMP_FOLDER
    hdfs dfs -mkdir -p $HDFS_FOLDER
}

function finalise() {
    echo "----- Deleting ads-b exchange data -----"
    rm -rf $ADSBEXCHANGE_TEMP_FOLDER $ADSBEXCHANGE_FOLDER
    echo "----- ads-b exchange data deleted -----"
}

function get_files() {
    echo "Retrieving files from adsbexchange"
    for ((i=1; i<$DAYS_FROM_YESTERDAY+1; i+=1));
    do
        current_date=$(date -I --date="$(echo $i days ago)")
        current_file=$(echo http://history.adsbexchange.com/Aircraftlist.json/$current_date.zip)
        echo "Downloading $current_file ..."
        ADSBEXCHANGE_CURRENT_FILE=$ADSBEXCHANGE_FOLDER/$current_date.zip
        wget -N --force-directories -O $ADSBEXCHANGE_CURRENT_FILE $current_file
    done
    for file in $(find $ADSBEXCHANGE_FOLDER -name "*.zip"); do
        unzip -o $file -d $ADSBEXCHANGE_TEMP_FOLDER;
    done
}

function ingest_files() {
    echo "Moving data into hdfs"
    spark-shell -i adsb2Parquet.scala
}

init

while [ $# -gt 0 ]
do
    case "$1" in
        -d|--days) 
            DAYS_FROM_YESTERDAY=$2
            shift
        ;;
        -h|--help)
            help_menu
            exit 0
        ;;
        -s|--skip)
            SKIP_DOWNLOAD_UNZIP=1
        ;;
        clear)
            finalise
            exit 0
        ;;
    esac

    shift
done

if [ $SKIP_DOWNLOAD_UNZIP -eq 0 ] ; then
   get_files
else 
   echo "Skipping download and unzip"
fi

ingest_files

hdfs dfs -copyFromLocal -f $ADSBEXCHANGE_TEMP_FOLDER/* $HDFS_FOLDER

echo "----- Ingest finished ------"
