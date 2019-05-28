float offset = 0;

void setup()
{
  size(800, 800, P3D);
  background(0);
  noStroke();
  colorMode(HSB);
}

void draw()
{
  fill(0, 16);
  rect(0, 0, width, height);

  pushMatrix();
  
  translate(400, 400);
  offset += PI / 200;
  
  for (int i = 0; i < 80; i++)
  {
    float r = 0 + 34 * .5 * (sin(millis() / 500.0) + 1) * sqrt(i);
    r = 30 * sqrt(i);
    float angle = 137.508 * i * PI / 180 + offset;
    float x = r * cos(angle);
    float y = r * sin(angle);
    fill(map(r, 255, 0, 0, 255), map(r, 400, 0, 150, 255), 255);
    float rr = map(r, 0, 400, 2, 50);
    ellipse(x, y, rr, rr);
  }

  popMatrix();

  // saveFrame("frames/hola-###.png");
}
