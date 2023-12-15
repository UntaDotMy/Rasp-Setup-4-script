<div align='center'>

<h1>Various tools for raspberry Pi setup.</h1>
<p>Usefull script to connect eduroam network using raspberry pi for IOT , remote control and etc ..</p>

<h4> <span> · </span> <a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/blob/master/README.md"> Documentation </a> <span> · </span> <a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/issues"> Report Bug </a> <span> · </span> <a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/issues"> Request Feature </a> </h4>


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
https://raw.githubusercontent.com/UntaDotMy/Rasp-Setup-4-script/main/eduroam.sh && chmod +x eduroam.sh && ./eduroam.sh
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


## :wave: Contributing

<a href="https://github.com/UntaDotMy/Rasp-Setup-4-script/graphs/contributors"> <img src="https://contrib.rocks/image?repo=Louis3797/awesome-readme-template" /> </a>

Contributions are always welcome!

see `contributing.md` for ways to get started

## :grey_question: FAQ

- Why it said Wi-Fi is currently blocked by rfkill , after i reboot ?
- You need to configure your wlan country code before you can use WiFi . Follow second step above .


## :warning: License

Distributed under the no License. See LICENSE.txt for more information.
