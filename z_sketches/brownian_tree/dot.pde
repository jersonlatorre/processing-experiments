class Dot
{
  float x = 0;
  float y = 0;
  float d = 1;
  float minDistance;
  public boolean isDie = false;
  
  public Dot(float x, float y, float d, float m)
  {
    this.x = x;
    this.y = y;
    this.d = d;
    this.minDistance = m;
  }
  
  public void update()
  {
    if (isDie) return;
    x += random(-d, d);
    y += random(-d, d);
  }
  
  public void draw()
  {
    noStroke();
    fill(255, 90);
    //if (!isDie) circle(x, y, 5);
  }
  
  public void die()
  {
    isDie = true;
  }
}
