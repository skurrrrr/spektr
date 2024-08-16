import json
import requests

with open('/usr/local/bin/spektr/ip.json') as f:
    data = json.load(f)

webhook_url = 'https://discord.com/api/webhooks/1272102141690904586/4vqKTtmOVps4MfOEeGXidL4WcrrDYnaGMd9CPeQVblulzrAE9Go4r-qfCeqleQgYb_Xp'
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