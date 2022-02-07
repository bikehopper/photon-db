#!/bin/sh

echo 'Fetching photon-db...';
curl -J "http://graphhopper-data-proxy-svc.$POD_NAMESPACE.svc.cluster.local/download1_graphhopper$DOWNLOADS_GRAPHHOPPER_PATH" -o $DOWNLOADS_GRAPHHOPPER_FILE_NAME --silent
echo 'Finished downloading photon-db.';

echo 'Decompressing photon-db...';
bzip2 -cd $DOWNLOADS_GRAPHHOPPER_FILE_NAME | tar x
echo 'Finished decompressing photon-db.';

java -jar ./photon-*.jar
