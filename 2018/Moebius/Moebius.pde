import peasy.*;

PeasyCam cam;

ArrayList<PVector> points;
float U = 251.0;
float V = 51.0;

void setup()
{
  size(500, 500, P3D);
  colorMode(HSB);
  strokeWeight(5);

  cam = new PeasyCam(this, 500);
  
  points = new ArrayList<PVector>();
  // float r = 2 + 60 * .5 * (1 + sin(millis() / 1000.0));
  float r = 100;
  
  for (float u = 0; u <= 2 * PI; u += PI / U)
  {
    for (float v = -.5; v <= .5; v += 1 / V)
    {
      float x = r * (1 + .5 * v * cos(.5 * u)) * cos(u);
      float y = r * (1 + .5 * v * cos(.5 * u)) * sin(u);
      float z = r * v * .5 * sin(.5 * u);
      points.add(new PVector(x, y, z));
    }
  }
}

void draw()
{
  background(0);
  // translate(width / 2, height / 2);
  
  // rotateY(millis() / 1000.0);
  
  for (int i = 0; i < points.size(); i++)
  {
    stroke(255);
    PVector p1 = points.get(i);
    stroke(map(i, 0, points.size(), 0, 255), 255, 255);
    strokeWeight(30);
    point(p1.x, p1.y, p1.z);
  }

  
}
