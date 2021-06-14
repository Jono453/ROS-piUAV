import processing.serial.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;
import org.firmata.*;

ControlDevice cont;
ControlIO control;
float throttle_stick;
float steer_stick;

Serial rcPort;

void setup() {
  
  size(200, 200);
  
  control = ControlIO.getInstance(this);
  cont = control.getMatchedDevice("xbox"); //name of config file for XBOX controller from GCP Library GUI
  if (cont == null) {
    println("not today chump"); // write better exit statements than me
    System.exit(-1);
   
  }
    
  //printArray(Serial.list());
  
  String rc_port = Serial.list()[0];
  rcPort = new Serial(this,rc_port,115200);  
  
}

public void getUserInput_Throttle() {
  throttle_stick = map(cont.getSlider("throttle").getValue(), -1, 1, 0, 180);
}

public void getUserInput_Steer() {
  steer_stick = map(cont.getSlider("steer").getValue(), -1, 1, 0, 180);
}

void draw() {
  
  //call backs for throttle and steering XBOX input
  getUserInput_Throttle();
  getUserInput_Steer();
  
  rcPort.write(int(steer_stick));
  rcPort.write(',');
  rcPort.write(int(throttle_stick));
  rcPort.write('#');
  
  delay(100);


   
}
