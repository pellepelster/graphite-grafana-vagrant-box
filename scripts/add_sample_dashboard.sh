#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BASE_URL="http://localhost"
DATASOURCE_NAME="graphite"
DASHBOARD_JSON="${DIR}/sample_dashboard.json"

while getopts "b:j:" arg; do
  case $arg in
    b)
      BASE_URL=$OPTARG
      ;;
    j)
      DASHBOARD_JSON=$OPTARG
      ;;
  esac
done

GRAFANA_API_URL="${BASE_URL}/grafana/api"
GRAFANA_DASHBOARD_API_URL="${GRAFANA_API_URL}/dashboards/db"

MESSAGE=$(curl --silent -X POST $GRAFANA_DASHBOARD_API_URL -H "Content-Type: application/json" --data-binary "@${DASHBOARD_JSON}")

if [[ $MESSAGE =~ "\"status\":\"success\"" ]]; then
	echo "dashboard added"
	exit 0
else
	echo "adding dashboard failed (${MESSAGE})"
	exit 1
fi
