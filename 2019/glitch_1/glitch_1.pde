PImage image;
int x1 = -10;
int x2 = 10;
int y1 = -10;
int y2 = 10;

void setup()
{
  image = loadImage("lis.jpg");
  surface.setSize(image.width, image.height);
}

void draw()
{
  noStroke();
  image.loadPixels();
  for (int i = 0; i < image.pixels.length; i += 1)
  {
    color c1 = image.pixels[i];

    int r1 = i + int(random(x1, x2)); if (r1 < 0) r1 -= x1;
    int r2 = i + width * int(random(y1, y2)); if (r2 < 0) r2 -= width * y1;
    color c2 = image.pixels[r1 % image.pixels.length];
    color c3 = image.pixels[r2 % image.pixels.length];

    // float r = .33 * (red(c1) + green(c2) + blue(c3));
    // float g = .33 * (green(c1) + blue(c2) + red(c3));
    // float b = .33 * (blue(c1) + red(c2) + green(c3));

    float r = .25 * (red(c1) + red(c2) + red(c3)) + i / random(500, 505);
    float g = .25 * (green(c1) + green(c2) + green(c3)) + i / random(500, 505);
    float b = .25 * (blue(c1) + blue(c2) + blue(c3)) + i / random(500, 505);

    r = r % 255;
    g = g % 255;
    b = b % 255;
    stroke(r, g, b);

    point(i % width, i / width);
  }

  image.updatePixels();
  noLoop();
}