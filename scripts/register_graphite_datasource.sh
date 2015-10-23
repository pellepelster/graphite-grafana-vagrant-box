#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BASE_URL="http://localhost"
DATASOURCE_NAME="graphite"
DATASOURCE_JSON="${DIR}/datasource.json"

while getopts "b:j:" arg; do
  case $arg in
    b)
      BASE_URL=$OPTARG
      ;;
    j)
      DATASOURCE_JSON=$OPTARG
      ;;
    esac
done

GRAFANA_API_URL="${BASE_URL}/grafana/api"
GRAFANA_DATASOURCE_API_URL="${GRAFANA_API_URL}/datasources"

curl --silent $GRAFANA_DATASOURCE_API_URL | grep "\"name\":\"${DATASOURCE_NAME}\""
if [ $? -eq 0 ]; then
	echo "data source '${DATASOURCE_NAME}' already exists"
else

	MESSAGE=$(curl $GRAFANA_DATASOURCE_API_URL -X POST -H "Content-Type: application/json;charset=UTF-8" --data-binary "@${DATASOURCE_JSON}")

	if [[ $MESSAGE =~ "Datasource added" ]]; then
		echo "datasource added"
		exit 0
	else
		echo "adding datasource failed (${MESSAGE})"
		exit 1
	fi

fi
