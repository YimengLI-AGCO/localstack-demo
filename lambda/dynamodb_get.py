import boto3


def get_all_items(event, context):
    """Get All itmes in status table"""
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('status')
    response = table.scan()
    return response.count()
