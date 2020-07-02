class Line
{
  float p1x;
  float p1y;
  float p2x;
  float p2y;
  
  public Line(float p1x, float p1y, float p2x, float p2y)
  {
    this.p1x = p1x;
    this.p1y = p1y;
    this.p2x = p2x;
    this.p2y = p2y;
  }
  
  public void draw()
  {
    float mx = (p1x + p2x) / 2;
    float my = (p1y + p2y) / 2;
    float d = dist(mx, my, width  / 2, width / 2);
    // float s = map(d, 0, width / 1.5, 1, 2);
    //float c = map(d, 0, width / 1.5, 0, 255);
    stroke(0);
    strokeWeight(1);
    line(p1x, p1y, p2x, p2y);
  }
}
