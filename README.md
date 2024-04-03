<div align='center'>

<h1>Various tools for raspberry Pi setup.</h1>
<p>Usefull script to connect eduroam network using raspberry pi for IOT , remote control and etc ..</p>
<p>Tested and verified using raspberrypi os Buster and below , please dont use > buster .</p>
<p>Upcoming update , restore file to original in case something going wrong.</p>

<h4> <span> · </span> <a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/blob/master/README.md"> Documentation </a> <span> · </span> <a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/blob/main/rc-local-setup.md"> How to enable rc.local </a> <span> . </span> <a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/issues"> Report Bug </a> <span> · </span> <a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/issues"> Request Feature </a> </h4>


</div>

# :notebook_with_decorative_cover: Table of Contents

- [About the Project](#star2-about-the-project)
- [Contributing](#wave-contributing)
- [FAQ](#grey_question-faq)
- [License](#warning-license)


## :star2: About the Project

### :dart: Features
- Connect eduroam using just a script
- Easily get ip address from connected eduroam wifi when raspberry pi boot up and send it to telegram bot


## :toolbox: Getting Started

### :gear: Installation

To use eduroam.sh , Assume you already in root env. If not , use below code to get root :
```bash
sudo -i
```
after that use raspi-config **type in your raspberry pi terminal** to change your wifi country , Localization -> wlan country:
```bash
raspi-config
```
To connect to eduroam , if you have internet connection , use this command :
```bash
wget https://raw.githubusercontent.com/UntaDotMy/Rasp-Setup-4-script/main/eduroam.sh && chmod +x eduroam.sh && ./eduroam.sh
```
if you dont have internet connection in your raspberry pi , make a new file , then copy the code inside eduroam.sh and save it in <anything>.sh
```bash
nano <yourfilename>.sh
```
make sure to validate your information otherwise the wifi will be not connected .
Lastly , reboot your raspberrypi , and your raspberry pi will be automatically connected to eduroam network . Good Luck !
```bash
sudo reboot
```

## ℹ️ : To get your ipv4 information from connected eduroam to telegram bot.

First , go to <a href="https://telegram.me/BotFather"> BotFather </a> and make your own bot . give unique name so u can remember . grab the token , we need it later in configuration.

Second , go to this website copy and paste your token in the url, replace <token> according to your bot token.
```bash
http://api.telegram.org/bot<token>/getupdates
```
Third , start your bot in telegram , and just chat anything to your bot. and refresh the website, you will get the chat id (id from message).

Fourth , grab your token and chat id , copy it into notepad.

Fifth , download the file using wget in your teminal (Copy Paste)
```bash
wget https://raw.githubusercontent.com/UntaDotMy/Rasp-Setup-4-script/main/info2tele.sh && chmod +x info2tele.sh
```
Sixth , open up info2tele.sh using nano (text editor) and put your token and chat id in it.
```bash
nano info2tele.sh
```

Lastly , we need in to run at boot , so it will send the ipv4 information to your telegram bot.

first , open up rc.local .
```bash
nano /etc/rc.local
```
second , put below code before the exit 0.
```bash
/root/info2tele.sh
```
save the file with ctrl+x and then y and enter. and reboot .
```bash
sudo reboot 
```

you should get the network ipv4 information send to your telegram when the raspberry pi connected to the eduroam . 

Have fun do your project !


## :wave: Contributing

<a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/graphs/contributors"> <img src="https://contrib.rocks/image?repo=Louis3797/awesome-readme-template" /> </a>

Contributions are always welcome!


## :grey_question: FAQ

- Why it said Wi-Fi is currently blocked by rfkill , after i reboot ?
```bash
- You need to configure your wlan country code before you can use WiFi . Follow second step above .
```
- After reboot , i dont get the chat from my telegram bot , do i did wrong ?
```bash
- try enable the rc local service , see above for How to enable rc.local .
```
- My clock not syncronize , i have internet , how to syncronize ?
```bash
- sudo apt install htpdate
```

## :warning: License

Distributed under the no License. See LICENSE.txt for more information.
