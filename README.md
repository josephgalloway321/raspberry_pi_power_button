# Raspberry Pi Power Button

## Overview
The main goal of this project is to have an easy way to safely power on and power off the raspberry pi with a physical button. The button used in this project has an RGB LED to show the current state of the Raspberry Pi to the user. This project has only been tested using **Ubuntu Server 24.04 LTS (64-bit)** and the hardware specified in the [hardware](#hardware) section.

<!-- Include gif here -->

___
## Table of Contents
- [Hardware](#hardware)
- [Circuit](#circuit)
- [Install & Uninstall](#install--uninstall)
- [Final Thoughts](#final-thoughts)
- [Acknowledgments](#acknowledgments)
- [Resources](#resources)

___
## Hardware
The following material was used to complete the project:
| Item | Price |
| ---- | ----  |
| [Raspberry Pi 3 B+]() | $ |
| [16GB Micro SD Card]() | $ |
| [USB Micro & Brick]() | $ |
| [Dupont Wires]() | $ |
| [330 Ohm Resistors]() | $ |
| [Spade Connectors]() | $ |
| [LED Power Button]() | $ |
| []() | $ |

___
## Circuit
Notes: 
- The LED in the power button is a common anode RGB. This means that the three LEDs share a positive connection. 
- 


___
## Install & Uninstall
*Note: The first step assumes that the user has already installed Ubuntu 22.04 LTS (64-bit) on their Raspberry Pi micro SD card. I recommend using the [Raspberry Pi Imager](https://www.raspberrypi.com/software/).    
Also, please complete the circuit above before beginning this section.*

1. First, please update your operating system using the following commands:   
```bash
sudo apt update && sudo apt upgrade
```

*Note: This can take some time depending on how updated your operating system is currently. Consider rebooting after this command is finished.*

2. In order to install the installation file, please install curl using the following command:
```bash
sudo apt-get install curl
```

3. The program uses Python 3 and the GPIO Zero module
Please run the next two commands to install both of them:   
```bash
sudo apt-get install python3   
sudo apt-get install python3-gpiozero   
```

4. To install the program, please run the installation file:   
```bash
curl https://raw.githubusercontent.com/josephgalloway321/raspberry_pi_power_button/main/src/install.sh | bash
```

*Note: If everything installed correctly, the shell will print "Installation complete. Please restart your device." The LED will also turn green.*

5. Please restart your device using the following command:
```bash
reboot
```

Once the operating system completes restarting, the system should be ready to use. 

___
Run the following command to see if the service is actively running:
```bash
systemctl status power_button.service
```

To Uninstall, please run the uninstallation file:    
```bash
curl https://raw.githubusercontent.com/josephgalloway321/raspberry_pi_power_button/main/src/uninstall.sh | bash
```

___
## Final Thoughts
I learned so much completing this project. In addition to adding a convenient power button to my Raspberry Pi, I learned about bash scripting, systemd, and mechatronics. I intend on using this project in combination with my future robotics projects. I also plan on updating the project to work on different operating systems, different hardware, and a YouTube video walking viewers through recreating the project themselves. 

Please let me know if this project helped in any way! I'd really appreciate any feedback or how someone improved upon this design. I would also really appreciate credit if this project helped.  

___
## Acknowledgments
The credit for all of the information in this project goes to the people who made the content in the resources section below. They were all excellent resources and guides for this project. I'm very grateful and could not have done it without their help.

___
## Resources
- 

[Top of the page](#raspberry-pi-power-button)