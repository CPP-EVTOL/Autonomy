#!/bin/bash

cd ~/Desktop

apt update -y
apt upgrade -y
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
bash ./PX4-Autopilot/Tools/setup/ubuntu.sh -y
cd PX4-Autopilot/
git submodule update --init --recursive

make px4_sitl

cd ..

echo export SVGA_VGPU10=0 
echo export LIBGL_DRI3_DISABLE=1 echo 

wget https://github.com/mavlink/MAVSDK/releases/download/v1.4.16/libmavsdk-dev_1.4.16_ubuntu20.04_amd64.deb
sudo dpkg -i libmavsdk-dev_1.4.16_ubuntu20.04_amd64.deb 

git clone https://github.com/mavlink/MAVSDK.git --recursive
git submodule update --init --recursive
cd MAVSDK/
cmake -DCMAKE_BUILD_TYPE=Debug -Bbuild/default -H.
cmake --build build/default -j8
sudo cmake --build build/default --target install

echo -e "\n"

apt update && sudo apt install locales
locale-gen en_US en_US.UTF-8
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
apt install software-properties-common
add-apt-repository universe
apt update && sudo apt install curl -y
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
apt update && sudo apt upgrade -y
apt install ros-humble-desktop -y
apt install ros-dev-tools -y

pip install --user -U empy==3.3.4 pyros-genmsg setuptools

git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build
cd build
cmake ..
make
make install
ldconfig /usr/local/lib/

mkdir -p ~/ws_sensor_combined/src/
cd ~/ws_sensor_combined/src/
git clone https://github.com/PX4/px4_msgs.git
git clone https://github.com/PX4/px4_ros_com.git
cd ..
source /opt/ros/humble/setup.bash
colcon build
source install/local_setup.bash

source /opt/ros/humble/setup.bash && echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
