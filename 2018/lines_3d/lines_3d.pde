
import peasy.*;

PImage img;
color col;
int c;

PeasyCam cam;

int space = 8; // space between lines
float weight = 2; // line weight
float depth = .6; // z depth

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 750);
  img = loadImage("polo.jpg");
  img.resize(600, 600);
}

void draw()
{
  background(0);
  lights();
  translate(-width / 2, -height / 2);
  strokeWeight(weight);

  for (int i = 0; i < img.width; i += space)
  {
    beginShape();
    
    for (int j = 0; j < img.height; j += space)
    {
      // c = i + (j * img.width);
      // col = img.pixels[c];
      // fill(red(col), green(col), blue(col), 255);
      // noStroke();
      // pushMatrix();
      // translate(i, j, 0);
      // scale(1, 1, depth * brightness(col) / 255.0);
      // box(weight);
      // popMatrix();

      c = i + (j * img.width);
      col = img.pixels[c];
      stroke(red(col), green(col), blue(col), 255);
      noFill();
      vertex (i, j, (depth * brightness(col)));
    }
    
    endShape();
  }
}

// void keyPressed()
// {
//   saveFrame("frame-###.png");
// }
