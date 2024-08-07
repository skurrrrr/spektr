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
with open('/usr/local/bin/spektr/public_ip.json', 'w') as f:
    json.dump({'machine_name': machine_name, 'IP Address': response.text.strip()}, f)