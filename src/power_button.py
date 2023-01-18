#!/usr/bin/env python

import RPi.GPIO as GPIO
import subprocess

button_pin = 3
red_pin = 4
green_pin = 5
blue_pin = 6

GPIO.setmode(GPIO.BCM)
GPIO.setup(button_pin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(red_pin, GPIO.OUT)
GPIO.setup(green_pin, GPIO.OUT)
GPIO.setup(blue_pin, GPIO.OUT)

def redOn():
    GPIO.output(red_pin, GPIO.LOW)
    GPIO.output(green_pin, GPIO.HIGH)
    GPIO.output(blue_pin, GPIO.HIGH)

def greenOn():
    GPIO.output(red_pin, GPIO.HIGH)
    GPIO.output(green_pin, GPIO.LOW)
    GPIO.output(blue_pin, GPIO.HIGH)

def blueOn():
    GPIO.output(red_pin, GPIO.HIGH)
    GPIO.output(green_pin, GPIO.HIGH)
    GPIO.output(blue_pin, GPIO.LOW)

def shutdown():
    redOn()
    subprocess.run(['shutdown', '-h', 'now'])

def main():
    GPIO.wait_for_edge(button_pin, GPIO.FALLING)
    #TODO: Call shutdown process as callback when event happens
    #TODO: Look into emailed link about debounce button 

if __name__ == '__main__':
    main()