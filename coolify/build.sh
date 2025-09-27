#!/bin/sh
set -eu

# -host param is setup as a network alias for the nominatim service in coolify
exec java -jar photon-*.jar -nominatim-import -host nominatim.cool-bikehopper.org -port 5432 -database nominatim -user nominatim -password $NOMINATIM_PASSWORD