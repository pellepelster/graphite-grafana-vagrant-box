#!/bin/bash

SCRIPT_PATH="`dirname \"$0\"`"

GRAFANA_PORT=80
DATASOURCE_NAME="graphite"
DASHBOARD_JSON="${SCRIPT_PATH}/sample_dashboard.json"

while getopts "p:j:" arg; do
  case $arg in
    p)
      GRAFANA_PORT=$OPTARG
      ;;
    j)
      DASHBOARD_JSON=$OPTARG
      ;;
  esac
done

GRAFANA_API_URL="http://localhost:${GRAFANA_PORT}/grafana/api"
GRAFANA_DASHBOARD_API_URL="${GRAFANA_API_URL}/dashboards/db"

MESSAGE=$(curl --silent -X POST $GRAFANA_DASHBOARD_API_URL -H "Content-Type: application/json" --data-binary "@${DASHBOARD_JSON}")
	
if [[ $MESSAGE =~ "\"status\":\"success\"" ]]; then
	echo "dashboard added"
	exit 0
else
	echo "adding dashboard failed (${MESSAGE})"
	exit 1
fi