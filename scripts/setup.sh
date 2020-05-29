#!/bin/bash

echo "[START]Zip the lambda function"
cd lambda
zip hello1.py.zip hello1.py
cd ..
echo "[DONE]Zip"

echo "[START]Create S3 bucket and mv the zip file"
awslocal s3 mb s3://local-test-demo-bucket
awslocal s3 cp lambda/hello1.py.zip s3://local-test-demo-bucket
awslocal s3 ls s3://local-test-demo-bucket
echo "[DONE]Create S3 bucket and mv the zip file"

echo "[START]Clean the old CloudFormation file"
rm -f ./template.yaml
echo "[DONE]Clean the old CloudFormation file"

echo "[START]Generate the new CloudFormation file"
cdk synth > ./template.yaml --profile yimengli-dev
echo "[DONE]Generate the new CloudFormation file"

echo "[START]Create the Stack"
awslocal cloudformation create-stack --stack-name test-stack --template-body file://template.yaml
echo "[DONE]Create the Stack"