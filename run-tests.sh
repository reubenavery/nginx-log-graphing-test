#!/bin/bash

HOST=${1:-localhost}
PORT=${2:-8080}
ITERATIONS=${3:-20}
ITERATION=0
TOTAL_200=0
TOTAL_400=0
TOTAL_404=0
TOTAL_500=0
TOTAL_503=0

echo "HOST=$HOST"
echo "PORT=$PORT"
echo "ITERATIONS=$ITERATIONS"

CODES=( 200 400 404 500 503 )

while ([[ $ITERATIONS -gt 0 ]] && [[ $ITERATION -lt $ITERATIONS ]]); do
    ITERATION=$((ITERATION+1))
    echo "ITERATION $ITERATION/$ITERATIONS"

    RANDOM_SELECTION=$((RANDOM%5))

    CODE=${CODES[$RANDOM_SELECTION]}
    echo "CODE=$CODE"
    TOTALS[$CODE]=$((${TOTALS[$CODE]}+1))

    echo "curl http://${HOST}:${PORT}/mock${CODE}.php"

    RESPONSE=`curl -s "http://$HOST:$PORT/mock$CODE.php"`

    if [[ $? -ne 0 ]] || [[ ! $RESPONSE =~ ${CODE}.+\(mocked\) ]]; then
        echo "BAD RESPONSE: $RESPONSE"
        exit 1
    fi

    SLEEP_FOR="0.$[ ( (RANDOM % 10) + 1 ) ]"
    echo "Sleeping for $SLEEP_FOR seconds"

    sleep ${SLEEP_FOR}s
done

for CODE in "${CODES[@]}"; do
    if [[ -z ${TOTALS[$CODE]} ]]; then
        TOTALS[$CODE]=0
    fi
    echo "Result ${CODE} count: ${TOTALS[$CODE]}"
done
