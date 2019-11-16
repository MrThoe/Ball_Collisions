/** This program will do simple balls colliding with each other 
  * Collisions are simply to reverse direction and do not use any physics
  * Tester method for class Ball
  * Author: Allen Thoe
  * Date: 11/16/2019
  * @Param: Ball, (Class below) x, y, Vx, Vy
  */

Ball[] b = new Ball[20];

void setup(){
  size(800,800);
  for (int i = 0; i < b.length; i++)
  {
    b[i] = new Ball();
  }  
}

void draw(){
  background(0);
  for (int i = 0; i < b.length; i++)
  {
    b[i].show();
    b[i].update();
    b[i].checkWalls();
  }
  for (int i = 0; i < b.length; i++)
  {
    for (int j = 0; j < b.length; j++)
    {
      if(i != j )
      {
        if(b[i].checkBall(b[j]))
        {
          b[i].Vx *= -1;
          b[i].Vy *= -1;
        }
      }
    }
  }  
}


class Ball {
  
  float x;
  float y;
  float Vx;
  float Vy;
  
  Ball(){
    x = random(width);
    y = random(height);
    Vx = random(-6,6);
    Vy = random(-6,6);
  }
  
  void checkWalls(){
    if(x>width || x < 0)
    {
      Vx *= -1;
    }
    if(y>height || y < 0)
    {
      Vy *= -1;
    }
  }
  
  void update()
  {
    x += Vx;
    y += Vy;
  }
  
  void show()
  {
    circle(x,y, 30);
  }
  
  boolean checkBall(Ball b)
  {
    float d = sqrt(pow((b.x - x),2) + pow((b.y - y),2));
    if(d < 30)
    {
      return true;
    } else {
      return false;
    }
  }
}
