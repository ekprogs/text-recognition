import base64
import json
import easyocr


def lambda_handler(event, context):
    payload = json.loads(event["body"])
    base64_string = payload["image_data"]
    image = base64.b64decode(base64_string, validate=True)
    reader = easyocr.Reader(
        ["en"]
    )  # this needs to run only once to load the model into memory
    result = reader.readtext(image, detail=0)
    return {"statusCode": 200, "body": result}


# Uncomment all logics below to test locally
# with open('image.json', 'r') as f:
#   data = f.read()
  
# event = {"body": data}
# print(lambda_handler(event, "b"))
