#! /bin/bash

# The commented section below is necessary to make this script
# a Linux Standard Base (LSB) script, which is a standard for software system structure

# /etc/init.d/power_button.py
### BEGIN INIT INFO
# Provides:          power_button.py
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
### END INIT INFO


# Below are the case statements for our program
# The body of the case that matches will be executed
# The $1 means the first argument sent to the script
case "$1" in

    # When the Pi starts up, this case statement block will execute
    # Another way to execute this block is with the following command:
    # sudo /etc/init.d/power_button.sh start
    start)
        # Print to the command line that the program is starting
        echo "Starting power_button.py"

        # Execute the file at this location
        # Because our file runs indefinitely until the interrupt happens,
        # an ampersand is necessary at the end of the command
        # The ampersand (&) tells the Pi to continue running the power_button program
        # as a separate process (in the background) so it can continue 
        # running the other startup processes
        /usr/local/bin/power_button.py &

        # The double semicolons (;;) represent the end of the body of the case
        ;;

    # This section will only execute if the following command is executed by the user 
    # or another script:
    # sudo /etc/init.d/power_button.sh stop   
    stop)
        echo "Stopping power_button.py"
        # pkill will kill the process 
        pkill -f /usr/local/bin/power_button.py
        ;;

    # The asterisk (*) case is the default case
    # This is used in case something goes wrong and the above cases are not met
    *)
        # Print the location of the file for debugging to the command line
        echo "Usage: /etc/init.d/power_button.sh {start|stop}"
        # Show a general error code
        exit 1
        ;;

# The end of the case statement section
esac


# This exit code just means the command completed successfully
exit 0