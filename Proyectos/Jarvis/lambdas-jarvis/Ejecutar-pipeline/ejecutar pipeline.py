
import boto3 
import time

def lambda_handler(event, context):
    capacidad = event["capacity"]
    insert_log(capacidad)

    response = {"capacity": capacidad}
    return response

def insert_log(capacidad):
    current_time = time.ctime()
    identificador = "capacidad-" + capacidad
    dynamodb = boto3.resource("dynamodb")
    table = dynamodb.Table("jarvis-capacities-dev")
    response = table.put_item(
        TableName="jarvis-capacities-dev",
        Item={
            "identificacion": identificador,
            "secuencia": 4,
            "notas": "inicio ejecutar pipeline",
            "inicio": current_time
        }
    )
    return response
