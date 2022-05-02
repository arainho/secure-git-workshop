#!/usr/bin/env bash

target_url="${TARGET}"
level_to_show="${LEVEL_TO_SHOW}"
results_file="${REPORT_FILE:-api_report.json}"
default_key="$(jq -r '.item[] | select(.name=="Get Customers").request.header[] | select(.key=="X-API-Token").value' < assets/Postman.json)"
api_key=${GOAT_API_TOKEN:-$default_key}
export api_key

report_folder="./reports"
config_folder="./private_config"
server_name=$(echo "$target_url" | awk -F[/:] '{print $4}')
server_port=$(echo "$target_url" | awk -F[/:] '{print $5}')

# show target, server and port
echo "target: ${target_url}"
echo "server: ${server_name}"
echo "port: ${server_port}"

# create folders
test -d "${report_folder}" || mkdir -p "${report_folder}"
test -d "${config_folder}" || mkdir -p "${config_folder}"

# run scanner
zap-api-scan.py \
    -t "${target_url}" \
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
    -z "-config replacer.full_list(0).replacement=${api_key}" \

echo "result status: $?"
