import processing.serial.*;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import javax.swing.KeyStroke;


Serial MyPort;
String KeyString = "";
char CString = ' ';

void setup()
{
  System.out.println("Hello, I am Beginning Processing!");
  size(700, 500);
  // TODO: Retreive your particular arduino's com name and replace it here
  MyPort = new Serial(this, "/dev/cu.usbmodem1421", 9600);// My Arduino is on COM3. Enter the COM on which your Arduino is on.
  MyPort.bufferUntil('\n');
}

void draw(){
  background(0, 0, 0);
  fill(255, 0, 0);
  text(KeyString, 100, 175);
}

void serialEvent(Serial MyPort)throws Exception {
   KeyString = MyPort.readStringUntil('\n');
   CString = KeyString.charAt(0);
   KeyString = KeyString.substring(1, KeyString.indexOf(':'));
   System.out.println(KeyString);
   Robot Arduino = new Robot();
   int KeyToPress;
   switch(KeyString){
     case "UPS":
      if(CString == '1'){
        Arduino.keyPress(KeyEvent.VK_UP);
        Arduino.keyRelease(KeyEvent.VK_UP);
      }
      else{
        Arduino.keyPress(KeyEvent.VK_A);
        Arduino.keyRelease(KeyEvent.VK_A);
      }
      break;
     case "UPF":
      if(CString == '1'){
        Arduino.keyPress(KeyEvent.VK_UP);
        Arduino.keyRelease(KeyEvent.VK_UP);
      }
      else{
        Arduino.keyPress(KeyEvent.VK_A);
        Arduino.keyRelease(KeyEvent.VK_A);
      }
      break;
     case "DOWNS":
      if(CString == '1'){
        Arduino.keyPress(KeyEvent.VK_DOWN);
        Arduino.keyRelease(KeyEvent.VK_DOWN);
      }
      else{
        Arduino.keyPress(KeyEvent.VK_Z);
        Arduino.keyRelease(KeyEvent.VK_Z);
      }
      break;
     case "DOWNF":
      if(CString == '1'){
        Arduino.keyPress(KeyEvent.VK_DOWN);
        Arduino.keyRelease(KeyEvent.VK_DOWN);
      }
      else{
        Arduino.keyPress(KeyEvent.VK_Z);
        Arduino.keyRelease(KeyEvent.VK_Z);
      }
      break;
   }

}
