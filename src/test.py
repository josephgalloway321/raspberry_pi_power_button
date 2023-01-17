#!/usr/bin/env python

import RPi.GPIO as GPIO
import sys

red_pin = 12
green_pin = 13
blue_pin = 19

GPIO.setmode(GPIO.BCM)
GPIO.setup(red_pin, GPIO.OUT)
GPIO.setup(green_pin, GPIO.OUT)
GPIO.setup(blue_pin, GPIO.OUT)

print(sys.argv[1])