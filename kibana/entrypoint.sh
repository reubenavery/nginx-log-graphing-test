#!/usr/bin/env bash

ELASTICSEARCH_HOST='elasticsearch'
ELASTICSEARCH_PORT=9200

# Wait for the Elasticsearch container to be ready before starting Kibana.
echo "Stalling for Elasticsearch"
x=0
while [ "$x" -lt 120 ]; do
    x=$((x+1))
    echo -ne '.'
    nc -q 1 $ELASTICSEARCH_HOST $ELASTICSEARCH_PORT 2>/dev/null && break
    if [ "$x" -eq 120 ]; then
        echo ''
        echo "Timeout!"
        exit 1
    fi
    sleep .5s
done
echo ''
echo "Elasticsearch ready"

echo "Starting Kibana"
exec kibana
