float size;

ArrayList<Square> squares = new ArrayList<Square>();

void setup()
{
  size(600, 600);
  size = width / (3 * 5);
  
  squares.add(new Square(width / 3 + 0, height / 3 + 0));
  squares.add(new Square(width / 3 + 2 * size, height / 3 + 0));
  squares.add(new Square(width / 3 + 4 * size, height / 3 + 0));
  
  squares.add(new Square(width / 3 + 0, height / 3 + 2 * size));
  squares.add(new Square(width / 3 + 2 * size, height / 3 + 2 * size));
  squares.add(new Square(width / 3 + 4 * size, height / 3 + 2 * size));
  
  squares.add(new Square(width / 3 + 0, height / 3 + 4 * size));
  squares.add(new Square(width / 3 + 2 * size, height / 3 + 4 * size));
  squares.add(new Square(width / 3 + 4 * size, height / 3 + 4 * size));
}

void draw()
{
  fill(255);
  noStroke();
  square(0, 0, width);
  
  for (Square square : squares)
  {
    square.draw();
  }
}

void mousePressed()
{
  for (Square square : squares)
  {
    square.onMousePressed();
  }
}

void mouseMoved()
{
  boolean hand = false;
  
  for (Square square : squares)
  {
    hand = hand || square.onMouseMoved();
  }
  
  if (hand) cursor(HAND);
  else cursor(ARROW);
}
