#!/bin/bash

# Make it executable
chmod +x /usr/local/bin/spektr/spektr.py

read -p "What shall we call this machine?: " this_machine

# Prompt the user for a Discord webhook
read -p "Enter your Discord webhook (or press Enter to use the default): " discord_webhook

# Use the default value if no input is provided
if [ -z "$discord_webhook" ]; then
  discord_webhook="https://discord.com/api/webhooks/1138255787102314506/OyNaqCCFiAds2bBeGH3A6v6lnuj7zmQ1BxzeVe1YXIvJeWT9W5EOYW8lYwZ-lu61wDHl"
fi

# Create the spektr_config.json file in /usr/local/bin/spektr
echo "{\"machine_name\": \"$this_machine\", \"IP Address\": \"$(ip a s | awk '{print $7}').split(\"/")[1].split(\":\")[1]\",\"Discord Webhook\": \"$discord_webhook\"}" > /usr/local/bin/spektr/spektr_config.json

# Give the file read permission to everyone
chmod 755 /usr/local/bin/spektr/spektr_config.json
