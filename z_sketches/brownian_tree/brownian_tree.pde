ArrayList<Dot> dots = new ArrayList<Dot>();
ArrayList<Line> lines = new ArrayList<Line>();

PImage shape;

void setup()
{
  size(800, 800);
  colorMode(HSB);
  
  shape = loadImage("c.png");
  shape.resize(width, width);
  
  for (int i = 0; i < 30000; i++)
  {
    float x = random(width);
    float y = random(width);

    if (alpha(shape.get(int(x), int(y))) > 100)
    {
      Dot dot = new Dot(x, y, 1, 5);
      dots.add(dot);
    }
  }
  
  for (int i = 0; i < 3000; i++)
  {
    float x = random(width);
    float y = random(width);
    
    if (alpha(shape.get(int(x), int(y))) < 20)
    {
      Dot dot = new Dot(x, y, 10, 10);
      dots.add(dot);
    }
  }
  
  int n = 100;
  float l = 1200 / n;
  
  
  for (int i = 0; i < n; i++)
  {
    Dot dot;
    
    dot = new Dot(i * l, 0, 0, 10);
    dot.isDie = true;
    dots.add(dot);
    
    dot = new Dot(0, i * l, 0, 10);
    dot.isDie = true;
    dots.add(dot);
    
    dot = new Dot(i * l, width, 0, 10);
    dot.isDie = true;
    dots.add(dot);
    
    dot = new Dot(width, i * l, 0, 10);
    dot.isDie = true;
    dots.add(dot);
  }
}

void draw()
{
  background(255);
  calculate();
  for (Dot dot : dots) dot.draw();
  for (Line line : lines) line.draw();
  // saveFrame("frames/frame-####"); 
}

void calculate()
{
  for (Dot dot : dots)
  {
    dot.update();
    for (Dot aux : dots)
    {
      float d = dist(dot.x, dot.y, aux.x, aux.y);
      float m =  min(dot.minDistance, aux.minDistance);
      if (!dot.isDie && aux.isDie && d < m + 2 && d > m - 2)
      {
        lines.add(new Line(dot.x, dot.y, aux.x, aux.y));
        dot.die();
      }
    }
  }
}
