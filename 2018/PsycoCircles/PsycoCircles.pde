float[] colors = { 0, 60, 95, 175, 235, 250 };
float circleSize;

void setup()
{
    size(700, 700);
    frameRate(1);
    colorMode(HSB, 360, 100, 100, 100);
}

void draw()
{
    // drawBackground();
    circleSize = random(200, 300);
    drawCircle(width / 2, height / 2, circleSize);
    save("pics/hola" + frameCount + ".png");
}

void drawBackground()
{
    float w = height / 8;
    
    for (int i = 0; i < height / w; i++)
    {
        int r = (int)random(100, 150);
        fill(r);
        stroke(r);
        strokeWeight(0);
        rect(0, i * w, width, w);
    }
}

void drawCircle(float x, float y, float size)
{
    fill(colors[int(random(6))], 100, 100, 100);
    stroke(255);
    strokeWeight(0);
    ellipse(x, y, size, size);

    if (size > 10)
    {
        float r1 = random(size / 3, size / 2);
        float r2 = size / 1.5;
        float angle = random(2 * PI);
        float x1 = r1 * cos(angle);
        float y1 = r1 * sin(angle);
        float x2 = r1 * cos(angle + PI);
        float y2 = r1 * sin(angle + PI);
        drawCircle(x + x1, y + y1, r2);
        drawCircle(x + x2, y + y2, r2);
        noStroke();
        //strokeWeight(0);
        line(x, y, x + x1, y + y1);
        line(x, y, x + x2, y + y2);
    }
}
