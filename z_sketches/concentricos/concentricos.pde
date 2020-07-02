float n = 10.0;
float logoSize;
float angle = 0;
float delta = 0.015;
float r1 = 0;
float r2 = 0;
float delay = 0;
int FLASH_DURATION = 3;
int flashDuration;
float counter = 0;

void setup()
{
  size(800, 800);
  smooth(8);
  logoSize = width / 10;
  generateRandoms();
  frameRate(30);
}

void draw()
{
  noStroke();

  if (counter >= delay)
  {
    counter = 0;
    flashDuration = FLASH_DURATION;
    generateRandoms();
  }

  if (flashDuration > 0)
  {
    flashDuration--;
    fill(255);
    rect(0, 0, width, height);
    // saveFrame("frames/frame-###.png");
    return;
  }

  counter += 1;
  logoSize += 3;
  n += 0.2;

  float rr = width * 1;
  float x = width / 2 + rr * noise(angle, r1) - rr / 2;
  float y = height / 2 + rr * noise(angle, r2) - rr / 2;
  angle += delta;

  for (int i = 0; i <= n; i++)
  {
    float cx = (x - width / 2) * i / n;
    float cy = (y - width / 2) * i / n;
    float r = map(i, 0, n, width * 1.42, logoSize);

    fill(colors[i % 5]);
    ellipse(cx + width / 2, cy + width / 2, r, r);

    cx = (x - width / 2) * i / n;
    cy = (y - width / 2) * i / n;
    r = map(i, 0, n, width * 1.42, logoSize);
  }
  
  float borderSize = logoSize / 10;
  fill(255);
  ellipse(x, y, logoSize, logoSize);
  fill(0);
  ellipse(x, y, logoSize - borderSize, logoSize - borderSize);
  fill(255);
  ellipse(x - (logoSize - borderSize) / 4, y, (logoSize - borderSize) / 6, (logoSize - borderSize) / 6);
  ellipse(x + (logoSize - borderSize) / 4, y, (logoSize - borderSize) / 6, (logoSize - borderSize) / 6);

  // saveFrame("frames/frame-###.png");
}

void generateRandoms()
{
  r1 = random(1, 10);
  r2 = random(11, 20);
  n = int(random(11, 20));
  n -= n % 5;
  delta = random(0.008, 0.022);
  logoSize = random(80, 300);
  delay = int(random(20, 80));
}
