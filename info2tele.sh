#!/bin/bash

# Function to check internet connection
function check_internet() {
    wget -q --spider http://google.com

    if [ $? -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

# Your bot token and chat ID
BOT_TOKEN="BOT_ID"
CHAT_ID="CHAT_ID"

# Wait for internet connection
while ! check_internet
do
    echo "No internet connection on wlan0"
    sleep 10
done

# Get the IPv4 information
IPV4_INFO=$(ip -4 addr show wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Get the SSID
SSID=$(iwgetid -r)

# Create the message
MESSAGE="IPv4 Info: $IPV4_INFO, SSID: $SSID"

# Send the message to the Telegram bot
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE"
