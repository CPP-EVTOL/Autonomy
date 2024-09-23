#!/bin/bash

git clone https://github.com/PX4/PX4-Autopilot.git --recursive
sudo bash ./PX4-Autopilot/Tools/setup/ubuntu.sh -y

sudo reboot