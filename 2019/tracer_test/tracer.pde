class Tracer
{
  ArrayList<PVector> points = new ArrayList<PVector>();
  public int size;
  
  public Tracer(int size)
  {
    this.size = size;
  }
  
  public void add(float x, float y)
  {
    points.add(new PVector(x, y));
    if (points.size() >= size)
    {
      points.remove(points.get(0));
    }
  }
  
  public void draw()
  {
    beginShape();
    //noFill();
    fill(frameCount % 255, 255, 255);
    //noStroke();
    stroke(0);
    strokeWeight(2);
    
    for (PVector point : points)
    {
      curveVertex(point.x, point.y);  
    }
    
    endShape(CLOSE);
  }
} //<>//
