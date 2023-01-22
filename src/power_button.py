#!/usr/bin/env python

from gpiozero import RGBLED, Button
from subprocess import run
from time import time

button = Button(3, pull_up=True, bounce_time=0.5)
led = RGBLED(4, 5, 6)
    
def main():
    # Turn on green to show the button is ready to be pushed
    led.color = (1, 0, 1)
    
    # When the button is pressed, time how long it's held down
    button.wait_for_press()
    start_time = time()
    button.wait_for_release()
    end_time = time()
    time_held = end_time - start_time
    #print(str(time_held))
    
    # If button held down for more than two seconds, then
    # restart Raspberry Pi
    # Otherwise, shutdown Raspberry PI
    if time_held > 1:
        led.color = (0, 0, 1)    # Yellow
        print("Restarting...")
        run(['reboot'])

    else:
        led.color = (0, 1, 1)    # Red
        print("Shutting Down...")
        run(['shutdown', '-h', 'now'])

if __name__ == '__main__':
    main()