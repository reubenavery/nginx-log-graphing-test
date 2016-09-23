#!/usr/bin/env bash

BOOTSTRAP_FILE=/opt/kibana/kibana-bootstrap.json
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

if [[ -e $BOOTSTRAP_FILE ]]; then
    if [[ -e /opt/kibana/.bootstrapped ]]; then
        echo "Kibana already bootstrapped"
    else
        echo "Bootstrapping Elasticsearch Kibana index"
        if [[ ! -z `which elasticdump` ]]; then
            echo "Launching Elasticdump import"
            elasticdump \
                --input=$BOOTSTRAP_FILE \
                --output="http://${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}/.kibana" \
                --type=data && touch /opt/kibana/.bootstrapped
        else
            echo "Elasticdump not found?"
            exit 1
        fi
   fi
else
    echo "Can't find /opt/kibana/kibana-bootstrap.json to bootstrap from"
fi
