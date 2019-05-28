class Explosion
{
  float t = 1;
  
  Explosion()
  {
  }
  
  void draw()
  {
    t *= 2.5;
    fill(100, 1000 - t);
    noStroke();
    ellipse(0, 0, t, t);
  }
}
