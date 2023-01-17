#! /usr/bin/env python

# This module provides access to the RPi's general 
# purpose input/output pins
import RPi.GPIO as GPIO
# This module allows this script to run an external command
import subprocess


# To use the GPIO pins, specify which pin-numbering schemes you want
# Options are BCM or BOARD
GPIO.setmode(GPIO.BCM)
# Define pin number 3 as 
GPIO.setup(3, GPIO.IN, pull_up_down=GPIO.PUD_UP)

# To shutdown the Raspberry Pi, the following command is 
# needed: shutdown -h now
# To run this command in the script, use the run() function from the
# subprocess module
subprocess.run(['shutdown', '-h', 'now'])

# The shutdown command is broken into a list of arguments because
# the shell is False by default (shell=False)