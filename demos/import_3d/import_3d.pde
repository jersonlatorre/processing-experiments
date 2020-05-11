import peasy.*;

PShape shape;
PeasyCam cam;

void setup()
{
  size(600, 600, P3D);
  shape = loadShape("test.obj");
  cam = new PeasyCam(this, 1000);
}

void draw()
{
  background(255);
  lights();
  // shape.disableStyle();
  // println(shape.getChildCount());
  // shape.getChild(0).setVertex(0, 100, 100, 100);
  shape(shape, 0, 0);
}