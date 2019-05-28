import processing.video.*;
import peasy.*;
Capture webcam;
PeasyCam camera;

void setup()
{
  background(0);
  size(800, 800, P3D);
  
  webcam = new Capture(this, 640, 480, 30);
  webcam.start();
  // noStroke();
  // stroke(255);
  ortho();
  
  camera = new PeasyCam(this, width);
}

void draw()
{
  background(255);
  
  translate(-640 / 2, 40 - 480 / 2);

  if (webcam.available())
  {
    webcam.read();
  }
  
  //image(cam, 0, 0);
  int n = 3;
  webcam.loadPixels();
  for (int i = 0; i < 640 * 480; i++)
  {
    int x = i % 640;
    int y = int(i / 640.0);
    float b;
    if (x % n != 0 || y % n != 0) continue;
    
    fill(webcam.pixels[i]);
      pushMatrix();
      b = brightness(webcam.pixels[i]);
      translate(x, y, 10 * b);
      if (b < 30) box(3);//ellipse(0, 0, 2, 2);
      popMatrix();
    
    /*if (blue(webcam.pixels[i]) < 100)
    {
      fill(0);
      pushMatrix();
      translate(x, y, 0);
      ellipse(0, 0, 6, 6);
      popMatrix();
      //rect(x - n / 2, y - n / 2, n, n);
    }
    else
    {
      fill(255, 220, 0);
      pushMatrix();
      translate(x, y, -100);
      ellipse(0, 0, 6, 6);
      popMatrix();
    }*/
  }
  webcam.updatePixels();
  
  // saveFrame("test-3/bm-####.tga");
}
