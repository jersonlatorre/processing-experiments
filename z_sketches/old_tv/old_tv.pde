float num_tiles = 45.0;
float v = 10;
float size;
PImage plug;

void setup()
{
  size(800, 800, P3D);
  size = width / num_tiles;
  noStroke();
  plug = loadImage("plug.png");
  rectMode(CENTER);
}

void draw()
{
  background(0);
  plug.loadPixels();
  
  for (int i = 0; i < num_tiles; i++)
  {
    for (int j = 0; j < num_tiles; j++)
    {
      if (plug.pixels[i + j * int(num_tiles)] == -1)
      {
        float d = dist(i * num_tiles, j * num_tiles, 0, 0) / v;
        int r = abs(int(d - frameCount / 20.0)) % 5;
        
        fill(colors[r]);
        stroke(0, 40);
        rect(i * size + size / 2, j * size + size / 2, 18, 18);
        fill(50, 0, 0, 40);
        noStroke();
        rect(i * size + size / 2, j * size + size / 2, 8, 8);
      }
      else
      {
        fill(30);
        rect(i * size + size / 2, j * size + size / 2, 20, 20);
        fill(255, 210);
        noStroke();
        ellipse(i * size + size / 2, j * size + size / 2, 3, 3);
      }
    }
  }

  plug.updatePixels();
  
  // saveFrame("frames-3/frame-###.png");
  // if (frameCount == 584) exit();
}
