import requests
import json

# Send the request and store the response
response  = requests.get('https://api.ipify.org/')

# Read the config.json file installed at /usr/local/bin
with open('/usr/local/bin/spektr/spektr_config.json', 'r') as f:
    config = json.load(f)

# Access the value from the JSON object
machine_name = config['this machine']

# Save the content of the response as a JSON file with the new key-value pair
with open('/usr/local/bin/spektr/ip.json', 'w') as f:
    json.dump({'machine_name': machine_name, 'IP Address': response.text.strip()}, f)

with open('/usr/local/bin/spektr/ip.json') as f:
    data = json.load(f)

webhook_url = 'https://discord.com/api/webhooks/1177047018363957414/dxFB_PVZlOHUV4yrx1dNM2WpkVuVMlxV3JkIHytAwbAMjB-LwPR-ao-gqygkMJ66K7GR'
data = {
    "username": data["machine_name"],
    "content": f"IP Address: {data['IP Address']}"
}

headers = {
    'Content-Type': 'application/json'
}

response = requests.post(webhook_url, json=data, headers=headers)

if response.status_code == 204:
    print("Message sent successfully!")
else:
    print(f"Error: {response.text}")