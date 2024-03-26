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

# Function to send message to Telegram bot
function send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$message"
}

# Wait for internet connection
while ! check_internet; do
    echo "No internet connection on wlan0"
    sleep 10
done

# Delay for ensuring the connection is stable
sleep 5 

# Get the IPv4 information
IPV4_INFO=$(ip -4 addr show wlan0 | awk '/inet / {print $2}')

# Get the SSID
SSID=$(iwgetid -r)

# Create the message
MESSAGE="IPv4 Info: $IPV4_INFO\nSSID: $SSID"

# Send the message to the Telegram bot
send_telegram_message "$MESSAGE"
