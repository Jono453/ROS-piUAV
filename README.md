## Overview ##

This project is source code for ROS framework and low-cost hardware to make an autonomous RC car controlled by a Raspberry Pi. Learning from scratch how to set up ROS on a Pi and use it to interface to a variety of sensors and visualisation as would be found in a  real autonomous UGV.

### Hardware: ###

https://www.auselectronicsdirect.com.au/rc-4wd-off-road-truggy-1-12th-2.4ghz-digital-propo

* Eagle 20A Brushed DC ESC
* Raspberry Pi 3B
* Futaba BLS173SV SBUS2 Servo
* 6-DOF IMU MPU6050
* LidarLite v3

### Software: ###
Raspberry Pi running ROS Kinetic on Ubuntu 16.04 (from https://downloads.ubiquityrobotics.com/pi.html)
Development computer also running ROS Kinetic using WSL (instructions at https://jack-kawell.com/2019/06/24/ros-wsl1/)

### ROS Nodes Overview: ###

Nodes are created in the catkin_workspace under the following packages:
* ugv_servo - rosserial with Arduino Uno (PCA9685 PWM driver module later)
* ugv_plot - visualise UGV motion and turning
* ugv_lidar - node to control and display lidar points
* ugv_imu - MPU6050 interfacing on Pi
* ugv_ps3 - teleop node using Ps3 controller

### Setup on Pi ###
TBD

### Instructions ###

1. Connect to Pi
Either SSH (with IP address of Pi on your own network) or through SSH with IP Address 10.42.0.1 when connected to Wifi access point ubuiqityrobotXXXX)

2. Navigate to catkin workspace
`sudo apt-get update && sudo apt-get upgrade`
`cd catkin_ws`
`source devel/setup.bash`

3. Run launch file
Run in seperate terminals:
`rosrun rosserial_python serial_node.py /dev/ttyUSB0`

### References ##

ROS website tutorials (http://wiki.ros.org/ROS/Tutorials)
http://wiki.ros.org/joy/Tutorials/WritingTeleopNode
