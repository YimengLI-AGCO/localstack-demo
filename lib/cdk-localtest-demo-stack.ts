import * as cdk from '@aws-cdk/core';
import * as lambda from '@aws-cdk/aws-lambda';
import * as s3 from '@aws-cdk/aws-s3';
import * as apigateway from '@aws-cdk/aws-apigateway';


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
  }
}
