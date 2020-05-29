#!/bin/bash

echo "[START]Clean old get_all_items_response.json"
rm -f ./get_all_items_response.json
echo "[DONE]Clean old get_all_items_response.json"

echo "[START]Invoke & Print the output of the get_all_items_response function"
awslocal lambda invoke --function-name getAllItems get_all_items_response.json
cat get_all_items_response.json | jq
echo "[End]Invoke & Print the output of the get_all_items_response function"
