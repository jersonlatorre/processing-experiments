void setup()
{
    size(600, 600);
    colorMode(HSB);
    noStroke();
}

void draw()
{
    background(0);

    for (float i = -10; i <= 10; i += .1)
    {
        for (float j = -10; j <= 10; j += .1)
        {
            float x = i * .5;
            float y = j * .5;
            fill(map(i + j, -2, 2, 0, 255), 255, 255);
            ellipse(width / 2 + 300 * u(x, y), height / 2 + 300 * v(x, y), 2, 2);
        }
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