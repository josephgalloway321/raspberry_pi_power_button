# Raspberry Pi Power Button

## Overview
The purpose of this project is to add a power button to the Raspberry Pi to allow the user to turn it on and off. This functionality is important for mobile robotics that use the Raspberry Pi because it will help conserve battery. Although there are several tutorials for this project online, I couldn't find any that used an LED to give feedback to the user. This is important in robotics when the user isn't clear on whether the robot is on/off/ready to use/etc. This project provides the state of the power to the user. Also, I couldn't find detailed explanation in the tutorial code, so I wrote comments in mine to explain what each line means.

In addition to adding a power button to my Raspberry Pi, this project also helped teach me about some basic bash scripting and running scripts on startup.  

The goal of this document is to provide a convenient page for anyone who wants to recreate this project.


## Hardware details
- Raspberry Pi 3 B+ V1.2 (64-bit)
- 

## Step-by-step to recreate
<!-- Redo the format of this section-->
1) Write the Python script and save it in the /usr/local/bin/ folder
    - This directory is typically used for third-party executables. 
2) Change the script to an executable
    - Making a file exectuable means the contents of the file are sent to the program at the top of the file
    - Since the top of the file is the shebang (#! /usr/bin/env python), they're executed using the Python interpreter
3) Write the shell script and save it in the /etc/init.d/ folder
    - In this directory, all the scripts are executed during startup, reboot, and shutdown.
4) Change the script to an executable
    - Making a file exectuable means the contents of the file are sent to the program at the top of the file
    - Since the top of the file is the shebang (#! /bin/bash), they're executed using the bash shell
5) Register the script to run on boot using the following command
    - sudo update-rc.d power_button.py defaults
6) Restart the Raspberry Pi by entering this command into the command line:
    - sudo reboot

<!-- Explain the concepts from the code here so the comments in the code will be significantly less-->


## Results

When the Raspberry Pi starts up, it will run the power_button.sh script with the start argument. Inside the power_button.sh script, the power_button.py program will begin and continue running until the interrupt is triggered (button is pushed). 

When the button is pushed after the Raspberry Pi has started completely, the interrupt from the power_button.py will be triggered and begin the shutdown process.




In this project, there are simply two states of the Raspberry Pi: on and sleep. 
<!-- Change this to a table-->
When the Raspberry Pi is in sleep mode, the button will be a solid red.
When the Raspberry Pi is transitioning to sleep mode, the button will slowly blink red.
When the Raspberry Pi is on, the button will be a solid green.
When the Raspberry Pi is transitioning to on mode, the button will slowly blink green.


## Acknowledgments
The credit for all of the information in this project goes to the people who made the content in the references section below. They were all excellent resources and guides for this project. I'm very grateful and could not have done it without their help. 


## References
- [How to Add a Power Button to Your Raspberry Pi](https://howchoo.com/g/mwnlytk3zmm/how-to-add-a-power-button-to-your-raspberry-pi?utm_source=youtube&utm_medium=referral&utm_campaign=power-button-video&utm_content=description)
- [Run a Program On Your Raspberry Pi At Startup](https://www.dexterindustries.com/howto/run-a-program-on-your-raspberry-pi-at-startup/#:~:text=d%20directory,shutdown%20or%20reboot%20the%20system)
- [How to Run a Bash Script on Startup!!](https://www.youtube.com/watch?v=jcE8U1lG514)
- [Python Tutorial: Calling External Commands Using the Subprocess Module](https://youtu.be/2Fp1N6dof0Y)
- [Python (RPi.GPIO) API](https://learn.sparkfun.com/tutorials/raspberry-gpio/python-rpigpio-api)
- [Python Subprocess Documentation](https://docs.python.org/3/library/subprocess.html#subprocess.call)
- [Python Wait For Edge Function Documentation](https://sourceforge.net/p/raspberry-gpio-python/wiki/Inputs/)
- [Demystifying Linux: The purpose of /bin, /usr/bin and /usr/local/bin](https://dev.to/kcdchennai/demystifying-linux-the-purpose-of-bin-usrbin-and-usrlocalbin-5a8e#:~:text=What%20about%20%2Fusr%2Flocal%2F,the%20binaries%20for%20root%20users.)
- [How to make a file executable in linux?](https://medium.com/@peey/how-to-make-a-file-executable-in-linux-99f2070306b5#:~:text=What%20exactly%20happens%20when%20we,those%20commands%20into%20the%20shell.)
- [Shebang (Unix) Wiki](https://en.wikipedia.org/wiki/Shebang_(Unix))
- [Bash Scripting – Case Statement](https://www.geeksforgeeks.org/bash-scripting-case-statement/)
- [How to pass and use arguments in shell script](https://www.educative.io/answers/how-to-pass-and-use-arguments-in-shell-script)
- [Running Programs Automatically on Your Tiny Computer](https://learn.adafruit.com/running-programs-automatically-on-your-tiny-computer)
- [How to Make a Raspberry Pi Program Start on Boot (systemd)](https://www.youtube.com/watch?v=DUGZC-tNm2w)
- [Install RPi.GPIO Python Library](https://www.raspberrypi-spy.co.uk/2012/05/install-rpi-gpio-python-library/)
- [How to Set Static IP in Ubuntu Server 22.04](https://www.youtube.com/watch?v=fayx4jWqyWk)
- [Using Common Cathode and Common Anode RGB LED with Arduino](https://www.hackster.io/techmirtz/using-common-cathode-and-common-anode-rgb-led-with-arduino-7f3aa9)
- [Current Sourcing and Sinking](https://startingelectronics.org/articles/current-sourcing-sinking/)
- [New "gpio" config command](https://forums.raspberrypi.com/viewtopic.php?f=117&t=208748)
- []()