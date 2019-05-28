class Square
{
  float x;
  float y;
  boolean isMouseOver = false;
  color[] colors = { #ff0000, #00ff00, #0000ff };
  int index;
  
  Square(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void draw()
  {
    noStroke();
    fill(colors[index]);
    square(x, y, size);
    
    if (isMouseOver)
    {
      noFill();
      stroke(60);
      strokeWeight(2);
      square(x, y, size);
    }
  }
  
  public void onMousePressed()
  {
    if (mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size)
    {
      index++; if (index == 3) index = 0;
    }
  }
  
  public boolean onMouseMoved()
  {
    if (mouseX > x && mouseX < x + size && mouseY > y && mouseY < y + size)
    {
      isMouseOver = true;
    }
    else
    {
      isMouseOver = false;
    }
    
    return isMouseOver;
  }
}
