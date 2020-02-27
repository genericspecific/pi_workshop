#! /bin/bash

echo "copying files"
scp -r blinky.py pi@dino-rpi.local:/home/pi/blinky.py
echo "done"