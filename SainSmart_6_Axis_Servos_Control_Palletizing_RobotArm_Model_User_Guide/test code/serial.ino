#include <Servo.h>  
Servo myservoA;  
Servo myservoB;
Servo myservoC;
Servo myservoD;
Servo myservoE;
Servo myservoF;
int angleA,angleB,angleC,angleD,angleE,angleF;
int i,pos,myspeed;
static int v=0;
String mycommand;
void servosetup()  //initialization
{
  myservoA.attach(3);  //  Control waist (A) port number is   3    
  myservoA.write(90);  //  set 90°
  delay(1000);
  myservoB.attach(5);  //  Control lorearm（B）port number is 5  
  myservoB.write(0);   //  set 0°  set servoB and servoC angle carefully because they will interfere when they turn contrary
  delay(1000);  
  myservoC.attach(6);  //  Control  Forearm（C）port number is 6
  myservoC.write(120); //  set 120° set servoB and servoC angle carefully because they will interfere when they turn contrary
  delay(1000);
  myservoD.attach(9);  // Control Forearm rotation (D) port number is 9
  myservoD.write(90);  //  set 90°
  delay(1000);
  myservoE.attach(10); // Control wrist（E）port number is 10 wrist
  myservoE.write(90);  //  set 90°
  delay(1000);
  myservoF.attach(11); // Control wrist rotation (F) port number is 11
  myservoF.write(90);  //  set 90°
  delay(1000);
}

int de(int a,int b)//get Absolute value
{
return (a-b)>0?(a-b):(b-a);
}


void setup() 
{ 
  pinMode(13,INPUT);
  pinMode(12,INPUT);  
  Serial.begin(9600); //set serial
  servosetup();
}

void loop() 
{ 
  while (Serial.available() > 0)  //read and storage serial data
    {
        mycommand += char(Serial.read());
        delay(2);
    }
   if(mycommand!="")  //show serial command which is entered
   {
    Serial.println(mycommand);     
   }
   for(int m=0;m<mycommand.length();m++)  
  {
    char ch = mycommand[m];   //Read serial data
    switch(ch)
    {
      case '0'...'9':
      v = v*10 + ch - '0';   //Character conversion to decimal
      break;
      
      case 'a':             //If you post data with b, it means that the second servo data, such as serial port a90(must use "a")
      if(v >= 10 || v <= 170 )
      {  
        angleA=myservoA.read();  
        myspeed=10*de(v,angleA); //turn 1° during 10 machine cycle time. more machine cycle time,turn slower
        for(pos = 0; pos <=myspeed; pos += 1)  
        {                                
          myservoA.write(int(map(pos,1,myspeed,angleA,v)));
          delay(1);                       
        }
      }
      v = 0;
      break;

      case 'b':   
      if(v >= 0 || v <= 120 )
      {
        angleB=myservoB.read();
        myspeed=10*de(v,angleB);
        for(pos = 0; pos <=myspeed; pos += 1)  
        {                                
          myservoB.write(int(map(pos,1,myspeed,angleB,v)));
          delay(1);                       
        }
      }
      v = 0;              
      break;
      
      case 'c':   
      if(v >= 30 || v <= 120 )
      {
        angleC=myservoC.read();
        myspeed=10*de(v,angleC);
        angleC=myservoC.read();
        for(pos = 0; pos <=myspeed; pos += 1)  
        {                                
          myservoC.write(int(map(pos,1,myspeed,angleC,v)));
          delay(1);                       
        }
      }  
      v = 0;
      break;
      
      case 'd':  
      if(v >= 10 || v <= 170 )
      {
        angleD=myservoD.read();
        myspeed=10*de(v,angleD);
        angleD=myservoD.read();
        for(pos = 0; pos <=myspeed; pos += 1)  
        {                                
          myservoD.write(int(map(pos,1,myspeed,angleD,v)));
          delay(1);                       
        }
      } 
      v = 0;
      break;
      
      case 'e':  
      if(v >= 10 || v <= 170 )
      {
        angleE=myservoE.read();
        myspeed=10*de(v,angleE);
        angleE=myservoE.read();
        for(pos = 0; pos <=myspeed; pos += 1)  
        {                                
          myservoE.write(int(map(pos,1,myspeed,angleE,v)));
          delay(1);                       
        }
      } 
      v = 0;
      break;
      
      case 'f':  
      if(v >= 10 || v <= 170 )
      {
        angleF=myservoF.read();
        myspeed=10*de(v,angleF);
        angleF=myservoF.read();
        for(pos = 0; pos <=myspeed; pos += 1)  
        {                                
          myservoF.write(int(map(pos,1,myspeed,angleF,v)));
          delay(1);                       
        }
      } 
      v = 0;
      break;
      case 'z': 
      servosetup();
      break;
    }
   } 
   mycommand=""; //clean command
}
