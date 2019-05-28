ArrayList<PVector> poisson;

void setup()
{
  size(800, 800);
  poisson = poissonDiskSampling(220, 30);
}

void draw()
{
  background(255);
  
  for (int i = 0; i < poisson.size(); i++)
  {
    octopus(poisson.get(i).x, poisson.get(i).y);
  }
}

void octopus(float x, float y)
{
  strokeWeight(4);
  noFill();
  stroke(0);
  float r = random(100, 140);
  circle(x, y, r);

  for (int j = 0; j < int(random(1, 4)); j++)
  {
    float angle = random(0, 2 * PI);
    float xx = x + 0.5 * r * cos(angle);
    float yy = y + 0.5 * r * sin(angle);
    strokeWeight(5);
    stroke(255);
    circle(xx, yy, 9);
  }

  float ran = random(1);

  
  {
    strokeWeight(4);
    noFill();
    stroke(0);

    float rr = random(80, 120);

    float offsetX = random(15, 30);
    float offsetY = random(30, 50);

    circle(x + offsetX, y + offsetY, rr);

    for (int j = 0; j < int(random(1, 3)); j++)
    {
      float angle = random(0, 2 * PI);
      float xx = x + offsetX + 0.5 * rr * cos(angle);
      float yy = y + offsetY + 0.5 * rr * sin(angle);
      strokeWeight(5);
      stroke(255);
      circle(xx, yy, 9);
    }
  }

  if (ran < 0.5)
  {
    strokeWeight(4);
    noFill();
    stroke(0);

    float rr = random(80, 120);

    float offsetX = random(15, 30);
    float offsetY = random(30, 50);

    circle(x + offsetX, y + offsetY, rr);

    for (int j = 0; j < int(random(1, 3)); j++)
    {
      float angle = random(0, 2 * PI);
      float xx = x + offsetX + 0.5 * rr * cos(angle);
      float yy = y + offsetY + 0.5 * rr * sin(angle);
      strokeWeight(5);
      stroke(255);
      circle(xx, yy, 9);
    }
  }

  noLoop();
}
