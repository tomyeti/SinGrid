class Ball
{
  //x and y position (origin is top left)
  float x = 10;
  float y = 10;
  //we're using HSB to color the circles (hue, saturation, brightness)
  //im holding onto these values in case you want to change them with
  //the sin wave
  float hsbColor = 0; //Hue
  float hsbSat = 100; //Saturation
  float hsbBright = 255; //Brightness
  //values the ball needs to hold onto
  float increment = 1;
  float minScale = 1;
  float maxScale = 10;
  float variance = 9;
  float minBrt = 0;
  float maxBrt = 10;
  float colorVariance = 10;
  float degree = 1;
  //basically pixel value size, 1 is 1 pixel wide
  float scaleX = 1;
  float scaleY = 1;
  
  Ball()
  {
     
  } 
  
  
  void draw()
  {
    //set the colormode, remove stroke, set fill
    colorMode(HSB);
    noStroke();
    fill(hsbColor, hsbSat, hsbBright);
    ellipse(x, y, scaleX, scaleY);
    
    
  }
  
  
  void undulate()
  {
    //MATH!
    degree += increment;
    float sinVal = (float)Math.sin(degree * Math.PI / 180);
    scaleX = minScale + (variance * 0.5f) + (variance * 0.5f) * sinVal;
    scaleY = scaleX;
    float brightness = minBrt + (0.5f * colorVariance) + (0.5f * colorVariance) * sinVal;
    //set different HSB values to brightness for cool color effects
    //play around with this!
    //hsbBright = brightness;
    hsbColor = brightness ;
    
  }
  
  
}
