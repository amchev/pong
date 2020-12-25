import processing.serial.*;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import javax.swing.KeyStroke;


Serial MyPort;
String KeyString = "";
char ControllerString = "";

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
   ControllerString = KeyString.charAt(0);
   KeyString = KeyString.substring(1, KeyString.indexOf(':'));
   System.out.println(KeyString);
   Robot Arduino = new Robot();
   int KeyToPress;
   switch(KeyString){
     case "UPS":
      Arduino.keyPress(KeyEvent.VK_SPACE);
      Arduino.keyRelease(KeyEvent.VK_SPACE);
      break;
     case "UPF":
      Arduino.keyPress(KeyEvent.VK_SPACE);
      Arduino.keyRelease(KeyEvent.VK_SPACE);
      break;
     case "DOWNS":
      Arduino.keyPress(KeyEvent.VK_SPACE);
      Arduino.keyRelease(KeyEvent.VK_SPACE);
      break;
     case "DOWNF":
      Arduino.keyPress(KeyEvent.VK_SPACE);
      Arduino.keyRelease(KeyEvent.VK_SPACE);
      break;
   }

}
