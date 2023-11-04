#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
  echo "You need to run this script as root"
  exit 1
fi
clear
echo -e "\e[0;33m " 
echo -e  "  ___                                             _                      _   _"  
echo -e  " / (_)   |                                       | |                    | | | |" 
echo -e  " \__   __|          ,_    __   __,   _  _  _     | |  __   ,_      __,  | | | |" 
echo -e  " /    /  |  |   |  /  |  /  \_/  |  / |/ |/ |    |/  /  \_/  |    /  |  |/  |/"  
echo -e  " \___/\_/|_/ \_/|_/   |_/\__/ \_/|_/  |  |  |_/  |__/\__/    |_/  \_/|_/|__/|__/"
echo -e  "                                                  |\                             "
echo -e  "                                                  |/                             "

echo "This code is provided by Unta"
echo "! please take note , we dont capture anything you provided here , this code is mean to enable auto connection to your eduroam wifi access ( if available )"
echo "Please make sure you put your user/password according to your University otherwise it will not connected"

sleep 2

echo " Please enter you country code, eg: MY "

read -rp "Your Country Code : " -e country

echo " please enter your University domain with student/staff sub-domain. Eg : student.uni.edu.ea "

read -rp "University Domain and subdomain (staff or student): " -e uni_do

echo " please enter your id , eg : IA87392"

read -rp "Your Id: " -e u_id

echo " please enter your password "

read -sp "Password: " -e u_p

echo "Please make sure the detail is correct"

echo "Country : $country"
echo "Identity : $u_id@$uni_do"
echo "Password : $u_p"

while true; do
    read -p "Detail is correct? [Y/n]: " yn
    case $yn in
        [Yy]* )
			echo "ready.."
			sleep 1
			clear
			echo "starting to save your information"
			echo -ne '                          [ 0%]\r'
			echo -e 'allow-hotplug wlan0\niface wlan0 inet manual\nwpa-conf /etc/wpa_supplicant/wpa_supplicant.conf\niface wlan0 inet dhcp' >> /etc/network/interfaces
			sleep 1
			echo -ne '***                       [ 10%]\r'
			sleep 1
			echo -e 'country=$country\n\nnetwork={\n\tssid="eduroam"\n\teap=PEAP\n\tkey_mgmt=WPA=EAP\n\tphase2="auth=MSCHAPV2"\n\tidentity="$u_id@$uni_do"\n\tpassword="$u_p"\n}\n' >> /etc/wpa_supplicant/wpa_supplicant.conf
			echo -ne '*************             [ 50%]\r'
			sleep 1
			echo -ne '**************************[100%]\r'
			sleep 1
			clear
			echo "done, please reboot your raspberrypi with sudo reboot"
			sleep 2
		exit;;
        [Nn]* ) echo "Please run this script again to configure"; 
		exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
