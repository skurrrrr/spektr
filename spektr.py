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

webhook_url = 'https://discord.com/api/webhooks/1138255787102314506/oyNaqCCFiAds2bBeGH3A6v6lnuj7zmQ1BxzeVe1YXIvJeWT9W5EOYW8lYwZ-lu61wDHl'
data = {
    "username": data["machine_name"],
    "content": f"IP: {data['IP Address']}"
}

headers = {
    'Content-Type': 'application/json'
}

response = requests.post(webhook_url, json=data, headers=headers)

if response.status_code == 204:
    print("Message sent successfully!")
else:
    print(f"Error: {response.text}")