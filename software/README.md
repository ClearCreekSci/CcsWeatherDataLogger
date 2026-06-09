<-- [Back to Weather Data Logger Project](https://github.com/ClearCreekSci/CcsWeatherDataLogger)

# Weather Data Logger Software

The Clear Creek Scientific (CCS) Weather Data Logger software is intended to run on a Raspberry Pi Zero W (a Pi Zero 2 W may also be used). The "W" stands for "wireless", which is used to view and access the collected data. The Weather Data Logger software consists of two main parts:

* Software to read various sensors and record that data.
* A small web server that allows viewing and downloading the collected data. The web server may be accessed by any device (phone, tablet, computer etc.) connected to the same local network as the Raspberry Pi.

## Requirements

Installing the weather data logger software requires the following:

* The Raspberry Pi Zero needs to be running the right operating system. If you haven't done so already, install one: 
  * [For Windows, MacOs or Debian Derivative (including Ubuntu)](https://www.youtube.com/watch?v=iv5RTSQmtjo)
  * [For other Linux distributions](https://github.com/ClearCreekSci/WikiBase/wiki/wiki-howto-setup-raspberry-pi-zero-linux).
* You will need a computer with access to the same network as the Raspberry Pi Zero. We'll call it the installation computer. The installation computer needs to have SSH client software installed.

# Installation Instructions

The easiest way to install the data logger software is to use [Gambezi](https://github.com/ClearCreekSci/gambezi). It will create installation scripts for both the data logging software and the web-based server that lets you view and download data from the Raspberry Pi. Watch the [Youtube video]() to see how it is done. 

<-- [Back to Weather Data Logger Project](https://github.com/ClearCreekSci/CcsWeatherDataLogger)
