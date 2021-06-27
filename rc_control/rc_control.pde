import processing.serial.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;
import org.firmata.*;

ControlDevice cont;
ControlIO control;
float throttle_stick;
float steer_stick;
float safety_state;
String s;

Serial rcPort;

void setup() {
  
  size(200, 200);
  
  control = ControlIO.getInstance(this);
  cont = control.getMatchedDevice("xbox"); //name of config file for XBOX controller from GCP Library GUI
  if (cont == null) {
    println("not today chump"); // write better exit statements than me
    System.exit(-1);   
  }
    
  printArray(Serial.list());
  
  String rc_port = Serial.list()[0];
  rcPort = new Serial(this,rc_port,57600);  
  
  rcPort.write("950,1500#\n");
  delay(1000);
  
}

public void getUserInput_Throttle() {
  throttle_stick = map(cont.getSlider("throttle").getValue(), 1, -1, 990, 2000);
}

public void getUserInput_Steer() {
  steer_stick = map(cont.getSlider("steer").getValue(), -1, 1, 990, 2000);
}

public void getUserInput_Safety() {
  safety_state = cont.getSlider("safety").getValue();
}

void draw() {
  
  //call backs for throttle and steering XBOX input
  getUserInput_Throttle();
  getUserInput_Steer();
  
  print(throttle_stick);
  print(" ");
  print(steer_stick);
  print(" ");
  println(safety_state); 
  
  rcPort.write(nf(throttle_stick)); //PWM CH3
  rcPort.write(",");
  rcPort.write(nf(steer_stick)); //PWM CH5
  rcPort.write("#\n");
  
  delay(50);
 

}
