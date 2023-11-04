
# Setup for Raspberrypi4 - personal use
### if u want to use , just use , you free to copy and modified my work , but please star the repo to do so.



## Deployment

Assume you already in root env. If not , use below code to get root :
```
sudo -i
```
after that use raspi-config to change your wifi country , Localization -> wlan country:
```
raspi-config
```

To connect to eduroam , please makesure u have an internet connection first or just ssh to your rpi and do a new file :
```
nano <newfile>.sh
```
and then copy and paste raw code from below link :
```
https://raw.githubusercontent.com/UntaDotMy/Rasp-Setup-4-script/main/eduroam.sh
```
after that chmod +x <newfile>.sh
```
chmod +x <newfile>.sh
```
then run the code
```
./newfile.sh
```
make sure to validate your information otherwise the wifi will be not connected .






#### below code to get you ipv4 information to telegram , for easy access ( SSH )

download the code below

```
wget https://raw.githubusercontent.com/UntaDotMy/Rasp-Setup-4-script/main/info2tele.sh && chmod +x info2tele.sh
```

after download please edit according to your telegram bot configuration.

```
nano info2tele.sh
```
save the file with ctrl+x and then y and enter.

and the open your rc.local to make it run after reboot.

```
nano /etc/rc.local
```

put this code before exit 0

```
/root/info2tele.sh
```







#### To update your rpi date **sync , install package bellow
```
apt install htpdate
```
then reboot

```
sudo reboot
```

4/11/2023
