import boto3
import logging
from botocore.exceptions import ClientError
import traceback

logger = logging.getLogger()
dynamodb = boto3.resource('dynamodb', endpoint_url='http://localhost:4569/')
table_name = 'status'
try:
    table = dynamodb.create_table(
        TableName=table_name,
        KeySchema=[
            {
                'AttributeName': 'id',
                'KeyType': 'HASH'
            }
        ],
        AttributeDefinitions=[
            {
                'AttributeName': 'id',
                'AttributeType': 'S'
            }
        ],
        ProvisionedThroughput={
            'ReadCapacityUnits': 5,
            'WriteCapacityUnits': 5
        }
    )

    table.meta.client.get_waiter('table_exists').wait(TableName=table_name)
except ClientError as e:
    if 'ResourceInUseException' == e.response['Error']['Code']:
        logger.error('table: {name} already exists, can\'t create it again'.format(name=table_name))
    else:
        traceback.print_exc()
