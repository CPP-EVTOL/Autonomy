#!/bin/bash

sudo cd ~/Desktop

sudo apt update -y
sudo apt upgrade -y

wget https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage
chmod +x ./QGroundControl.AppImage


git clone https://github.com/PX4/PX4-Autopilot.git --recursive
sudo bash ./PX4-Autopilot/Tools/setup/ubuntu.sh -y
cd PX4-Autopilot/
git submodule update --init --recursive

sudo make px4_sitl

cd ..

#export SVGA_VGPU10=0 
#export LIBGL_DRI3_DISABLE=1 echo 
#echo "export SVGA_VGPU10=0" >> ~/.bashrc
#echo "export LIBGL_DRI3_DISABLE=1" >> ~/.bashrc


wget https://github.com/mavlink/MAVSDK/releases/download/v1.4.16/libmavsdk-dev_1.4.16_ubuntu20.04_amd64.deb
sudo dpkg -i libmavsdk-dev_1.4.16_ubuntu20.04_amd64.deb 

git clone https://github.com/mavlink/MAVSDK.git --recursive
cd MAVSDK/
git submodule update --init --recursive

sudo cmake -DCMAKE_BUILD_TYPE=Debug -Bbuild/default -H.
sudo cmake --build build/default -j8
sudo cmake --build build/default --target install

cd ..

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
sudo apt install software-properties-common
sudo add-apt-repository universe -y
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade -y
sudo apt install ros-humble-desktop -y
sudo apt install ros-dev-tools -y

pip install --user -U empy==3.3.4 pyros-genmsg setuptools

git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build
cd build
sudo cmake ..
sudo make
sudo make install
sudo ldconfig /usr/local/lib/

sudo cd ~/Desktop/

mkdir -p ~/ws_sensor_combined/src/
cd ~/ws_sensor_combined/src/
git clone https://github.com/PX4/px4_msgs.git
git clone https://github.com/PX4/px4_ros_com.git
cd ..
source /opt/ros/humble/setup.bash
colcon build
source install/local_setup.bash

source /opt/ros/humble/setup.bash 
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
