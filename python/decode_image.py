import base64, binascii
import json

with open('image.json', 'r') as f:
  data = f.read()

base64_string = json.loads(data)["image_data"]

try:
  image = base64.b64decode(base64_string, validate=True)
  file_to_save = "out_sample.png"
  with open(file_to_save, "wb") as f:
    f.write(image)
except binascii.Error as e:
  print(e)