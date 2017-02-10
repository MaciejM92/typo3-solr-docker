#!/bin/bash

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

###################
# Create solr data directories (on demand)
###################
grep -o "dataDir=\"[^'\"]*\"" /opt/solr/example/solr/solr.xml | sed -E 's/dataDir="(.+)"/\1/' | while read SOLR_CORE; do
    mkdir -p  "/opt/solr/example/solr/typo3cores/$SOLR_CORE"
    chmod 777 "/opt/solr/example/solr/typo3cores/$SOLR_CORE"
done

#############################
## COMMAND
#############################

if [ "$1" = 'solr' ]; then
    exec java -jar start.jar
fi

exec "$@"
