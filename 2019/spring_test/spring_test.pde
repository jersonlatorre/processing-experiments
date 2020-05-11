float springDx, springDy;
float seekX, seekY;
float springX, springY;

void setup()
{
  size(600, 600);
  noStroke();
}

void draw()
{
  background(0);
  
  springDx = lerp(springDx, (mouseX - springX) * 0.5, 0.2);
  springDy = lerp(springDy, (mouseY - springY) * 0.5, 0.2);
  springX += springDx;
  springY += springDy;
  circle(springX, springY, 30);
  
  //seekX = lerp(seekX, mouseX, 0.1);
  //seekY = lerp(seekY, mouseY, 0.1);
  //circle(seekX, seekY, 30);
}
