#!/bin/bash

# Update everything
sudo apt update && sudo apt upgrade

# Ubuntu Server 22.04 LTS has the config.txt file in /boot/firmware
# Raspberry Pi OS has the config.txt file in /boot
# So... check if there's a firmware folder or not first

if [ -d "/boot/firmware" ]; then
    # For Ubuntu 22.04 LTS installation
    # Make changes to the config.txt file so the red light turns on during startup
    # First, create a backup for config.txt and name it config_backup.txt
    sudo cp /boot/firmware/config.txt /boot/firmware/config_backup.txt

    # Append to the config.txt to make red pin output low during startup
    echo "gpio=4=op,dl" | sudo tee --append /boot/firmware/config.txt
else 
    # For Raspberry Pi OS installation
    # Make changes to the config.txt file so the red light turns on during startup
    # First, create a backup for config.txt and name it config_backup.txt
    sudo cp /boot/config.txt /boot/config_backup.txt
    
    # Append to the config.txt to make red pin output low during startup
    echo "gpio=4=op,dl" | sudo tee --append /boot/config.txt
fi


# Make sure the required libraries are installed
# Check if Python3 is installed
if [ $(command -v python3) ]; then
    echo "Python3 is already installed."
else
    echo "Python 3 is not installed. Installing now..."
    sudo apt-get install python3
fi

# Check if python3-gpiozero is installed
PACKAGE_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' "python3-gpiozero")
if [ "$PACKAGE_INSTALLED" == "install ok installed" ]; then
    echo "GPIO Zero is already installed."
else
    echo "GPIO Zero is not installed. Installing now..."
    sudo apt-get install python3-gpiozero
fi

# Install Python and service scripts then place them in the correct folders
# If there is no /usr/local/bin/ then create the directory
if [ ! -d "/usr/local/bin" ]; then
    sudo mkdir -p /usr/local/bin
fi

# Download then make the Python script executable
# Then move to /usr/local/bin/
curl -O https://raw.githubusercontent.com/josephgalloway321/raspberry_pi_power_button/main/src/power_button.py
sudo chmod +x power_button.py
sudo mv power_button.py /usr/local/bin

# Download the GPIO cleanup script (Used if user will uninstall in the future)
# Then move to /usr/local/bin/
curl -O https://raw.githubusercontent.com/josephgalloway321/raspberry_pi_power_button/main/src/gpio_cleanup.py
sudo chmod +x gpio_cleanup.py
sudo mv gpio_cleanup.py /usr/local/bin

# Download then move service script to systemd folder
curl -O https://raw.githubusercontent.com/josephgalloway321/raspberry_pi_power_button/main/src/power_button.service
sudo mv power_button.service /etc/systemd/system

# Start service and enable so it starts on reboot 
sudo systemctl start power_button.service
sudo systemctl enable power_button.service

echo "Installation complete. Please restart your device."