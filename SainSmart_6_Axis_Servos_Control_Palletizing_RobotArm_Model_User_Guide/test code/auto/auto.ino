#include <Servo.h>
Servo myservoA;
Servo myservoB;
Servo myservoC;
Servo myservoD;
Servo myservoE;
Servo myservoF;
int i, pos, myspeed;

void servosetup()  //initialization
{
  myservoA.attach(3);  //  Control waist (A) port number is 3 / Is servo 4 from guide
  myservoA.write(90);
  delay(1000);
  myservoB.attach(5);  //  Control lorearm(B）port number is 5 /
  myservoB.write(0);
  delay(1000);
  myservoC.attach(0);  //  Control  Forearm(C）port number is 6 / Is servo 1 from guide
  myservoC.write(120);
  delay(1000);
  myservoD.attach(1);  // Control Forearm rotation (D) port number is 9 /
  myservoD.write(90);
  delay(1000);
  myservoE.attach(2); // Control wrist(E）port number is 10 wrist /
  myservoE.write(90);
  delay(1000);
  myservoF.attach(4); // Control wrist rotation (F) port number is 11 /
  myservoF.write(90);
  delay(1000);
}

void sweep()
{
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoA.write(int(map(pos, 1, myspeed,90, 180)));
//    delay(100);
//  }
//  myspeed = 1800;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoA.write(int(map(pos, 1, myspeed, 180, 0)));
//    delay(100);
//  }
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoA.write(int(map(pos,1,myspeed,0,90)));
//    delay(100);
//  }
//  //--------------------------------------------------
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoC.write(int(map(pos, 1, myspeed, 120, 30)));
//    delay(100);
//  }
  myspeed = 1200;
  for (pos = 0; pos <= myspeed; pos += 1)
  {
    myservoB.write(int(map(pos, 1, myspeed, 0, 120)));
    delay(40);
  }
  for (pos = 0; pos <= myspeed; pos += 1)
  {
    myservoB.write(int(map(pos, 1, myspeed, 120, 0)));
    delay(40);
  }
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoC.write(int(map(pos, 1, myspeed, 30, 120)));
//    delay(100);
//  }
//  //------------------------------------------------
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoD.write(int(map(pos, 1, myspeed, 90, 180)));
//    delay(1);
//  }
//  myspeed = 1800;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoD.write(int(map(pos, 1, myspeed, 180, 0)));
//    delay(1);
//  }
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoD.write(int(map(pos, 1, myspeed, 0, 90)));
//    delay(1);
//  }
//  //--------------------------------------------------
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoE.write(int(map(pos, 1, myspeed, 90, 0)));
//    delay(1);
//  }
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoE.write(int(map(pos, 1, myspeed, 0, 90)));
//    delay(1);
//  }
//  //---------------------------------------------------
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoF.write(int(map(pos, 1, myspeed, 90, 180)));
//    delay(1);
//  }
//  myspeed = 1800;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoF.write(int(map(pos, 1, myspeed, 180, 0)));
//    delay(1);
//  }
//  myspeed = 900;
//  for (pos = 0; pos <= myspeed; pos += 1)
//  {
//    myservoF.write(int(map(pos, 1, myspeed, 0, 90)));
//    delay(1);
//  }
//  exit;
}

void setup()
{
  servosetup();
}
void loop()
{
  sweep();
}
