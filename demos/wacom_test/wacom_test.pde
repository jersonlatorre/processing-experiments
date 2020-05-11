import codeanticode.tablet.*;
Tablet tablet;

int c = 0;

void setup()
{
  size(800, 800);
  tablet = new Tablet(this);
  
  // cambia el color del fondo
  background(0);
  colorMode(HSB);
}

void draw()
{
  //noStroke();
  stroke(c, 255, 255);
  float p = tablet.getPressure();
  strokeWeight(p * p * 10);
  
  if (mousePressed)
  {
    c++;
    c = c % 255;
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void keyPressed()
{
  background(0);
}
