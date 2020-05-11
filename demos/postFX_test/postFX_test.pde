import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;

float angle = 0;

void setup()
{
  size(800, 800, P3D);
  background(0);
  colorMode(HSB);
  smooth(4);
  
  fx = new PostFX(this);
}

void draw()
{
  fill(255, 0, 0, 50);
  strokeWeight(2);
  background(255);
  angle += 0.01;
  translate(width / 2, height / 2);
  rotateX(angle);
  rotateZ(angle);
  
  int N = 10;

  for (int i = 0; i < N; i++)
  {
    stroke(255 * i / N, 255, 255);
    box(40 + i * 4);
  }

  fx.render()
    .noise(.2, .1)
    .pixelate(200)
    .sobel()
    .blur(5, 5)
    .chromaticAberration()
    .rgbSplit(100)
    .bloom(0.2, 50, 30)
    .vignette(.5, .2)
    .compose();
}
