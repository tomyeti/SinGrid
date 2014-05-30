
//Code written by Tom Sterkenburg
//tomsterk.com
//do whatever you want with it

//number of balls across
float across = 40;
//number of balls down
float down = 30;
float total = across * down;

//horizontal spacing
float hsp = 20;
//vertical spacing
float vsp = 20;
//increment of the sin wave
float degreeInc = 360 / total;
//increase the oscillations to create different effects of the grid
float numberOfOscillations = 1;
//how quickly along the sin wave we move
float increment = 5;
//min and max size for each ball
float minScale = 3;
float maxScale = 54;
//min and max brightness for each ball (or color if you want)
float minBrt = 1;
float maxBrt = 255;
//used for creating the grid
float row = 0;
float column = 0;
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup()
{
  size(1200,800, P2D);
  
  createBalls();
  
  
  
}
//draw is our update function, processing calls it every frame
void draw()
{
  background(0);
  
  for (int i = 0; i < balls.size(); i++)
  {
    balls.get(i).draw();
    balls.get(i).undulate();
  }
  
}

void createBalls()
{
  row = 0;
  column = 0;
  for (int i = 0; i < total; i++)
  {
    Ball ball = new Ball();
    ball.x = 100 + column * vsp;
    ball.y = 100 + row * vsp;
    float offset = Math.abs(total / 2 - i);
    ball.increment = increment;
    ball.minScale = minScale;
    ball.maxScale = maxScale;
    ball.variance = ball.maxScale - ball.minScale;
    ball.minBrt = minBrt;
    ball.maxBrt = maxBrt;
    ball.colorVariance = ball.maxBrt - ball.minBrt;
    ball.degree = i * degreeInc * numberOfOscillations;
    balls.add(ball);
    column++;
    if (column == across)
    {
       column = 0;
       row++; 
    }
  }
  
}

void destroyBalls()
{
  balls = new ArrayList<Ball>();
}
void keyPressed()
{
  numberOfOscillations++;
  destroyBalls();
  createBalls();
  println(numberOfOscillations);
}



