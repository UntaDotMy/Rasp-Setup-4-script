#!/bin/bash

# Function to print the progress
print_progress() {
    local progress=$1
    local total=$2
    local percentage=$((100*progress/total))
    printf 'Progress: [%-50s] %d%%\r' $(eval "printf '#%.0s' {1..$percentage}") $percentage
}

# Check if the script is run as root
if [ "${EUID}" -ne 0 ]; then
  echo "You need to run this script as root"
  exit 1
fi

# Clear the terminal
clear

# Print the banner
cat << "EOF"
[1;33m
  ___                                             _                      _   _
 / (_)   |                                       | |                    | | | |
 \__   __|          ,_    __   __,   _  _  _     | |  __   ,_      __,  | | | |
 /    /  |  |   |  /  |  /  \_/  |  / |/ |/ |    |/  /  \_/  |    /  |  |/  |/
 \___/\_/|_/ \_/|_/   |_/\__/ \_/|_/  |  |  |_/  |__/\__/    |_/  \_/|_/|__/
                                                  |\                             
                                                  |/
EOF

echo "This code is provided by Unta"
echo "Note: We don't capture any of your provided information. This script is meant to enable auto connection to your eduroam WiFi access (if available)."
echo "Please make sure you put your user/password according to your University; otherwise, it will not be connected."

sleep 2

# Get user input
read -rp "Your Country Code (e.g., MY): " -e country
read -rp "University Domain and subdomain (staff or student) (e.g., student.uni.edu.ea): " -e uni_do
read -rp "Your Id (e.g., IA87392): " -e u_id
read -sp "Password: " -e u_p

# Confirm user input
echo -e "\n\nPlease verify the details:"
echo "Country: $country"
echo "Identity: $u_id@$uni_do"
echo "Password: ********"

while true; do
    read -p "Are the details correct? [Y/n]: " yn
    case $yn in
        [Yy]* )
            echo "Preparing to save your information..."
            sleep 2
            clear
            echo "Saving your information..."
            print_progress 0 100
            echo -e 'auto lo\niface lo inet loopback\n\niface eth0 inet manual\n\nallow-hotplug wlan0\niface wlan0 inet manual\nwpa-conf /etc/wpa_supplicant/wpa_supplicant.conf\niface default inet dhcp' >> /etc/network/interfaces
            sleep 2
            print_progress 50 100
            echo -e "country=$country\n\nnetwork={\n\tssid=\"eduroam\"\n\teap=PEAP\n\tkey_mgmt=WPA-EAP\n\tphase2=\"auth=MSCHAPV2\"\n\tidentity=\"$u_id@$uni_do\"\n\tpassword=\"$u_p\"\n}\n" >> /etc/wpa_supplicant/wpa_supplicant.conf
            sleep 2
            print_progress 100 100
            echo -e "\n\nConfiguration completed successfully!"
            echo "Please reboot your Raspberry Pi using 'sudo reboot'."
            sleep 2
            exit;;
        [Nn]* ) 
            echo "Please run this script again to configure."
            exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
