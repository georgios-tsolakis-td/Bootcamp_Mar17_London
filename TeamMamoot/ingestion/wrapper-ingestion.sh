#!/bin/bash

echo "PURPOSE: Setting up Skynet analytics lab"

start=$(date '+%Y%m%d%H%M%S')

echo "Started: $start"

SOURCE_DIR="${1:-/vagrant/flightdata}"
SERVICE_DIR="$(echo $(pwd))"

echo "Setting up Skynet data feeds..."

(exec $SERVICE_DIR/skynet/ingestSkynet.sh $SOURCE_DIR $SERVICE_DIR/skynet)
echo "Done"


echo "Loading adsb exchange data"


echo "Done"


end=$(date '+%Y%m%d%H%M%S')

echo "Total processing time: $(((end - start))) seconds"
echo "Completed"




