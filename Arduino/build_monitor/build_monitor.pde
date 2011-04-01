struct rgb { 
  int red, green, blue;
} incomingColor, ledPin = {3, 5, 6};

int lastByteRecieved = 0;
int numberOfBytesRecieved = 0;

void setPinsForOutput()
{
  pinMode(ledPin.red, OUTPUT);
  pinMode(ledPin.green, OUTPUT);
  pinMode(ledPin.blue, OUTPUT);
}
  
void setColor(struct rgb *color)
{
  analogWrite(ledPin.red, 255 - color->red);
  analogWrite(ledPin.green, 255 - color->green);
  analogWrite(ledPin.blue, 255 - color->blue);
}

void updateIncomingColor() 
{
    if(numberOfBytesRecieved == 0) 
    { 
      incomingColor.red = lastByteRecieved;
    }
    
    if(numberOfBytesRecieved == 1)
    {
      incomingColor.green = lastByteRecieved;
    }
    
    if(numberOfBytesRecieved == 2)
    {
      incomingColor.blue = lastByteRecieved;
    }
}

void updateCountOfRecievedBytes()
{
    if(numberOfBytesRecieved == 2)
    {
      numberOfBytesRecieved = 0;
    }
    else
    {
      numberOfBytesRecieved++;  
    }
}

void updateCurrentColor()
{
  if(numberOfBytesRecieved == 2)
  {
    setColor(&incomingColor);
  }
}
  
void recieveNewColor()
{
  if(Serial.available() > 0) 
  {
    lastByteRecieved = Serial.read();
    updateIncomingColor();
    updateCountOfRecievedBytes();
    updateCurrentColor();
  }
}

void setup(){
  setPinsForOutput();
  Serial.begin(9600);
}

void loop() 
{ 
  recieveNewColor();
}

