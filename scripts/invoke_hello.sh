#!/bin/bash

echo "[START]Clean old hello_response.json"
rm -f ./hello_response.json
echo "[DONE]Clean old hello_response.json"

echo "[START]Invoke & Print the output of the hello1 function"
awslocal lambda invoke --function-name hello1 hello_response.json
cat hello_response.json | jq
echo "[End]Invoke & Print the output of the hello1 function"