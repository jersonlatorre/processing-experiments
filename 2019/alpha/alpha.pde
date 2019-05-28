PGraphics canvas;

void setup()
{
  size(800, 800);
  surface.setTitle("-- x --");
  canvas = createGraphics(800, 800);
}

void draw()
{
  canvas.beginDraw();
  canvas.background(0, 0);
  canvas.noFill();
  canvas.strokeWeight(5);
  for (int i = 0; i < 10; i++)
  {
    int r = 10 * int(random(600) / 10);
    canvas.arc(width / 2, height / 2, r, r, random(0, PI), random(PI, 2 * PI));
  }
  canvas.save("hola.png");
  canvas.endDraw();

  image(canvas, 0, 0);
  noLoop();
}
