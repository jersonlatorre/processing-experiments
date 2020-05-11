import processing.sound.*;
SoundFile sistole;
SoundFile diastole;

int i = 1;
int N = 20;
int L;
int F = 14;
int SIZE = 900;

PImage heart;
PImage word;

Word revolution;

void setup()
{
  size(800, 800);
  noStroke();
  colorMode(HSB);
  imageMode(CENTER);
  L = width / N;
  background(255);

  revolution = new Word();
  
  surface.setTitle("beat");
  surface.setResizable(true);

  heart = loadImage("heart.png");
  word = loadImage("word.png");
  sistole = new SoundFile(this, "sistole.wav");
  diastole = new SoundFile(this, "diastole.wav");
}

void draw()
{
  float d = dist(revolution.x, revolution.y, width / 2, height / 2);
  int r = int(map(d, 0, width / 2, 40, 12));
  if (d > width / 2) r = 12;
  if (r > 0) frameRate(r);


  surface.setSize(SIZE, SIZE);

  i++;
  if (i > F) {
    i = 2;
  }
  
  float s = SIZE / 800.0;
  noStroke();
  fill(255, 130);
  rect(width / 2, height / 2, width, height);

  scale(s);
  int sat = int(map(abs(revolution.y - width / (2 * s)), width / 2, 0, 0, 255));
  rectMode(CENTER);
  fill(180);
  noStroke();

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      float x = i * L + 0.5 * L;
      float y = j * L + 0.5 * L;
      circle(x, y, 3.5);
    }
  }

  noFill();
  float c = map(i, 3, 11, 0, 255);
  stroke(c, sat, sat / 2 + 150);
  strokeWeight(40);
  if (i < 11) square(width / (2 * s), height / (2 * s), 2 * i * L);

  noStroke();
  fill(255);
  square(width / (2 * s), height / (2 * s), 130);

  push();
  if (i == 12) sistole.play();
  if (i == 2) diastole.play();

  println(sat);
  tint(255, sat, sat + 180);
  if (i > 11) {
    image(heart, width / (2 * s), height / (2 * s), 80, 80);
  }
  else {
    image(heart, width / (2 * s), height / (2 * s), 100, 100);
  }
  pop();

  revolution.draw();
  
  // saveFrame("frames/frame-####.png");
}
