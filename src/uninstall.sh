#!/bin/bash

# Do not remove Python3 nor GPIO Zero

if [ -d "/boot/firmware" ]; then
    # For Ubuntu 22.04 LTS uninstallation
    # Delete the current config.txt (Modified during installation)
    sudo rm /boot/firmware/config.txt
    # Rename config_backup.txt to config.txt
    sudo mv /boot/firmware/config_backup.txt /boot/firmware/config.txt
else
    # For Raspberry Pi OS uninstallation
    # Delete the current config.txt (Modified during installation)
    sudo rm /boot/config.txt
    # Rename config_backup.txt to config.txt
    sudo mv /boot/config_backup.txt /boot/firmware/config.txt
fi

# Prevent service from starting on reboot
sudo systemctl disable power_button.service

# Stop service manually
sudo systemctl stop power_button.service

# Remove service file
sudo rm /etc/systemd/system/power_button.service

# Remove python script
sudo rm /usr/local/bin/power_button.py

# Run short script to clean GPIO pins used in this project then remove file
sudo python3 /usr/local/bin/gpio_cleanup.py
sudo rm /usr/local/bin/gpio_cleanup.py

echo "Uninstallation complete."