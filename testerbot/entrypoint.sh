#!/usr/bin/env bash

HOST=${1:-localhost}
PORT=${2:-8080}
TOTAL_200=0
TOTAL_400=0
TOTAL_404=0
TOTAL_500=0
TOTAL_503=0

CODES=( 200 400 404 500 503 )

while [ $? ]; do
    RANDOM_SELECTION=$((RANDOM%5))

    CODE=${CODES[$RANDOM_SELECTION]}
    TOTALS[$CODE]=$((${TOTALS[$CODE]}+1))

    echo -ne "Requesting http://${HOST}:${PORT}/mock${CODE}.php: "

    RESPONSE=`curl -s "http://$HOST:$PORT/mock$CODE.php"`

    if [[ $? -ne 0 ]] || [[ ! $RESPONSE =~ ${CODE}.+\(mocked\) ]]; then
        echo "Failed, BAD RESPONSE: $RESPONSE"
    else
        echo "OK"
    fi

    SLEEP_FOR="0.$[ ( (RANDOM % 10) + 1 ) ]"
    sleep ${SLEEP_FOR}s
done
