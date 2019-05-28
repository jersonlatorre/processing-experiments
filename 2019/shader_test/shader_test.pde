PGraphics canvas;
PShader shader;

void setup()
{
  size(600, 600, P3D);
  shader = loadShader("shader.frag", "shader.vert");
}

void draw()
{
  // shader.set("mouse", (float)mouseX, (float)mouseY);
  shader(shader);
  // background(0);
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  fill(255, 0, 0);
  square(100, 100, 100);
}
