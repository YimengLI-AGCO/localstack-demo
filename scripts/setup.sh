#!/bin/bash

echo "[START]Zip the lambda functions"
cd lambda
rm -f dynamodb_get.py.zip hello1.py.zip
zip hello1.py.zip hello1.py
zip dynamodb_get.py.zip dynamodb_get.py
cd ..
echo "[DONE]Zip"

pipenv run python scripts/create_dynamodb_table.py

echo "[START]Create S3 bucket and mv the zip files"
awslocal s3 mb s3://local-test-demo-bucket
awslocal s3 cp lambda/hello1.py.zip s3://local-test-demo-bucket
awslocal s3 cp lambda/dynamodb_get.py.zip s3://local-test-demo-bucket
awslocal s3 ls s3://local-test-demo-bucket
echo "[DONE]Create S3 bucket and mv the zip files"

echo "[START]Clean the old CloudFormation file"
rm -f ./template.yaml
echo "[DONE]Clean the old CloudFormation file"

echo "[START]Generate the new CloudFormation file"
cdk synth > ./template.yaml --profile yimengli-dev
echo "[DONE]Generate the new CloudFormation file"

echo "[START]Create the Stack"
awslocal cloudformation create-stack --stack-name test-stack --template-body file://template.yaml
echo "[DONE]Create the Stack"
