#!/usr/bin/env python

from gpiozero import RGBLED, Button

button = Button(3, pull_up=True, bounce_time=0.5)
led = RGBLED(4, 5, 6)

button.close()
led.close()