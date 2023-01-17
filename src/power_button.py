#!/usr/bin/env python

import RPi.GPIO as GPIO
import subprocess


button_pin = 3

GPIO.setmode(GPIO.BCM)
GPIO.setup(button_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.wait_for_edge(button_pin, GPIO.FALLING)

subprocess.run(['shutdown', '-h', 'now'])