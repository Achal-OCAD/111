/*
DIGF 6037 Creation & Computation
 Kate Hartman & Nick Puckett
 
 Arduino to Processing - sending 12 capacitive pin values. 
 values are saved into an array
 
 Based on based on this Lab on the ITP Physical Computing site: 
 https://itp.nyu.edu/physcomp/labs/labs-serial-communication/two-way-duplex-serial-communication-using-an-arduino/
 INSPIRED FROM ISO HEDRON'S SKETCH fFROM HIS INSTRAGRAM WORKS
 */

import processing.serial.*; // import the Processing serial library
Serial myPort;              // The serial port

//PImage img;

int totalPins =12;
int pinValues[] = new int[totalPins];


//int margin = 50;

float theta = 0;
float perspective = 0.95; 
float band = 7;



void setup() {
  size(1080, 1080);

  //img = loadImage("img 1.JPEG");

  // List all the available serial ports in the console
  printArray(Serial.list());

  // Change the 0 to the appropriate number of the serial port
  // that your microcontroller is attached to.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');
}



void draw() 
{
  background(255);
  //image(img , 0, 0, width/2, height/2);
  //stroke(100);
  translate(width/2, height/2);
  float dia = width*(1/perspective); 
  theta = theta - TWO_PI/45;



  for (int i = 0; i<pinValues.length; i++)
  {
    if (pinValues[i]==1)
    {


      if (i==0) {
        for (int j = 0; j<200; j++) {
          rectMode(CENTER);
          noStroke();
          fill(HSB, 200*(sin(theta+TWO_PI*j/band)*2), 100*(1+sin(theta+TWO_PI*j/band)), 
            140*(1+sin(theta+TWO_PI*j/band)/2));
          //rotate(100);
          rect(0, 0, dia, dia);
          dia = dia * perspective;
        }
      } 


      if (i==1) {
        for (int j = 0; j<200; j++) {
          rectMode(CENTER);
          noStroke();
          fill(HSB, 200*(sin(theta+TWO_PI*j/band)*2), 100*(1+sin(theta+TWO_PI*j/band)), 
            140*(1+sin(theta+TWO_PI*j/band)/2));
          rotate(99);
          rect(0, 0, dia, dia);
          dia = dia * perspective;
        }
      } 


      if (i==2) {
        for (int j = 0; j<200; j++) {
          rectMode(CENTER);
          noStroke();
          fill(HSB, 200*(sin(theta+TWO_PI*j/band)*2), 100*(1+sin(theta+TWO_PI*j/band)), 
            150*(1+sin(theta+TWO_PI*j/band)/2));
          rotate(95);
          rect(0, 0, dia, dia);
          dia = dia * perspective;
        }
      }


      if (i==3) {
        for (int j = 0; j<200; j++) {
          rectMode(CENTER);
          noStroke();
          fill(HSB, 200*(sin(theta+TWO_PI*j/band)*2), 100*(1+sin(theta+TWO_PI*j/band)), 
            140*(1+sin(theta+TWO_PI*j/band)/2));
          rotate(4);
          rect(0, 0, dia, dia);
          dia = dia * perspective;
        }
      } else
      {

        //noFill();
      }
    }

    //ellipse(margin+(i*(width-(margin*2))/pinValues.length),height/2,30,30);
  }
}


       void serialEvent(Serial myPort) {
       // read the serial buffer:
       String myString = myPort.readStringUntil('\n');
       if (myString != null) {
       // println(myString);
       myString = trim(myString);
       pinValues = int(split(myString, ','));
  }
      //printArray(pinValues);
}
