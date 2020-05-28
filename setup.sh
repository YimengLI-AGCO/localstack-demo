cd lambda
zip hello1.py.zip hello1.py
cd ..

awslocal s3 mb s3://local-test-demo-bucket
awslocal s3 cp lambda/hello1.py.zip s3://local-test-demo-bucket
awslocal s3 ls s3://local-test-demo-bucket

cdk synth > ./template.yaml --profile yimengli-dev

awslocal cloudformation create-stack --stack-name test-stack --template-body file://template.yaml
