#! /usr/bin/env python

# This module provides access to the RPi's general 
# purpose input/output pins
import RPi.GPIO as GPIO
# This module allows this script to run an external command
import subprocess


# Define the pins that will be used
button_pin = 3
red_pin = 12
green_pin = 13
blue_pin = 19


# To use the GPIO pins, specify which pin-numbering schemes you want
# Options are BCM or BOARD
GPIO.setmode(GPIO.BCM)

# The first two arguments define pin number 3 as an input pin
# The third argument uses an internal pull up resistor on pin 3 
GPIO.setup(button_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)

# Instead of using a while loop for detecting if the button has been
# pressed, the wait_for_edge function attaches an interrupt to the button pin 
# The signal read by the button pin is high when the button is NOT pressed
# When the button is pressed, the signal will change to low
# FALLING refers to the signal changing from the high to low
# This part of the code blocks the rest from being executed until the
# is triggered
GPIO.wait_for_edge(button_pin, GPIO.FALLING)


# To shutdown the Raspberry Pi, the following command is used in the
# command line: shutdown -h now
# To run this command in the script, use the run() function from the
# subprocess module
subprocess.run(['shutdown', '-h', 'now'])

# The shutdown command is broken into a list of arguments because
# the shell is False by default (shell=False)