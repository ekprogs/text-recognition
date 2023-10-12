import base64

# read the image 
with open("sample.png", "rb") as f:
  base64_string = base64.b64encode(f.read())
  
# encoded base64 string   
print(base64_string)