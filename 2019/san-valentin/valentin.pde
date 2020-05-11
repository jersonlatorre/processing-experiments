PShape heart;
float border = 80;
float num = 6;
float scale = 0.27;
int seed = 12;
float t = 0;

void setup()
{
  size(800, 800);
  heart = loadShape("heart.svg");
  shapeMode(CENTER);
  background(0);
  noStroke();
  frameRate(30);
  surface.setTitle("{ hearts }");
}

void draw()
{
  background(0);
  
  randomSeed(seed);

  for (int i = 0; i < num; i++)
    for (int j = 0; j < num; j++)
    {
      push();
      translate(border + i * (width - 2 * border) / (num - 1), border + j * (width - 2 * border) / (num - 1));
      scale(scale * (8 + sin(t + random(2))));
      rotate(random(-1, 1));
      shape(heart, random(-4, 4), random(-4, 4));
      // shape(heart, 0, 0);
      pop();
    }

  //saveFrame("frames/frame-###.png");
  t += 0.35;
  //if (t >= 40 * PI) noLoop();
}
