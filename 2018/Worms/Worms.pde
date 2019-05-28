ArrayList<Worm> worms = new ArrayList<Worm>();
ArrayList<Explosion> explosions = new ArrayList<Explosion>();
int N_WORMS = 50;

void setup()
{
  size(800, 800, P3D);
  smooth(4);

  for (int i = 0; i < N_WORMS; i++)
  {
    worms.add(new Worm(random(100)));
  }
}

void draw()
{
  background(255);
  
  for (int a = -100; a <= 100; a++)
  {
    for (int b = -100; b <= 100; b++)
    {
      strokeWeight(3);
      stroke(240, 255, 255, 100);
      point(a * 40, b * 40, -800);
    }
  }
  
  translate(width / 2, height / 2, -10);

  for (int i = 0; i < N_WORMS; i++)
  {
    worms.get(i).draw();
  }
  
  for (Explosion explosion : explosions)
  {
    explosion.draw();
  }
  
  noFill();
  strokeWeight(1);
  stroke(255, 80);
}

void mouseClicked()
{
  explosions.add(new Explosion());
}
