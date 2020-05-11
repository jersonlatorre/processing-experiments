import processing.video.*;
import controlP5.*;

ControlP5 cp5;
CheckBox checkbox;

PGraphics canvas;
PGraphics mask;
PImage p1, p2, p3;

int tileSize = 12;
int variation = 0;
int radius;
int w, h, offsetX, offsetY;

Capture cam;

void setup() {
  size(800, 600, P3D);
  
  radius = (int)(height * 0.8);
  
  cp5 = new ControlP5(this);
  
  cp5.addSlider("tileSize")
    .setPosition(30, 30)
    .setRange(4, 100).setColorValue(255).setColorLabel(0);
     
  cp5.addSlider("variation")
    .setPosition(30, 50)
    .setRange(0, 10).setColorValue(255).setColorLabel(0);
     
  cp5.addSlider("radius")
    .setPosition(30, 70)
    .setRange(30, height * 0.8).setColorValue(255).setColorLabel(0);
     
  checkbox = cp5.addCheckBox("rotateTiles")
    .setPosition(30, 90)
    .setColorForeground(color(120))
    .setColorLabel(color(255))
    .setSize(15, 15)
    .setItemsPerRow(1)
    .setSpacingColumn(0)
    .setSpacingRow(0)
    .addItem("Rotation", 0).setColorValue(255).setColorLabel(0);
  
  cam = new Capture(this, width, height);
  cam.start();
  canvas = createGraphics(width, height, P3D);
  canvas.smooth(1);
  mask = createGraphics(width, height);
  
  
  p1 = loadImage("p1.png");
  p2 = loadImage("p2.png");
  p3 = loadImage("p3.png");
  
  canvas.ellipseMode(CENTER);
  canvas.imageMode(CENTER);
}

void draw() {
  background(0);

  canvas.beginDraw();
  canvas.background(0);
  noStroke();
  
  if (cam.available() == true) {
    cam.read();
  }
  
  w = width / tileSize;
  h = height / tileSize;
  
  offsetX = (width - tileSize * w) / 2 + tileSize / 2;
  offsetY = (height - tileSize * h) / 2 + tileSize / 2;

  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      color c = cam.get(width - i * tileSize, j * tileSize);
      float b = brightness(c);
      canvas.push();
      int x = offsetX + i * tileSize;
      int y = offsetY + j * tileSize;
      
      canvas.translate(x, y);
      
      if (checkbox.getItem(0).getValue() == 0)
      {
        float r = noise(i + variation, j + variation);
        if (r < 0.25) canvas.rotate(0);
        else if (r < 0.5) canvas.rotate(PI / 2);
        else if (r < 0.5) canvas.rotate(3 * PI / 2);
        else if (r < 0.5) canvas.rotate(PI);
      }
      
      if (b < 85) canvas.image(p1, 0, 0, tileSize + 1, tileSize + 1);
      else if (b < 170) canvas.image(p2, 0, 0, tileSize + 1, tileSize + 1);
      else  canvas.image(p3, 0, 0, tileSize + 1, tileSize + 1);
      canvas.pop();
    }
  }
  
  mask.beginDraw();
  mask.background(0);
  mask.noStroke();
  
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      int x = offsetX + i * tileSize;
      int y = offsetY + j * tileSize;
      
      if (dist(x, y, width / 2, height / 2) <= radius / 2) {
        mask.rect(x - tileSize / 2, y - tileSize / 2, tileSize, tileSize);
      }
    }
  }
  mask.endDraw();
  
  canvas.endDraw();
  canvas.mask(mask);
  
  fill(255, 180);
  rect(15, 15, 180, 100);
  
  image(canvas, 0, 0);
}
