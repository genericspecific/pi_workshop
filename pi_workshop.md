# Getting Started with Raspberry Pi v0.1

---

# What is it?

- small computer that can run linux
- **many** distros available. we will use vanilla Rasbian Lite (No gui)
- other OSes available: RISC OS, Windows IoT
- lots of interfaces

---

# Whats it for?

- education and research
- some commercial projects e.g. Pro-ject stream box
- ❌ IoT device (depends on usage)
- ✅ edge device (depends on usage)

---

# Lets Go

---

# Tasks part 1

- ✅ flash SD card
- set up wifi
- enable ssh
- change hostname

---

# Tasks part 2

- change default password
- setup key based auth
- wire up blinky circuit
- program blinky
- run blinky.py on boot
- deploy script
- profit

---

# Flash SD card

- https://www.raspberrypi.org/downloads/raspbian/
- hopefully you did this already
- any questions?

---

# Set up WiFi

- insert card into computer

```
    touch /Volumes/boot/wpa_supplicant.conf
```
- open in yr favourite text editor
- paste contents of code from dino

---

# Enable ssh

```
    touch /Volumes/boot/ssh
```
- eject card from computer

---

# Change hostname 1

- do this one at a time because zeroconf
- insert card into pi
- power it up
- join wifi with your mac
- `ssh pi@raspberrypi.local`
- password: **raspberry**

---

# Change hostname 2
- `sudo nano /etc/hostname`
- change the hostname to something unique
- reboot: `sudo reboot now`

---

# Change default password
- `passwd`

---

# Set up key based auth

- open a shell on your mac
- `ssh-copy-id -i ~/.ssh/mykey user@host`
- https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md

---

# Wire up blinky circuit
![inline](pi_setup.jpg)

---

# Install .py GPIO libs

- `sudo apt-get install python-rpi.gpio python3-rpi.gpio`
- other software?

---

# Program blinky.py 1

- create and open `~/blinky.py`
- type or copy paste code

```python
import RPi.GPIO as GPIO # Import Raspberry Pi GPIO library
from time import sleep # Import the sleep function from the time module

GPIO.setwarnings(False) # Ignore warning for now
GPIO.setmode(GPIO.BOARD) # Use physical pin numbering
GPIO.setup(8, GPIO.OUT, initial=GPIO.LOW) # Set pin 8 to be an output pin and set initial value to low (off)

while True: # Run forever
    GPIO.output(8, GPIO.HIGH) # Turn on
    sleep(1) # Sleep for 1 second
    GPIO.output(8, GPIO.LOW) # Turn off
    sleep(1) # Sleep for 1 second
```
- save file

---

# Run blinky.py

`python blinky.py`

---

# Run at startup

- open `sudo nano /etc/rc.local`

- paste this `sudo python /home/pi/blinky.py & > /home/pi/log.txt 2>&1` in before `exit`

---

# Deploy script 1

- create `~/deploy.sh`
- type or copy & paste

```shell
#! /bin/bash

echo "copying files"
scp -r blinky.py pi@<YOUR HOSTNAME>.local:/home/pi/blinky.py
echo "done"
```
- save

---

# Deploy script 2

- make it executable `chmod 744 deploy.sh`
- make a change to blinky.py
- run `sh deploy.sh`

---

# 🦄 Mai Linh 🦄

![inline 75%](mailinh.png)

https://gist.github.com/MaiLinhGroup

---

# These slides

https://github.com/genericspecific/pi_workshop