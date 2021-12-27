## Overview ##

This project explores a ROS framework using a Pixhawk flight controller running mavros and a Raspberry Pi for general ROS learning.

### Hardware: ###

* Raspberry Pi 3B+ (and PiCamera v2)
* LidarLite v3

### Software: ###
Raspberry Pi running ROS Kinetic on Ubuntu 16.04 (from https://downloads.ubiquityrobotics.com/pi.html)
Development computer also running ROS Kinetic using WSL (instructions at https://jack-kawell.com/2019/06/24/ros-wsl1/)

### ROS Nodes Overview: ###

Nodes are created in the catkin_workspace under the following packages:
* ugv_plot - visualise UAV motion and turning
* ugv_lidar - node to control and display lidar points

### Instructions ###

1. Connect to Pi
Either SSH (with IP address of Pi on your own network) or through SSH with IP Address 10.42.0.1 when connected to Wifi access point ubuiqityrobotXXXX)

2. Navigate to catkin workspace
`sudo apt-get update && sudo apt-get upgrade`
`cd catkin_ws`
`source devel/setup.bash`

3. Run launch file
TBD

### References ##

ROS website tutorials (http://wiki.ros.org/ROS/Tutorials)
http://wiki.ros.org/joy/Tutorials/WritingTeleopNode
