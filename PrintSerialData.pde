import processing.serial.*;

int linefeed = 10;
Serial myPort;

void setup() {
  println(Serial.list());
  
  // open first port
  myPort = new Serial(this, Serial.list()[4], 9600);
  
  // read bytes
  myPort.bufferUntil(linefeed);
}

void draw() {
  // waiting
}

// callback for serial data
void serialEvent(Serial myPort) {
  String myString = myPort.readStringUntil(linefeed);
  
  if (myString != null) {
    myString = trim(myString);
  }
  
  // print the data
  println(myString);
}
