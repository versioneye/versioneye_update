#!/bin/bash 

VERSIONEYE_SERVER=https://www.versioneye.com
API_KEY=<YOUR_SECRET_API_KEY> # Get it from here: https://www.versioneye.com/settings/api
PROJECT_ID=<YOUR_PROJECT_ID>  # https://www.versioneye.com/user/projects/<PROJECT_ID>
ORGA_NAME=<YOUR_ORGANISATION_NAME>


json=$( curl -F name=project_file -F orga_name=${ORGA_NAME} -F project_file=@$1 "${VERSIONEYE_SERVER}/api/v2/projects/${PROJECT_ID}?api_key=${API_KEY}" )

project_id=$(echo $json | jq '.id' | sed 's/"//g' )
dep_number=$(echo $json | jq '.dep_number')
out_number=$(echo $json | jq '.out_number')
violations=$(echo $json | jq '.licenses_red')

echo ""
echo "Dependencies: $dep_number"
echo "Outdated: $out_number"
echo "License violations: $violations"
echo ""

if [ violations == 0 ]; then
  echo "exit with status code 0"
  exit 0
else
  echo "exit with status code 2"
  exit 2 
fi

echo "Never ever!"
