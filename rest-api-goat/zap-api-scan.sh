#!/usr/bin/env bash

target_api_definition="${TARGET_API_DEF}"
level_to_show="${LEVEL_TO_SHOW:-PASS}"
results_file="${REPORT_FILE:-api_report.json}"
report_folder="${REPORT_FOLDER:-reports}"
BASE_PATH="/zap/wrk"

if type jq 2>/dev/null
then
	test -f assets/Postman.json && \
	default_key="$(jq -r '.item[] | select(.name=="Get Customers").request.header[] | select(.key=="X-API-Token").value' < assets/Postman.json)"
api_key=${GOAT_API_TOKEN:-$default_key}
fi
export api_key

if [[ $(grep -c http <<<$target_api_definition) -eq 1 ]]
then
	target_tmp="${TARGET_API_DEF}"
else
	target_tmp=$(grep url "${BASE_PATH}/${TARGET_API_DEF}" | awk -F '"url": "' '{print $2}' | cut -d "\"" -f1)
fi

server_name=$(echo "$target_tmp" | awk -F[/:] '{print $4}')
server_port=$(echo "$target_tmp" | awk -F[/:] '{print $5}')

# show target, server and port
echo "target api-definition: ${target_api_definition}"
echo "target server: ${server_name}"
echo "target port: ${server_port}"

# create folders
test -d "${report_folder}" || mkdir -p "${report_folder}"
chmod 777 "${report_folder}"

# run scanner
zap-api-scan.py \
    -t "${target_api_definition}" \
    -f openapi \
    -d \
    -I \
    -l "${level_to_show}" \
    -J "${report_folder}/${results_file}" \
    -z "-config replacer.full_list(0).description=content" \
    -z "-config replacer.full_list(0).enabled=true" \
    -z "-config replacer.full_list(0).matchtype=REQ_HEADER" \
    -z "-config replacer.full_list(0).matchstr=Content-Type" \
    -z "-config replacer.full_list(0).regex=false" \
    -z "-config replacer.full_list(0).replacement='application/octet-stream'" \
    -z "-config replacer.full_list(0).description=accept" \
    -z "-config replacer.full_list(0).enabled=true" \
    -z "-config replacer.full_list(0).matchtype=REQ_HEADER" \
    -z "-config replacer.full_list(0).matchstr=Accept" \
    -z "-config replacer.full_list(0).regex=false" \
    -z "-config replacer.full_list(0).replacement='application\/json'" \
    -z "-config replacer.full_list(0).description=auth1" \
    -z "-config replacer.full_list(0).enabled=true" \
    -z "-config replacer.full_list(0).matchtype=REQ_HEADER" \
    -z "-config replacer.full_list(0).matchstr=X-API-Token" \
    -z "-config replacer.full_list(0).regex=false" \
    -z "-config replacer.full_list(0).replacement=${api_key}"

echo "result status: $?"
