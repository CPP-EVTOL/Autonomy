# Autonomy
## Virtual Environment Setup
Download and install VMWare from: <a href="https://livecsupomona-my.sharepoint.com/:u:/g/personal/rickramirez_cpp_edu/EauwsEtVC3ZIpcxP7PNTYyQBfk_FGKrOK8cS6195BIdhJQ?e=aO1hES">VMWare 17 Download</a>

Download Ubuntu from <a href="https://releases.ubuntu.com/jammy/ubuntu-22.04.4-desktop-amd64.iso">Ubuntu 22 Download</a>

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

Depending on your system, set the <b>Memory</b> (between 4GB and 16GB)and <b>Processors</b> (between 2 and 6 cores). 

Select <b>CD/DVD (SATA)</b> and choose <b>Use ISO image file:</b>. Select the Ubuntu iso image that was downloaded previously.

![iso_image](https://github.com/CPP-EVTOL/Autonomy/assets/10952997/962df41d-978a-44cc-8bae-dc8c9c7f8900)

 Selece <b>ok</b> and press the play button to start the virtual machine. When prompted, select <b>Try or Install Ubuntu</b>
 
<img src="https://github.com/CPP-EVTOL/Autonomy/assets/10952997/b94cffa7-71df-4c76-bd16-ec7c21634d52" width="500">

Select <b>Install Ubuntu</b>

<img src="https://github.com/CPP-EVTOL/Autonomy/assets/10952997/221f1043-6b93-412e-aa8f-8d4800824ca2" width="500">

and select all default settings. Select <b>Install Now</b>. You will be prompted about partitions being formatted. Just select <b>continue</b>. 

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
This will install all the dependencies needed for your specific Ubuntu version
