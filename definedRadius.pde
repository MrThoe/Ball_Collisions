class Ball {
  
  float x;
  float y;
  float Vx;
  float Vy;
  float radius;
  
  //no arument constructor
  Ball(){
    x = random(width);
    y = random(height);
    Vx = random(-6,6);
    Vy = random(-6,6);
    radius = 10;
  }
  
  //single argument constructor (radius)
  Ball(float theRadius){
    x = random(width);
    y = random(height);
    Vx = random(-6,6);
    Vy = random(-6,6);
    radius = theRadius;
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
    circle(x,y, radius);
  }
  
  boolean checkBall(Ball b)
  {
    float d = sqrt(pow((b.x - x),2) + pow((b.y - y),2));
    if(d < (radius + b.radius))
    {
      return true;
    } else {
      return false;
    }
  }
}
