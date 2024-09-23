#!/bin/bash

sudo usermod -a -G dialout $USER
sudo apt-get remove modemmanager -y
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y
sudo apt install libfuse2 -y
sudo apt install libxcb-xinerama0 libxkbcommon-x11-0 libxcb-cursor0 -y

sudo usermod -a -G dialout $USER 
sudo apt-get remove modemanager

wget https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage
chmod 777 QGroundControl.AppImage