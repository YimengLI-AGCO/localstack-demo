import logging


def hello(event, context):
    """Hello World Handler"""

    message = event.get('message', 'Hello World')
    logging.warning('Debug: event' + message)

    return {
        'headers': {
            'lala': 'haha'
        },
        'statusCode': 200,
        'body': "李一萌"
    }

