#! /bin/bash

echo "copying files"
scp -r blinky.py pi@YOUR_HOSTNAME.local:/home/pi/blinky.py
echo "done"