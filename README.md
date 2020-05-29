## Useful commands

#### Step 1: Up and run the localstack
```shell script
$ ./scripts/run.sh
```

#### Step 2: Set up env
* Create DynamoDB Table
* Create s3 Bucket to store the lambda functions
* zip the lambda functions, and store zip files into the s3 Bucket
* Generate the CloudFormation File
* Create the Stack locally with the generated CloudFormation file

```shell script
$ ./scripts/setup.sh
```

#### Step 3: Invoke functions

Invoke hello world lambda function
```shell script
$ ./scripts/invoke_hello.sh
```

Invoke dynamo db read lambda function
```shell script
$ ./scripts/invoke_get_all_items.sh
```
