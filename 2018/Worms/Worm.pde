class Worm
{
  float tx;
  float ty;
  float tz;
  int N = 7;
  PVector points[];

  Worm(float seed)
  {
    tx = seed;
    ty = seed + random(10, 20);
    tz = seed + random(30, 40);
    points = new PVector[N];
  
    for (int i = 0; i < N; i++)
    {
      points[i] = new PVector(-500, -500, -500);
    }
  }
  
  void draw()
  {
    colorMode(HSB);
    noStroke();
    
    tx += 0.01;
    ty += 0.01;
    tz += 0.01;
    
    for (int i = 0; i < N; i++)
    {
      points[i].x = width * (noise(tx + i / 80.0) - .5) + random(0);
      points[i].y = height * (noise(ty + i / 80.0) - .5) + random(0);
      points[i].z = 1000 * (noise(tz + i / 80.0) - .5) + random(0);
    }
    
    for (int i = 0; i < N; i++)
    {
      strokeWeight(8 * i / N);
      stroke(map(i + 1, N, 0, 0, 255), 255, points[i].z);
      // stroke(0);
      // line(points[i].x, points[i].y, points[i].z, points[i + 1].x, points[i + 1].y, points[i + 1].z);
      pushMatrix();
      translate(points[i].x, points[i].y, points[i].z);
      sphereDetail(1);
      sphere(4);
      popMatrix();
    }
  }
}
