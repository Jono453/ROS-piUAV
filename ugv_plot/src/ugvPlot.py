#!/usr/bin/env python

# Purpose: ROS Node for ploting of UGV actuation (telemetry later)

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Vector3
import matplotlib.pyplot as plt
from math import pi
from std_msgs.msg import Float32, Bool
from std_msgs.msg import Float32MultiArray
import matplotlib.animation as animation

def run():

    rospy.init_node('ugvPlot')
   
    # Visualisation of cmd_vel topic messages

    rospy.spin() #will keep the program alive while the node is alive, 
    #and will also trigger all the callbacks for the topics you’ve subscribed to.

if __name__ == '__main__':
    run()
   
    