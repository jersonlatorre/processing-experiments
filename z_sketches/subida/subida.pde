PFont font;
ArrayList<Line> lines = new ArrayList<Line>();
Text text = new Text();

import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

PostFX fx;

void setup()
{
  size(540, 960, P3D);
  colorMode(HSB);
  smooth(4);
  blendMode(ADD);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  font = createFont("Zag Bold.otf", height / 10);
  textFont(font);

  fx = new PostFX(this);

  create();
}

void mousePressed()
{
  create();
}

void create()
{
  lines = new ArrayList<Line>();

  // create lines
  for (int i = 0; i < width / 10; i++)
  {
    Line line = new Line(i * 10, random(height));
    lines.add(line);

    line = new Line(i * 10, random(height));
    lines.add(line);
  }
}

void draw()
{
  // scale(0.4);
  background(0);

  // líneas 
  for (Line line: lines)
  {
    line.draw();
  }

  text.draw();

  fx.render()
    .bloom(0.4, 50, 30)
    .compose();

  // if (frameCount > 1) saveFrame("frames/frame_###.png");
  // if (frameCount == 101) exit();
}