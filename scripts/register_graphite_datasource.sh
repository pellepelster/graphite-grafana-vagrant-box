#!/bin/bash

GRAFANA_PORT=80
DATASOURCE_NAME="graphite"

while getopts "p:" arg; do
  case $arg in
    p)
      GRAFANA_PORT=$OPTARG
      echo $strength
      ;;
  esac
done

GRAFANA_API_URL="http://localhost:$GRAFANA_PORT/grafana/api"
GRAFANA_DATASOURCE_API_URL="${GRAFANA_API_URL}/datasources"

curl --silent $GRAFANA_DATASOURCE_API_URL | grep --silent "\"name\":\"${DATASOURCE_NAME}\""
if [ $? -eq 0 ]; then
	echo "data source '${DATASOURCE_NAME}' already exists"
else

	MESSAGE=$(curl --silent $GRAFANA_DATASOURCE_API_URL -X PUT -H 'Content-Type: application/json;charset=UTF-8' --data-binary "{ 
		\"name\": \"graphite\", \
		\"type\": \"graphite\", \
		\"access\": \"direct\", \
		\"isDefault\": true, \
		\"url\": \"http://localhost\" }")
		
	if [[ $MESSAGE =~ "Datasource added" ]]; then
		echo "datasource added"
		exit 0
	else
		echo "adding datasource failed (${MESSAGE})"
		exit 1
	fi
	
fi

