#!/usr/bin/env python

# This program will be called by the power_button_services
# The first argument will be a command (Shutting down, starting up)

import RPi.GPIO as GPIO
import sys

red_pin = 12
green_pin = 13
blue_pin = 19

GPIO.setmode(GPIO.BCM)
GPIO.setup(red_pin, GPIO.OUT)
GPIO.setup(green_pin, GPIO.OUT)
GPIO.setup(blue_pin, GPIO.OUT)


try: 
    while True:
        GPIO.output(red_pin, GPIO.LOW)
        GPIO.output(green_pin, GPIO.HIGH)
        GPIO.output(blue_pin, GPIO.HIGH)

finally:
    GPIO.cleanup()

"""
try:
    if (sys.argv[1] == 'red'):
        while True:
            GPIO.output(red_pin, GPIO.LOW)
            GPIO.output(green_pin, GPIO.HIGH)
            GPIO.output(blue_pin, GPIO.HIGH)
    elif(sys.argv[1] == 'green'):
        while True:
            GPIO.output(red_pin, GPIO.HIGH)
            GPIO.output(green_pin, GPIO.LOW)
            GPIO.output(blue_pin, GPIO.HIGH)
    elif(sys.argv[1] == 'blue'):
        while True:
            GPIO.output(red_pin, GPIO.HIGH)
            GPIO.output(green_pin, GPIO.HIGH)
            GPIO.output(blue_pin, GPIO.LOW)
    else:
        print("Invalid argument")

"""
