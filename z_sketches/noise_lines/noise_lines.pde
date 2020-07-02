import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;

PVector[][] points;

float N = 30;

void setup()
{
  size(600, 600, P3D);
  colorMode(HSB);
  fx = new PostFX(this);
  background(0);
}

void draw()
{
  fill(0, 10);
  noStroke();

  rect(0, 0, width, height);

  createLines();
  drawLines();

  fx.render().blur(2, 2).compose();
}

void createLines()
{
  points = new PVector[5][int(N)];
   
  for (int i = 0; i < 5; i++)
  {
    points[i] = new PVector[int(N)];

    for (int j = 0; j < N; j++)
    {
      float noise = -1 + 2 * noise(millis() / 500.0 , i / 5.0, j / 10.0);
      points[i][j] = new PVector(j * width / (N - 1), 100 + 100 * i + 70 * noise);
    }
  }
}

void drawLines()
{
  for (int i = 0; i < 5; i++)
  {
    stroke(colors[i]);
    strokeWeight(50);
    beginShape();

    curveVertex(0, 100 + 100 * i);

    for (int j = 0; j < N; j++)
    {
      PVector p1 = points[i][j];
      curveVertex(p1.x, p1.y);
    }

    curveVertex(width, 100 + 100 * i);

    endShape();
  }
}
