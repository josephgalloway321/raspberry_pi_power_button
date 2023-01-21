#!/bin/bash

# Make changes to the config.txt file so the red light turns on during startup
# First, create a backup for config.txt and name it config_backup.txt
sudo cp /boot/firmware/config.txt /boot/firmware/config_backup.txt

# Append to the config.txt to make red pin output low during startup
echo "gpio=4=op,dl" | sudo tee --append /boot/firmware/config.txt
echo " was appended to the /boot/firmware/config.txt file"


# Make sure the required libraries are installed
# Check if Python3 is installed


# Check if python3-gpiozero is installed



# Install Python and service scripts then place them in the correct folders
# If there is no /usr/local/bin/ then create the directory
if [ ! -d "/usr/local/bin" ]; then
    sudo mkdir -p /usr/local/bin
fi

# Make the Python script executable then move to /usr/local/bin/
sudo chmod +x power_button.py
sudo mv power_button.py /usr/local/bin

# Move service script to systemd folder
sudo mv power_button.service /etc/systemd/system

# Start service and enable so it starts on reboot 
sudo systemctl start power_button.service
sudo systemctl enable power_button.service

echo "Installation complete. Please restart."