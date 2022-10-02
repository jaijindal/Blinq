import json
f = open('sample-data.json')
data = json.load(f)
data.split("{")
uv = float(data[16:20])
print(uv)