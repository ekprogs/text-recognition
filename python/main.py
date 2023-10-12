import json
import easyocr


def lambda_handler(event, context):
    reader = easyocr.Reader(
        ["en"]
    )  # this needs to run only once to load the model into memory
    result = reader.readtext("sample.png")
    return {"statusCode": 200, "body": result}


print(lambda_handler("a", "b"))
