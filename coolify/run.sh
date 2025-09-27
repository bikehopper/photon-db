#!/bin/sh
java -jar photon-*.jar -nominatim-import -host local.nominatim.db -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD
java -jar photon-*.jar