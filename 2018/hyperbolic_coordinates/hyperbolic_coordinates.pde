float offset = 0;

void setup()
{
    size(800, 800);
    colorMode(HSB);
    noStroke();
    smooth(4);
}

void draw()
{
    background(0);

    pushMatrix();
    translate(width / 2, height / 2);
    rotate(-PI / 4);

    for (float i = -30; i <= 30; i += 0.4)
    {
        // if (abs(i) < 1.5) continue;
        for (float j = -30; j <= 30; j += 0.4)
        {
            // if (abs(j) < 1.5) continue;
            float x = i;
            float y = j;
            int c = int((map(i - j, -40, 40, 0, 255) + offset + 0) % 255);
            fill(c, 255, 255);
            noStroke();
            ellipse(260 * u(x, y), 260 * v(x, y), 2, 2);
        }
    }

    popMatrix();

    noStroke();
    ellipse(width / 2, height / 2, 7, 7);

    noStroke();
    noiseLine(60, 60, width - 60, 60);
    noiseLine(60, height - 60, width - 60, height - 60);
    noiseLine(width - 60, 60, width - 60, height - 60);
    noiseLine(60, 60, 60, height - 60);
    
    noStroke();
    fill(255);
    ellipse(60, 60, 15, 15);
    ellipse(60, height - 60, 15, 15);
    ellipse(width - 60, 60, 15, 15);
    ellipse(width - 60, height - 60, 15, 15);


    offset += 255 / 80.0;
    if (offset < 255) saveFrame("frames/frame-###.png"); else noLoop();
}

void noiseLine(float x1, float y1, float x2, float y2)
{
    int N = 50;
    PVector[] points = new PVector[N + 1];

    for (int i = 0; i <= N; i++)
    {
        float x = x1 + (x2 - x1) * i / N + random(-3, 3) * sin(i * PI / N);
        float y = y1 + (y2 - y1) * i / N + random(-3, 3) * sin(i * PI / N);
        points[i] = new PVector(x, y);
    }

    for (int i = 0; i < N; i++)
    {
        stroke(255);
        strokeWeight(1);
        line(points[i].x, points[i].y, points[i + 1].x, points[i + 1].y);
    }
}

float u(float x, float y)
{
    return 2 * x / (1 + x * x + y * y);
} 

float v(float x, float y)
{
    return 2 * y / (1 + x * x + y * y);
}