// Hardware Serial to receive XBOX input from 915 MHz telemetry link and
// actuate steering and throttle servos

// Adapted from https://forum.arduino.cc/t/serial-input-basics-updated/382007/3

#include <Servo.h> 

const int numChars = 32;
char receiveArray[numChars];
char tempArray[numChars];
int char_ctr = 0;
char stopMarker = '#'; //stop byte is # symbol

//parsed input from XBOX
int currSteer = 0;
int currThrottle = 0;

boolean newData = false;

// Defining hardware pins
#define MOTOR_PWM 3   //Motor for propulsion 
#define SERVO_PWM 5   //Servo for steering. (to calibrate) 

#define PWM_TOP 1200
#define PWM_BOT 1000
#define LED 2

Servo driveMotor;
Servo steerServo;

void setup()
{
  // Open serial communications and wait for port to open:
  Serial.begin(115200);
  pinMode(LED,OUTPUT);
  analogWrite(LED,140);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Native USB only
  }

  driveMotor.writeMicroseconds(PWM_BOT);
  steerServo.writeMicroseconds(PWM_BOT);

  driveMotor.attach(MOTOR_PWM);
  steerServo.attach(SERVO_PWM);
  delay(1000);
}

void parseData() {      // split the data into its parts in CSV format

    char * strtokIndx; // this is used by strtok() as an index

    strtokIndx = strtok(tempArray, ",");
    currThrottle = atoi(strtokIndx);   

    strtokIndx = strtok(NULL, ",");
    currSteer = atoi(strtokIndx);     

}

void actuateRC() {
    Serial.print("Throttle ");
    Serial.print(currThrottle);
    Serial.print(",Steering ");
    Serial.println(currSteer);
    
    // actuate servos from input
    steerServo.write(currThrottle);
    driveMotor.write(currSteer);

}

void loop()
{
  
  while (Serial.available() > 0 && newData == false)
  {
    char rc = Serial.read();

    if (rc != stopMarker)
    {
      receiveArray[char_ctr] = rc;
      char_ctr++;
      if (char_ctr >= numChars) char_ctr = numChars - 1;
    }
    // at stopMarker
    else 
    {
      receiveArray[char_ctr] = '\0'; //null terminate string
      char_ctr = 0;
      newData = true;
    }        
  }

  if (newData == true) {
        strcpy(tempArray, receiveArray);
            // this temporary copy is necessary to protect the original data
            //   because strtok() used in parseData() replaces the commas with \0
        parseData();
        actuateRC();
        newData = false;
    }
  
  delay(100);
}