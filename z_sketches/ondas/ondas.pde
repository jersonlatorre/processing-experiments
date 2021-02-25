ArrayList<PVector> puntos = new ArrayList<PVector>();
ArrayList<Letra> letras = new ArrayList<Letra>();
float n;
float w;
float offset = 0;
char[] plug = {'P', 'L', 'U', 'G'};
PGraphics g1;
PGraphics g2;

PFont font;

void setup()
{
  size(800, 800);
  noStroke();

  font = createFont("Zag Bold.otf", 20);
  textFont(font);
  textAlign(CENTER, CENTER);

  n = width / 20.0;
  w = height / 25.0;

  int i;

  for (i = 0; i <= n; i++)
  {
    puntos.add(new PVector(i * width / n, height / 2));
  }

  ArrayList<PVector> poisson = poissonDiskSampling(60, 30);

  for (i = 0; i < poisson.size(); i++)
  {
    letras.add(new Letra(plug[int(random(4))], poisson.get(i).x, poisson.get(i).y));
  }

  g1 = createGraphics(width, height);
  g2 = createGraphics(width, height);
}

void draw()
{
  surface.setTitle(str(int(frameRate)));

  background(0);
  blendMode(BLEND);

  offset += .035;
  g1.beginDraw();
  g1.background(0);

  blendMode(ADD);

  for (Letra letra: letras)
  {
    letra.draw();
  }

  blendMode(BLEND);
  fill(0);
  noStroke();
  ellipse(width / 2, height / 2, width / 2 + 20, height / 2 + 20);

  for (int i = 0; i < puntos.size() - 1; i++)
  {
    PVector puntoA = puntos.get(i);
    PVector puntoB = puntos.get(i + 1);

    puntoA.y = height  / 2 + height / 9 * sin(offset + 3 * i / n);
    puntoB.y = height  / 2 + height / 9 * sin(offset + 3 * (i + 1) / n);

    for (int j = 0; j < 25; j++)
    {
      g1.fill(colors[j % 5]);
      g1.noStroke();
      g1.beginShape();
      g1.vertex(puntoA.x, puntoA.y + j * 0.05 * width - height / 1.49 + 10 * noise(i / 100.0, millis() / 1000.0));
      g1.vertex(puntoB.x, puntoB.y + j * 0.05 * width - height / 1.49 + 10 * noise(i / 100.0, millis() / 1000.0));
      g1.vertex(puntoB.x, puntoB.y + j * 0.05 * width - height / 1.49 + w + 10 * noise(i / 100.0, millis() / 1000.0));
      g1.vertex(puntoA.x, puntoA.y + j * 0.05 * width - height / 1.49 + w + 10 * noise(i / 100.0, millis() / 1000.0));
      g1.endShape();
    }
  }

  g1.endDraw();

  g2.beginDraw();
  g2.background(0);
  g2.ellipse(width / 2, height / 2, width / 2, height / 2);
  g2.endDraw();

  g1.mask(g2);
  image(g1, 0, 0);

  noFill();
  stroke(255);
  strokeWeight(5);
  ellipse(width / 2, height / 2, width / 2 + 20, height / 2 + 20);

  // saveFrame("frames/frame-###.png");

  if (frameCount == 450) exit();
}
