ArrayList<String> letras = new ArrayList<String>();
PFont font;
PImage mouse;

int N = 15;

void setup()
{
  size(1000, 1000, P3D);
  textAlign(CENTER, CENTER);
  font = createFont("Zag Bold.otf", 100);
  textFont(font);

  mouse = loadImage("mouse.png");
  noCursor();

  for (int i = 0; i < N * N; i++)
  {
    float r = random(1);
    if (r < 0.25) letras.add("P");
    else if (r < 0.5) letras.add("L");
    else if (r < 0.75) letras.add("U");
    else letras.add("G");
  }
}

void draw()
{
  background(0);
  fill(255);
  noStroke();
  
  for (int i = 0; i < N; i++)
    for (int j = 0; j < N; j++)
    {
      push();
      float x = i * width / N + 0.5 * width / N;
      float y = j * width / N + 0.5 * width / N;
      float d = dist(mouseX, mouseY, x, y);
      float size = map(d, 0, width * sqrt(2), width / 20.0, width / 200.0);
      float rotation = atan2(mouseY - height / 2, mouseX - width / 2);
      float brightness = map(d, 0, width * sqrt(2), 255, 0);
      fill(brightness, brightness);
      textSize(size);
      translate(x, y);
      rotate(rotation);
      text(letras.get(i * N + j), 0, 0);
      pop();
    }

  image(mouse, mouseX - 12, mouseY);
}
