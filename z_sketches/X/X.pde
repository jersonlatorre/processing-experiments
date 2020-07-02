int N = 100;
float maxR = 140;
float minR = 100;
float timeFactor = 1.2;
float leafs = 4;
Tracer tracer = new Tracer(10);

void setup()
{
  size(600, 600);
  colorMode(HSB);
  blendMode(DIFFERENCE);
  background(255);
}

void draw()
{
  fill(255, 30);
  noStroke();
 
  //rect(0, 0, width, height);

  float r = maxR + minR * sin(leafs * timeFactor * 2 * PI * frameCount / N);

  //println(sin(2 * PI * frameCount / N));

  float px = 300 + r * cos(timeFactor * 2 * PI * frameCount / N);
  float py = 300 + r * sin(timeFactor * 2 * PI * frameCount / N);
  tracer.size = min(frameCount / 2, 12);
  //println(tracer.size);
  tracer.add(px, py);

  tracer.draw();

  fill(0);
  fill(255);
  stroke(0);
  strokeWeight(2);
  circle(px, py, 5);
}
