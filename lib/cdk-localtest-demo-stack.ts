import * as cdk from '@aws-cdk/core';
import * as lambda from '@aws-cdk/aws-lambda';
import * as s3 from '@aws-cdk/aws-s3';
import * as dynamodb from '@aws-cdk/aws-dynamodb';


export class CdkLocalTestDemoStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);
    const bucket = s3.Bucket.fromBucketName(this, 'hello-bucket', 'local-test-demo-bucket');

    // The code that defines your stack goes here
    new lambda.Function(this, 'Hello', {
      functionName: 'hello1',
      runtime: lambda.Runtime.PYTHON_3_7,
      code: lambda.S3Code.fromBucket(bucket, 'hello1.py.zip'),
      handler: 'hello1.hello'
    });

    const statusTable = dynamodb.Table.fromTableName(this, 'StatusTable', 'status');
    const get_all_items = new lambda.Function(this, 'GetItems', {
      functionName: 'getAllItems',
      runtime: lambda.Runtime.PYTHON_3_7,
      code: lambda.S3Code.fromBucket(bucket, 'dynamodb_get.py.zip'),
      handler: 'dynamodb_get.get_all_items'
    });

    statusTable.grantFullAccess(get_all_items);
  }
}
