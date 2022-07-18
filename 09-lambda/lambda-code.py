import boto3
import json

def main(event, context):
    db = boto3.client('dynamodb')

    db.put_item(TableName = 'willDeBerry-table', Item = {'item': {'S': event['body']}})}
