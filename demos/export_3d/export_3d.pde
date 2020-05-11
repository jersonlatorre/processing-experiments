import nervoussystem.obj.*;

void setup()
{
  size(600, 600, P3D);
  colorMode(HSB);
  background(0);
  noFill();

  translate(width / 2, height / 2, -600);
  beginRecord("nervoussystem.obj.OBJExport", "cubes.obj");
  float x;
  float y;
  float z;

  beginShape();
  for (int i = 0; i < 200; i++)
  {
    x = random(600) - 300;
    y = random(600) - 300;
    z = random(600) - 300;
    stroke(i * 255 / 200.0, 240, 240);
    curveVertex(x, y, z);
  }
  endShape(CLOSE);

  endRecord();
}