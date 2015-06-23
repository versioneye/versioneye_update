#!/bin/bash 

VERSIONEYE_SERVER=https://www.versioneye.com
API_KEY=<YOUR_SECRET_API_KEY> # Get it from here: https://www.versioneye.com/settings/api
PROJECT_ID=<YOUR_PROJECT_ID>  # https://www.versioneye.com/user/projects/<PROJECT_ID>


json=$( curl -F name=project_file -F project_file=@$1 "${VERSIONEYE_SERVER}/api/v2/projects/${PROJECT_ID}?api_key=${API_KEY}" )

project_id=$(echo $json | jq '.id' | sed 's/"//g' )
dep_number=$(echo $json | jq '.dep_number')
out_number=$(echo $json | jq '.out_number')
violations=$(echo $json | jq '.licenses_red')

echo ""
echo "Dependencies: $dep_number"
echo "Outdated: $out_number"
echo "License violations: $violations"
