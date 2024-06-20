# Autonomy
## Virtual Environment Setup
Download and install VMWare from: <a href="https://livecsupomona-my.sharepoint.com/:u:/g/personal/rickramirez_cpp_edu/EauwsEtVC3ZIpcxP7PNTYyQBfk_FGKrOK8cS6195BIdhJQ?e=aO1hES">VMWare 17 Download</a>

Download Ubuntu 22 from <a href="https://releases.ubuntu.com/jammy/ubuntu-22.04.4-desktop-amd64.iso">Ubuntu 22 Download</a>
Download Ubuntu 20 from <a href="https://releases.ubuntu.com/focal/ubuntu-20.04.6-desktop-amd64.iso">Ubuntu 20 Download</a>

After installing VMWare, open it and select <b>Create a new Virtual Machine</b> 

<img src="https://github.com/CPP-EVTOL/Autonomy/assets/10952997/b166ffce-78fc-4876-adf8-b7460d0ae42f" width="500">

and select:
<ul>
  <li>I will install the operating system later.</li>
  <li>Linux</li>
  <li>Maximum Disk Space: 50GB - 100GB / Store virtual disk as a single file</li>
</ul>

Select the virtual machine's name from the left panal, and open the <b>Edit virtual machine settings</b> icon


<img src="https://github.com/CPP-EVTOL/Autonomy/assets/10952997/6106a8aa-f699-4d16-9b12-1b2a91ea1782" width="500">

Depending on your system, set the <b>Memory</b> (between 4GB and 16GB) and <b>Processors</b> (between 2 and 6 cores). 

Select <b>CD/DVD (SATA)</b> and choose <b>Use ISO image file</b>. Select the Ubuntu iso image that was downloaded previously.

![iso_image](https://github.com/CPP-EVTOL/Autonomy/assets/10952997/962df41d-978a-44cc-8bae-dc8c9c7f8900)

 Select <b>ok</b> and press the play button to start the virtual machine. When prompted, select <b>Try or Install Ubuntu</b>
 
<img src="https://github.com/CPP-EVTOL/Autonomy/assets/10952997/b94cffa7-71df-4c76-bd16-ec7c21634d52" width="500">

Select <b>Install Ubuntu</b>

<img src="https://github.com/CPP-EVTOL/Autonomy/assets/10952997/221f1043-6b93-412e-aa8f-8d4800824ca2" width="500">

and select all default settings. 

Select <b>Install Now</b>. You will be prompted about partitions being formatted. Just select <b>continue</b>. 

You will then be asked to create credentials. Set your name and password to anything you want. But I reccomend a 4 digit pin for the password as you will have to use it for <b>sudo</b> privileges later.

When the installation is finished, select <b>Restart Now</b>, you should see a prompt say <i>Please remove the installation medium, then press ENTER</i>. Just press <b>ENTER</b>

Once the virtual machine boots up, type 
<pre>CRTL+ALT+t</pre>
to open a new terminal. In the terminal install GIT with 
<pre>sudo apt install git -y</pre>
when prompted for <b>sudo</b> privileges feed it your password and press <b>ENTER</b>

Navigate to the Desktop with
<pre>cd Desktop</pre>
and clone the PX4 repository with 
<pre>git clone https://github.com/PX4/PX4-Autopilot.git --recursive</pre>
When the clone completes, type
<pre>bash ./PX4-Autopilot/Tools/setup/ubuntu.sh</pre>
This will install all the dependencies needed for your specific Ubuntu version. 
Once that is complete, restart the machine with 
<pre>sudo reboot</pre>
Open a new terminal and run the commands
<pre>echo "export SVGA_VGPU10=0" >> ~/.bashrc</pre>
<pre>echo "export LIBGL_DRI3_DISABLE=1" >> ~/.bashrc</pre>
This will downgrade the GL_VERSION from 3.3 to 2.1 since OpenGL 3.3 seems to have issues running Gazebo with Ubuntu22. This is NOT the case for Ubuntu20. 

Now install QGroundControl by first funning the commands:

<pre>sudo usermod -a -G dialout $USER
sudo apt-get remove modemmanager -y
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y
sudo apt install libfuse2 -y
sudo apt install libxcb-xinerama0 libxkbcommon-x11-0 libxcb-cursor0 -y</pre>
You might need to reboot once more. 
Once the machine is back up, download QGroundControl from : <a href="https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage">QGroundControl Download</a>

Open a terminal in the <b>Downloads</b> folder and run the command:
<pre>chmod +x ./QGroundControl.AppImage</pre>
and launch the application with 
<pre>./QGroundControl.AppImage</pre>
<img src="https://github.com/CPP-EVTOL/Autonomy/assets/10952997/4e8e8e5b-1db4-47f5-a71e-3fe7e75cfa39" width="500">

Navigate to the <b>PX4-Autopilot</b> directory and run the command 
<pre>make px4_sitl gz_x500</pre>
Gazebo should open and you should see a model appear

<img src="https://github.com/CPP-EVTOL/Autonomy/assets/10952997/050c0606-05ed-428b-9dce-97c7688d0c17" width="500">

You should also hear QGroundConttrol announce that it is ready to fly. Commands can be given from either the terminal running PX4-Autopilot, or from the QGroundControl interface. For example, if you run 

<pre>commander takeoff</pre>

you should see the UAV model start the motors in Gazebo and also see the altitude increase in QGroundControl. 
