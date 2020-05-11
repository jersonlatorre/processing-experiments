  int N = 20;
int L;
int MARGIN = 75;

void setup()
{
  size(800, 800, P3D);
  smooth(4);
  background(255);
  L = (width - 2 * MARGIN) / N;
}

void draw()
{
  translate(width / 2, height / 2);
  background(255);

  fill(200);
  noStroke();

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      float x = i * L + 0.5 * L - width / 2 + MARGIN;
      float y = j * L + 0.5 * L - height / 2 + MARGIN;
      circle(x, y, 4.5);
    }
  }
}
