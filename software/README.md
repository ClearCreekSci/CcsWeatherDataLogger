<-- [Back to Weather Data Logger Project](https://github.com/ClearCreekSci/CcsWeatherDataLogger)

# Weather Data Logger Software

The Clear Creek Scientific (CCS) Weather Data Logger software is intended to run on a Raspberry Pi Zero W (a Pi Zero 2 W may also be used). The "W" stands for "wireless", which is used to view and access the collected data. The Weather Data Logger software consists of two main parts:

* Software to read various sensors and record that data.
* A small web server that allows viewing and downloading the collected data. The web server may be accessed by any device (phone, tablet, computer etc.) connected to the same local network as the Raspberry Pi.

## Requirements

Installing the weather data logger software requires the following:

* The Raspberry Pi Zero needs to be running the right operating system. If you haven't done so already, do this: [set up the Raspberry Pi](https://github.com/ClearCreekSci/WikiBase/wiki/wiki-setup-raspberry-pi-zero-for-weatherlogger)).
* You will need a computer with access to the same network as the Raspberry Pi Zero. We'll call it the installation computer. The installation computer needs to have SSH client software installed. If your computer doesn't have SSH client software, install it as described below:

### Installing SSH on Windows

Windows doesn't come with a built-in SSH client, so one needs to be installed. We suggest either downloading and installing [Putty](https://www.putty.org/) or activating the Windows Subsytem for Linux (WSL) to use the native SSH client contained therein.

#### Using PuTTY

* Download the [PuTTY installation software](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
* Run the installer. Make a note of the directory in which PuTTY is installed. The default is `C:\Program Files\Putty`
* Once PuTTY is installed, you can use it to connect to the Raspberry Pi. In the dialog box that appears, type the IP address in the box named "Host Name (or IP address)". Click the "Open" button. When asked to login, use the credentials that you previously configured when setting up the Raspberry Pi. The terminal you log into will allow you to run commands on the Raspberry Pi. Type `exit` to close the connection and the terminal window.

#### Using WSL

* [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
* In a command prompt, run the command: `wsl`
* To connect to the Raspberry Pi, run the following in the WSL command window:

`> ssh <user name>@<ip address>`

where `<user name>` is the user name you previously chose when setting up the Raspberry Pi, and `<ip address>` is the ip address you recorded when setting up the Raspberry Pi. You will be prompted to enter the password you selected for the Raspberry Pi. Once you successfully log in, the commands you type will run on the Raspberry Pi. Type `exit` to return to the WSL prompt on your computer.


### Using SSH on macOS

The macOS terminal has a built-in ssh client. Open a terminal and run the following command to connect to the
Raspberry Pi:

`> ssh <user name>@<ip address>`

where `<user name>` is the user name you previously chose when setting up the Raspberry Pi, and `<ip address>` is the ip address you recorded when setting up the Raspberry Pi. You will be prompted to enter the password you selected for the Raspberry Pi. Once you successfully log in, the commands you type will run on the Raspberry Pi. Type `exit` to return to the terminal prompt on your computer.


### Using SSH on Linux

Most Linux distributions come with an ssh client already installed. Run the following command to connect to the
Raspberry Pi:

`> ssh <user name>@<ip address>`

where `<user name>` is the user name you previously chose when setting up the Raspberry Pi, and `<ip address>` is the ip address you recorded when setting up the Raspberry Pi. You will be prompted to enter the password you selected for the Raspberry Pi. Once you successfully log in, the commands you type will run on the Raspberry Pi. Type `exit` to return to the command prompt on your computer.

If ssh is not installed, consult the documentation for your distribution for instructions on setting up ssh.


## Installing the CCS Weather Data Logger Software on the Raspberry Pi

Once the above requirements have been met, do the following on the installation computer:

### Downloading the Weather Data Logger Code

* Download and extract the Clear Creek Scientific Weather Data Logger software.
  * Navigate to the [Weather Data Logger project page](https://github.com/ClearCreekSci/CcsWeatherDataLogger)
  * Click on the "<> Code" button and select "Download ZIP" from the bottom of the menu.
  * Extract the files from the ZIP archive using your favorite decompression software.


### Copying Files to the Raspberry Pi Zero

Use some version of scp (secure copy) to move files from the installation computer to the Raspberry Pi.

#### Copying Files Using PuTTY on Windows

* On the installation computer, open a command prompt and navigate to the folder where you downloaded the weather station software. Change to the "software" folder. Use pscp.exe to copy the following files to the your Raspberry Pi user's home directory. You will need to know the directory where PuTTY is installed. This example assumes the default installation directory. In the example commands shown, replace `<username for Pi>` with the username you previously chose for the Raspberry Pi. Replace `<IP address for Pi>` with the IP address you recorded when setting up the Raspberry Pi. After running each command, you will be asked for the password for the Raspberry Pi. 
  * `"C:\Program Files\PuTTY\pscp.exe" install_CcsWeatherDataLogger.sh <username for Pi>@<IP address for Pi>:/home/<username for Pi>`
  * `"C:\Program Files\PuTTY\pscp.exe" v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip <username for Pi>@<IP address for Pi>:/home/<username for Pi>`


##### Copying Files Using WSL on Windows

* On the installation computer, open a command prompt and navigate to the folder where you downloaded the weather station software. Change to the "software" folder. Run the command: `wsl`. Use the scp command to copy the following files to your Raspberry Pi user's home directory. In the example commands shown, replace `<username for Pi>` with the username you previously chose for the Raspberry Pi. Replace `<IP address for Pi>` with the IP address you recorded when setting up the Raspberry Pi. After running each command, you will be asked for the password for the Raspberry Pi.
  * `scp install_CcsWeatherDataLogger.sh <username for Pi>@<IP address for PI>:/home/<username for Pi>`
  * `scp v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip <username for Pi>@<IP address for PI:/home/<username for Pi>`



#### Copying Files Using macOS

* On the installation computer, open a terminal and navigate to the directory where you downloaded the weather station software. Change to the "software" directory. Use the scp command to copy the following files to your Raspberry Pi user's home directory. In the example commands shown, replace `<username for Pi>` with the username you previously chose for the Raspberry Pi. Replace `<IP address for Pi>` with the IP address you recorded when setting up the Raspberry Pi. After running each command, you will be asked for the password for the Raspberry Pi.
  * `scp install_CcsWeatherDataLogger.sh pi@<IP address for PI>:/home/<username for Pi>`
  * `scp v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip pi@<IP address for PI:/home/<username for Pi>`

#### Copying Files Using Linux

* On the installation computer, open a command prompt and navigate to the directory where you downloaded the weather station software. Change to the "software" directory. Use the scp command to copy the following files to your Raspberry Pi user's home directory. In the example commands shown, replace `<username for Pi>` with the username you previously chose for the Raspberry Pi. Replace `<IP address for Pi>` with the IP address you recorded when setting up the Raspberry Pi. After running each command, you will be asked for the password for the Raspberry Pi.
  * `scp install_CcsWeatherDataLogger.sh pi@<IP address for PI>:/home/<username for Pi>`
  * `scp v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip pi@<IP address for PI:/home/<username for Pi>`


## Running the Installation Script

The last step is to run the installation script on the Raspberry Pi which will copy necessary files and configure the Raspberry Pi to run the data collection software and web server. Depending on your setup, do one of the following:

### Using a Keyboard and Monitor Connected to the Raspberry Pi

If you have a keyboard and monitor connected to the Raspberry Pi, navigate to your user's home directory and run the following:

`sudo install_CcsWeatherDataLogger.sh v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip`

After the script runs, you should see a message indicating successful installation.


#### Using SSH with PuTTY on Windows

Start PuTTY by clicking on the PuTTY icon. In the dialog box that appears, type the IP address of the Raspberry Pi in the box named "Host Name (or IP address)". Click the "Open" button. When asked to login, use the credentials that you previously configured for the Raspberry Pi. In the terminal window that appears, type the following:

`sudo install_CcsWeatherDataLogger.sh v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip`

After the script runs, you should see a message indicating successful installation.


#### Using SSH with WSL on Windows

* On the installation computer, start WSL by running the command:
  * `wsl`.
* Once WSL has started, use SSH to connect to the Raspberry PI (you'll be asked for the password):
  * `ssh <username for Pi>@<IP address for PI>`
* Once connected to the Raspberry Pi, run the install script as root, passing the install bundle as a parameter:
  * `sudo install_CcsWeatherDataLogger.sh v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip`

After the script runs, you should see a message indicating successful installation.
 

### Using SSH from macOS

* On the installation computer, open a termina and use SSH to connect to the Raspberry PI (you'll be asked for the password):
  * `ssh <username for Pi>@<IP address for PI>`
* Once connected to the Raspberry Pi, run the install script as root, passing the install bundle as a parameter:
  * `sudo install_CcsWeatherDataLogger.sh v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip`

After the script runs, you should see a message indicating successful installation.


### Using SSH from Linux

* On the installation computer, use SSH to connect to the Raspberry PI (you'll be asked for the password):
  * `ssh <username for Pi>@<IP address for PI>`
* Once connected to the Raspberry Pi, run the install script as root, passing the install bundle as a parameter:
  * `sudo install_CcsWeatherDataLogger.sh v1.0.0_CcsWeatherDataLogger_Install_Bundle.zip`

After the script runs, you should see a message indicating successful installation.


## Rebooting the Raspberry Pi

Either from the keyboard connected to the Raspberry Pi, or over SSH from the installation computer, run the following command on the Raspberry Pi:

`sudo reboot`

<-- [Back to Weather Data Logger Project](https://github.com/ClearCreekSci/CcsWeatherDataLogger)
