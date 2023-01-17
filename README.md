# Raspberry Pi Power Button

## Overview
The purpose of this project is to add a power button to the Raspberry Pi to allow the user to turn it on and off. This functionality is important for mobile robotics that use the Raspberry Pi because it will help conserve battery. Although there are several tutorials for this project online, I couldn't find any that used an LED to give feedback to the user. This is important in robotics when the user isn't clear on whether the robot is on/off/ready to use/etc. This project provides the state of the power to the user. Also, I couldn't find detailed explanation in the tutorial code, so I wrote comments in mine to explain what each line means.

In addition to adding a power button to my Raspberry Pi, this project also helped teach me about some basic bash scripting and running scripts on startup.  

The goal of this document is to provide a convenient page for anyone who wants to recreate this project.


## Step-by-step to recreate
1) Write the Python script and save it in the /usr/local/bin/ folder
2) Change the script to an executable
3) Write the shell script and save it in the /etc/init.d/ folder
4) Change the script to an executable
5) Register the script to run on boot
6) Either restart the Raspberry Pi how you did it before (not using the button; click on shutdown if using desktop or shutdown command if using command line) or start the bash script


## Results
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
- [Run a Program On Your Raspberry Pi At Startup](https://www.dexterindustries.com/howto/run-a-program-on-your-raspberry-pi-at-startup/#:~:text=d%20directory,shutdown%20or%20reboot%20the%20system).)
- [How to Run a Bash Script on Startup!!](https://www.youtube.com/watch?v=jcE8U1lG514)
- [Python Tutorial: Calling External Commands Using the Subprocess Module](https://youtu.be/2Fp1N6dof0Y)
- [Python (RPi.GPIO) API](https://learn.sparkfun.com/tutorials/raspberry-gpio/python-rpigpio-api)