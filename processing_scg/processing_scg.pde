
import processing.serial.*;
import themidibus.*;
MidiBus mb;
String comPortString;
Serial myPort;
String val;
void setup() {
  size(1,1);
  frameRate(25);
  mb = new MidiBus(this, -1, "AUTOSAVE");
  
  
  String portName = Serial.list()[2]; 
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); 

}
int GETintArray(Serial actualfuck){
  String Destring = actualfuck.readStringUntil('\n');
  print(Destring);
  if(Destring != null) {
    //Destring = trim(Destring);
    //Destring = Destring.substring(0, Destring.length() - 1);
    int me = parseInt(Destring);
    return me;
  }
  return -1;
}

void draw() {
 if ( myPort.available() > 0)  {
   //int inputAR1 = GETintArray(myPort);
   val = myPort.readStringUntil('\n');
   
     print(val);
   
 }
 

 //if(inputAR1 != null &&  inputAR1.length == 4){

 //  if(inputAR1[0] !=0){
 //    mb.sendNoteOn(0, 50, 255); 
 //  }
 //  if(inputAR1[1]  !=0){
 //    mb.sendNoteOn(0, 60, 255); 
 //  }
 //  if(inputAR1[2] !=0){
 //    mb.sendNoteOn(0, 70, 255); 
 //  }
  
 //  if(inputAR1[3]  !=0){
 //    mb.sendNoteOn(0, 80, 255); 
 //  }
 //}
 

}